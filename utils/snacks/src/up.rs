use std::env;

use clap::{Parser, ValueEnum};
use duct::cmd;

#[derive(Parser)]
pub struct Opts {
    /// Tasks name
    #[arg(value_enum)]
    pub tasks: Option<Vec<Task>>,
}

#[derive(Debug, Clone, ValueEnum)]
pub enum Task {
    Cargo,
    Flatpak,
    System,
    Node,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();

    match opts.tasks {
        None => run_all()?,
        Some(tasks) => run_some(tasks)?,
    }

    println!("\n✨ You have a new shiny machine!");
    Ok(())
}

fn run_all() -> anyhow::Result<()> {
    flatpak()?;
    cargo()?;
    system()?;
    node()?;
    Ok(())
}

fn run_some(modules: Vec<Task>) -> anyhow::Result<()> {
    for module in modules {
        match module {
            Task::Flatpak => flatpak()?,
            Task::Cargo => cargo()?,
            Task::System => system()?,
            Task::Node => node()?,
        }
    }
    Ok(())
}

fn flatpak() -> anyhow::Result<()> {
    println!("📦 Upgrading Flatpak apps");
    cmd!("flatpak", "update").unchecked().run()?;
    Ok(())
}

fn cargo() -> anyhow::Result<()> {
    println!("🦀 Upgrading Cargo apps");
    cmd!("cargo", "install-update", "-a").run()?;
    cmd!("rustup", "update", "stable").run()?;
    Ok(())
}

fn system() -> anyhow::Result<()> {
    println!("🐧 Upgrading System apps");
    // Use `unchecked()` to allow the next command to run even if `No` is chosen at the prompt.
    cmd!("sudo", "dnf", "update").unchecked().run()?;
    Ok(())
}

fn node() -> anyhow::Result<()> {
    println!("🦖 Upgrading Node apps");
    let dir = format!("{}/opt/nodebin", env::var("HOME")?);
    cmd!("npx", "taze", "major", "--write").dir(&dir).run()?;
    cmd!("npm", "install").dir(&dir).run()?;
    Ok(())
}

// Local Variables:
// mode: rust-ts
// End:
