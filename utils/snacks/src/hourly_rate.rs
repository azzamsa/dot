use crate::utils;
use clap::Parser;
use num_format::{Locale, ToFormattedString};

#[derive(Parser)]
pub struct Opts {
    /// Monthly Salary
    pub salary: i64,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    // Inputs
    let monthly_salary = opts.salary;
    let hours_per_day = 8; // -1h lunch break
    let days_per_week = 5;

    // Calculations
    let weeks_per_year = 52;
    let months_per_year = 12;

    let annual_hours = hours_per_day * days_per_week * weeks_per_year;
    let hourly_rate = (monthly_salary * months_per_year) / annual_hours;

    utils::stdout(&format!(
        "Monthly Salary      : Rp {}",
        monthly_salary.to_formatted_string(&Locale::id),
    ));
    utils::stdout(&format!(
        "Hourly Rate         : Rp {}/hour",
        hourly_rate.to_formatted_string(&Locale::id),
    ));

    Ok(())
}
