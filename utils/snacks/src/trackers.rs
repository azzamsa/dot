use std::{fs, path::PathBuf};

use clap::Parser;

use crate::utils;

#[derive(Parser)]
pub struct Opts {
    /// Path to the file
    pub path: PathBuf,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    let content = fs::read_to_string(&opts.path)?;
    //  Stop processing if separator is found
    let content = content.split("------").next().unwrap_or("");

    let items = [
        ("Desk", "🍚"),
        ("Career/Teach", "🦄"),
        ("Hobby", "🕹️"),
        ("Leisure/Rest/Pray", "🏖️"),
        ("Chores/Social Activity", "🧹"),
        ("Workout", "🚲"),
        ("Sleep", "😴"),
        ("Low-value", "🪫"),
        ("Empty", "⬜"),
    ];

    let mut total: usize = 0;
    let mut counts = std::collections::HashMap::new();

    for (_, emoji) in items {
        let count = content.matches(emoji).count();
        counts.insert(emoji, count);
        total += count;
    }

    for (label, emoji) in items {
        let count = *counts.get(emoji).unwrap_or(&0);
        let share = if total > 0 {
            (count as f64 / total as f64) * 100.0
        } else {
            0.0
        };

        utils::stdout(&format!(
            "- {} ({}): {} hours ({:.1}%)",
            label, emoji, count, share
        ));
    }
    utils::stdout(&format!("\nTotal: {} hours (100%)", total));

    Ok(())
}
