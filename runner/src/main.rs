// Runner for all Advent of Code 2025 solutions
//
// Note: To use this runner, each day crate needs to expose its solutions
// as a library. For now, this is a placeholder.
//
// To run individual days, use:
//   cargo run -p day01
//   cargo run -p day02
//   etc.

use std::fs;
use std::time::Instant;

fn main() {
    println!("Advent of Code 2025 - Solution Runner");
    println!("=====================================\n");

    // Example of how to run all days when they expose library interfaces
    // For now, run individual days with: cargo run -p dayXX

    let days = vec![
        ("Day 01", run_day01),
        // Add more days here as they are implemented
        // ("Day 02", run_day02),
    ];

    for (name, runner) in days {
        println!("{}", name);
        let start = Instant::now();
        runner();
        let duration = start.elapsed();
        println!("  Time: {:?}\n", duration);
    }
}

fn run_day01() {
    // This is a placeholder. To use the runner properly, day01 would need
    // to expose its functions via a lib.rs file.
    println!("  Run with: cargo run -p day01");
}

// Helper function to read input files
#[allow(dead_code)]
fn read_input(day: u8) -> String {
    let path = format!("inputs/day{:02}.txt", day);
    fs::read_to_string(&path)
        .unwrap_or_else(|_| panic!("Failed to read input file: {}", path))
}
