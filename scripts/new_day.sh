#!/bin/bash

# Script to scaffold a new Advent of Code day
# Usage: ./scripts/new_day.sh <day_number>
# Example: ./scripts/new_day.sh 5
<<<<<<< HEAD
=======
#
# Environment variables:
#   AOC_SESSION - Your Advent of Code session cookie (optional)
#                 If set, automatically fetches puzzle input and example
>>>>>>> c2fd853 (Initial commit: Advent of Code 2025 Rust workspace)

if [ -z "$1" ]; then
    echo "Usage: $0 <day_number>"
    echo "Example: $0 5"
<<<<<<< HEAD
=======
    echo ""
    echo "Set AOC_SESSION environment variable to auto-fetch inputs:"
    echo "  export AOC_SESSION=your_session_cookie"
    echo "  ./scripts/new_day.sh 5"
>>>>>>> c2fd853 (Initial commit: Advent of Code 2025 Rust workspace)
    exit 1
fi

DAY_NUM=$1
DAY_PADDED=$(printf "%02d" $DAY_NUM)
DAY_DIR="day${DAY_PADDED}"
<<<<<<< HEAD

# Check if day already exists
if [ -d "$DAY_DIR" ]; then
    echo "Error: $DAY_DIR already exists!"
    exit 1
fi

echo "Creating $DAY_DIR..."

# Create directory structure
mkdir -p "$DAY_DIR/src"
=======
INPUT_FILE="inputs/day${DAY_PADDED}.txt"
YEAR=2025

# Check if day already exists
DAY_EXISTS=false
if [ -d "$DAY_DIR" ]; then
    DAY_EXISTS=true
    # Check if input file is missing or empty
    if [ ! -f "$INPUT_FILE" ] || [ ! -s "$INPUT_FILE" ]; then
        if [ -n "$AOC_SESSION" ]; then
            echo "$DAY_DIR already exists, but input file is missing/empty"
            echo "Fetching puzzle input..."
        else
            echo "Error: $DAY_DIR already exists and no AOC_SESSION set to fetch input"
            exit 1
        fi
    else
        echo "Error: $DAY_DIR already exists with input file!"
        exit 1
    fi
fi

if [ "$DAY_EXISTS" = false ]; then
    echo "Creating $DAY_DIR..."
fi

# Create directory structure (only if new day)
if [ "$DAY_EXISTS" = false ]; then
    mkdir -p "$DAY_DIR/src"
fi
mkdir -p "inputs"

# Fetch puzzle input and example if AOC_SESSION is set
EXAMPLE_INPUT="example input here"
if [ -n "$AOC_SESSION" ]; then
    echo "Fetching puzzle data from Advent of Code..."

    # Fetch puzzle input
    INPUT_URL="https://adventofcode.com/${YEAR}/day/${DAY_NUM}/input"
    if curl -sf --cookie "session=${AOC_SESSION}" "${INPUT_URL}" -o "$INPUT_FILE"; then
        echo "✓ Downloaded puzzle input"
    else
        echo "⚠ Failed to fetch puzzle input (day may not be available yet)"
        touch "$INPUT_FILE"
    fi

    # Fetch puzzle page and extract first example (only for new days)
    if [ "$DAY_EXISTS" = false ]; then
        PUZZLE_URL="https://adventofcode.com/${YEAR}/day/${DAY_NUM}"
        PUZZLE_HTML=$(curl -sf --cookie "session=${AOC_SESSION}" "${PUZZLE_URL}")

        if [ -n "$PUZZLE_HTML" ]; then
            # Extract the first <pre><code> block as the example
            # This uses sed to extract content between <pre><code> and </code></pre>
            EXTRACTED=$(echo "$PUZZLE_HTML" | sed -n '/<pre><code>/,/<\/code><\/pre>/p' | sed '1d;$d' | head -n 100)

            if [ -n "$EXTRACTED" ]; then
                # Escape backslashes and double quotes for Rust string literal
                EXAMPLE_INPUT=$(echo "$EXTRACTED" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g')
                echo "✓ Extracted example input"
            else
                echo "⚠ Could not extract example input from puzzle page"
            fi
        else
            echo "⚠ Failed to fetch puzzle page"
        fi
    fi
else
    # Create empty input file if not fetching
    touch "$INPUT_FILE"
fi

# Only create files if day doesn't exist
if [ "$DAY_EXISTS" = true ]; then
    echo ""
    echo "✓ Updated $INPUT_FILE"
    exit 0
fi
>>>>>>> c2fd853 (Initial commit: Advent of Code 2025 Rust workspace)

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

<<<<<<< HEAD
# Create main.rs
=======
# Create main.rs with example input
>>>>>>> c2fd853 (Initial commit: Advent of Code 2025 Rust workspace)
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

<<<<<<< HEAD
    const EXAMPLE: &str = "example input here";
=======
    const EXAMPLE: &str = "${EXAMPLE_INPUT}";
>>>>>>> c2fd853 (Initial commit: Advent of Code 2025 Rust workspace)

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

<<<<<<< HEAD
# Create empty input file
touch "inputs/day${DAY_PADDED}.txt"

=======
>>>>>>> c2fd853 (Initial commit: Advent of Code 2025 Rust workspace)
# Add to workspace Cargo.toml
# Check if the day is already in the workspace members
if ! grep -q "\"day${DAY_PADDED}\"" Cargo.toml; then
    # Find the line with the last day and add after it
    sed -i "/\"day[0-9][0-9]\",/a\\    \"day${DAY_PADDED}\"," Cargo.toml
<<<<<<< HEAD
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
=======
    echo "✓ Added day${DAY_PADDED} to workspace members"
fi

echo ""
echo "✓ Created $DAY_DIR with boilerplate code"
echo "✓ Created inputs/day${DAY_PADDED}.txt"

if [ -z "$AOC_SESSION" ]; then
    echo ""
    echo "Next steps:"
    echo "  1. Download your input to inputs/day${DAY_PADDED}.txt"
    echo "  2. Add example input to EXAMPLE constant in $DAY_DIR/src/main.rs"
    echo "  3. Implement solutions in $DAY_DIR/src/main.rs"
    echo "  4. Test with: cargo test -p day${DAY_PADDED}"
    echo "  5. Run with: cargo run -p day${DAY_PADDED}"
    echo ""
    echo "Tip: Set AOC_SESSION to auto-fetch inputs and examples"
else
    echo ""
    echo "Next steps:"
    echo "  1. Implement solutions in $DAY_DIR/src/main.rs"
    echo "  2. Test with: cargo test -p day${DAY_PADDED}"
    echo "  3. Run with: cargo run -p day${DAY_PADDED}"
fi
>>>>>>> c2fd853 (Initial commit: Advent of Code 2025 Rust workspace)
