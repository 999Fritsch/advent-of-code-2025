#!/bin/bash

# Script to scaffold a new Advent of Code day
# Usage: ./scripts/new_day.sh <day_number>
# Example: ./scripts/new_day.sh 5

if [ -z "$1" ]; then
    echo "Usage: $0 <day_number>"
    echo "Example: $0 5"
    exit 1
fi

DAY_NUM=$1
DAY_PADDED=$(printf "%02d" $DAY_NUM)
DAY_DIR="day${DAY_PADDED}"

# Check if day already exists
if [ -d "$DAY_DIR" ]; then
    echo "Error: $DAY_DIR already exists!"
    exit 1
fi

echo "Creating $DAY_DIR..."

# Create directory structure
mkdir -p "$DAY_DIR/src"

# Create Cargo.toml
cat > "$DAY_DIR/Cargo.toml" <<EOF
[package]
name = "day${DAY_PADDED}"
version = "0.1.0"
edition = "2021"

[dependencies]
utils = { workspace = true }
itertools = { workspace = true }
anyhow = { workspace = true }
EOF

# Create main.rs
cat > "$DAY_DIR/src/main.rs" <<EOF
use utils::*;

fn part1(input: &str) -> String {
    // TODO: Implement part 1 solution
    "Not implemented".to_string()
}

fn part2(input: &str) -> String {
    // TODO: Implement part 2 solution
    "Not implemented".to_string()
}

fn main() {
    let input = include_str!("../../inputs/day${DAY_PADDED}.txt");

    println!("Part 1: {}", part1(input));
    println!("Part 2: {}", part2(input));
}

#[cfg(test)]
mod tests {
    use super::*;

    const EXAMPLE: &str = "example input here";

    #[test]
    fn test_part1_example() {
        assert_eq!(part1(EXAMPLE), "expected output");
    }

    #[test]
    fn test_part2_example() {
        assert_eq!(part2(EXAMPLE), "expected output");
    }

    #[test]
    #[ignore]
    fn test_part1_real() {
        let input = include_str!("../../inputs/day${DAY_PADDED}.txt");
        assert_eq!(part1(input), "your answer here");
    }

    #[test]
    #[ignore]
    fn test_part2_real() {
        let input = include_str!("../../inputs/day${DAY_PADDED}.txt");
        assert_eq!(part2(input), "your answer here");
    }
}
EOF

# Create empty input file
touch "inputs/day${DAY_PADDED}.txt"

# Add to workspace Cargo.toml
# Check if the day is already in the workspace members
if ! grep -q "\"day${DAY_PADDED}\"" Cargo.toml; then
    # Find the line with the last day and add after it
    sed -i "/\"day[0-9][0-9]\",/a\\    \"day${DAY_PADDED}\"," Cargo.toml
    echo "Added day${DAY_PADDED} to workspace members"
fi

echo "✓ Created $DAY_DIR"
echo "✓ Created inputs/day${DAY_PADDED}.txt"
echo ""
echo "Next steps:"
echo "  1. Download your input to inputs/day${DAY_PADDED}.txt"
echo "  2. Implement solutions in $DAY_DIR/src/main.rs"
echo "  3. Run with: cargo run -p day${DAY_PADDED}"
echo "  4. Test with: cargo test -p day${DAY_PADDED}"
