use std::io::{self, Write};

pub fn stdoutln(input: &str) {
    writeln!(io::stdout(), "{input}").ok();
}
