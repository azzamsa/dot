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
    let content = content.split("Summary:").next().unwrap_or("");

    let items = [
        ("Desk", "🍚"),
        ("Career", "🦄"),
        ("Family", "💍"),
        ("Hobby", "🕹️"),
        ("Leisure", "🏖️"),
        ("Pray", "🕋"),
        ("Chores", "🧹"),
        ("Social", "🫂"),
        ("Workout", "🚲"),
        ("Sleep", "😴"),
        ("Low-value", "🪫"),
        ("Empty", "⬜"),
    ];

    // Calculate counts and store them in a Vector
    let mut stats = Vec::new();
    let mut total = 0;

    for (label, emoji) in items {
        let count = content.matches(emoji).count();
        stats.push((label, emoji, count));
        total += count;
    }

    // Sort the vector by count (highest to lowest)
    stats.sort_by(|a, b| b.2.cmp(&a.2));

    for (label, emoji, count) in stats {
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
