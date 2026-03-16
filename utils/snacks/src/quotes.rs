use clap::Parser;
use std::path::PathBuf;

use crate::emojis;
use crate::utils;

static QUOTES: &[&str] = &[
    // Sarah Andersen
    "Practice. It is Practice. Practice",
    "Do it scared",
    "Done is better than perfect",
    "Do first things first",
    "We are what we repeatedly do",
    "Failure is success in progress",
    "One step at a time",
    "Action cures fear",
    "Don’t break the chain",
    "Discipline equals freedom",
];

#[derive(Parser)]
pub struct Opts {
    /// Wrap with quotes.
    #[arg(short, long)]
    pub quoted: bool,
    /// End with dot.
    #[arg(short, long)]
    pub period: bool,
    /// Prefix with emoji.
    #[arg(short, long)]
    pub emoji: bool,
    /// Path to a custom quotes file (one quote per line).
    #[arg(short, long)]
    pub file: Option<PathBuf>,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    let custom: Vec<String> = if let Some(path) = opts.file {
        std::fs::read_to_string(path)?
            .lines()
            .filter(|l| !l.trim().is_empty())
            .map(|l| l.to_string())
            .collect()
    } else {
        vec![]
    };

    let all: Vec<&str> = QUOTES
        .iter()
        .copied()
        .chain(custom.iter().map(|s| s.as_str()))
        .collect();

    let index = utils::get_random_number(all.len());
    let mut quote = all[index].to_string();

    if opts.period {
        quote.push('.')
    };

    if opts.quoted {
        quote = format!(r#""{quote}""#);
    }

    if opts.emoji {
        let emoji = emojis::get_emoji(None, None)?;
        quote = format!("{emoji} {quote}");
    }

    utils::stdout(&quote);
    Ok(())
}
