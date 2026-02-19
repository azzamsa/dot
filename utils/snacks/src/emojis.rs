use clap::{Parser, ValueEnum};

use crate::utils;

static ANIMALS: &[&str] = &[
    "🐒",
    "🦍",
    "🦧",
    "🐶",
    "🐺",
    "🦊",
    "🦝",
    "🐱",
    "🦁",
    "🐯",
    "🐅",
    "🐆",
    "🐴",
    "🫎",
    "🫏",
    "🐎",
    "🦄",
    "🦓",
    "🦌",
    "🦬",
    "🐮",
    "🐂",
    "🐃",
    "🐄",
    "🐏",
    "🐑",
    "🐐",
    "🐫",
    "🦙",
    "🦒",
    "🐘",
    "🦣",
    "🦏",
    "🦛",
    "🐹",
    "🐰",
    "🐇",
    "🐿️",
    "🦫",
    "🦔",
    "🦇",
    "🐻",
    "🐻‍❄️",
    "🐨",
    "🐼",
    "🦥",
    "🦦",
    "🦨",
    "🦘",
    "🦡",
    "🦃",
    "🐔",
    "🐓",
    "🐣",
    "🐦",
    "🐧",
    "🕊️",
    "🦅",
    "🦆",
    "🦢",
    "🦉",
    "🦤",
    "🪶",
    "🦩",
    "🦚",
    "🦜",
    "🪽",
    "🐦‍⬛",
    "🪿",
    "🐦‍🔥",
    "🪺",
    "🐸",
    "🐊",
    "🐢",
    "🐍",
    "🐲",
    "🦕",
    "🦖",
    "🐳",
    "🐬",
    "🦭",
    "🐟",
    "🐠",
    "🐡",
    "🦈",
    "🐙",
    "🐚",
    "🪸",
    "🪼",
    "🦀",
    "🦞",
    "🦐",
    "🦑",
    "🦪",
    "🐌",
    "🦋",
    "🐛",
    "🐜",
    "🐝",
    "🪲",
    "🐞",
    "🦗",
    "🕷️",
    "🕸️",
    "🦂",
    "🪱",
];

static NATURE: &[&str] = &[
    "💐", "🌸", "🪷", "🏵️", "🌹", "🌺", "🌻", "🌼", "🌷", "🪻", "🌱", "🪴", "🌲", "🌳", "🌴", "🌵",
    "🌾", "🌿", "🍁", "🍂", "🍃", "🍄", "🪨", "🪵", "🌒", "🌔", "🌕", "🌖", "🌗", "🌘", "🌙", "🌚",
    "🌛", "🌜", "☀️", "🌝", "🌞", "🪐", "⭐", "🌟", "🌠", "🌌", "☁️", "⛅", "⛈️", "🌤️", "🌥️", "🌦️",
    "🌧️", "🌨️", "🌩️", "🌪️", "🌬️", "🌀", "🌂", "☂️", "☔", "⛱️", "⚡", "❄️", "☃️", "⛄", "☄️", "🔥",
    "💧", "🌊",
];

static FOODS: &[&str] = &[
    "🍞", "🥐", "🥖", "🫓", "🥨", "🥯", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕",
    "🌭", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🫕", "🥣", "🥗", "🍿", "🧈",
    "🧂", "🥫", "🍝", "🍱", "🍘", "🍙", "🍚", "🍛", "🍜", "🍠", "🍢", "🍣", "🍤", "🍥", "🥮", "🍡",
    "🥟", "🥠", "🥡", "🍦", "🍧", "🍨", "🍩", "🍪", "🎂", "🍰", "🧁", "🥧", "🍫", "🍬", "🍭", "🍮",
    "🍯", "🥛", "☕", "🫖", "🍵", "🍶", "🍾", "🍷", "🍸", "🍹", "🍺", "🍻", "🥂", "🥃", "🫗", "🥤",
    "🧋", "🧃", "🧉",
];

#[derive(Parser)]
pub struct Opts {
    /// Category of choice
    #[arg(value_enum)]
    pub category: Option<Category>,
}

#[derive(Debug, Clone, ValueEnum)]
pub enum Category {
    Foods,
    Nature,
    Animals,
}

pub(crate) fn run() -> anyhow::Result<()> {
    let opts = Opts::parse();
    let emoji = emoji(opts.category);
    utils::stdout(&emoji);
    Ok(())
}

pub fn emoji(category: Option<Category>) -> String {
    let emoji = match category {
        Some(Category::Animals) => {
            let index = utils::get_random_number(ANIMALS.len());
            ANIMALS[index]
        }
        Some(Category::Nature) => {
            let index = utils::get_random_number(NATURE.len());
            NATURE[index]
        }
        Some(Category::Foods) => {
            let index = utils::get_random_number(FOODS.len());
            FOODS[index]
        }
        None => {
            let merged: Vec<_> = ANIMALS
                .iter()
                .chain(NATURE.iter())
                .chain(FOODS.iter())
                .copied()
                .collect();
            let index = utils::get_random_number(merged.len());
            merged[index]
        }
    };
    emoji.to_string()
}
