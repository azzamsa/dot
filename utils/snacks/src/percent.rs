use crate::utils;
use clap::Parser;
use num_format::{Locale, ToFormattedString};

/// Calculate the percentage difference between a total and a part.
#[derive(Parser)]
pub struct Opts {
    /// The total (larger) value
    pub total: i64,
    /// The part (smaller) value to compare against the total
    pub part: i64,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();
    utils::stdoutln(&format!(
        "(1) Total: {}",
        opts.total.to_formatted_string(&Locale::id),
    ));
    utils::stdoutln(&format!(
        "(2) Part : {}",
        opts.part.to_formatted_string(&Locale::id),
    ));
    let percent_cut = percent(opts.total as f64, opts.part as f64);
    utils::stdoutln(&format!("Percent cut: {:.2}%", percent_cut));
    Ok(())
}

// Returns what percentage `part` is of `total`.
// Example: percent(100.0, 16.0) == 16.0
fn percent(total: f64, part: f64) -> f64 {
    (part / total) * 100.0
}
