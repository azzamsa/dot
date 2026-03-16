use std::{collections::HashMap, env, fs, path::PathBuf};

use clap::{Parser, ValueEnum};

use crate::utils;

#[derive(Parser)]
pub struct Opts {
    /// Category of choice
    #[arg(value_enum)]
    pub category: Option<Category>,

    #[arg(long)]
    pub file: Option<PathBuf>,
}

#[derive(Debug, Clone, ValueEnum)]
pub enum Category {
    Foods,
    Nature,
    Animals,
}

impl Category {
    fn as_key(&self) -> &str {
        match self {
            Category::Foods => "foods",
            Category::Nature => "nature",
            Category::Animals => "animals",
        }
    }
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    let emoji = get_emoji(opts.category, opts.file)?;
    utils::stdout(&emoji);
    Ok(())
}

pub fn get_emoji(category: Option<Category>, file: Option<PathBuf>) -> anyhow::Result<String> {
    let content = get_content(file)?;
    let categories: HashMap<String, Vec<String>> = toml::from_str(&content)?;

    let emojis: Vec<&String> = match &category {
        Some(cat) => categories.get(cat.as_key()).unwrap().iter().collect(),
        None => categories.values().flatten().collect(),
    };

    let index = utils::get_random_number(emojis.len());
    Ok(emojis[index].to_string())
}

pub fn get_content(file: Option<PathBuf>) -> anyhow::Result<String> {
    let file = file.unwrap_or_else(|| {
        let home = env::var("HOME").expect("HOME not set");
        PathBuf::from(home).join(".config/meta/emojis.toml")
    });
    Ok(fs::read_to_string(file)?)
}
