# Advent of Code 2026 🎄

My solutions for [Advent of Code 2026](https://adventofcode.com/2026) written in Rust.

## Project Structure

This project uses a Cargo workspace with separate binary crates for each day:

```
advent-of-code-2026/
├── Cargo.toml          # Workspace configuration
├── utils/              # Shared utility library
│   └── src/
│       ├── grid.rs     # Grid utilities
│       ├── math.rs     # Math utilities (gcd, lcm, etc.)
│       ├── parsing.rs  # Input parsing helpers
│       └── point.rs    # 2D point and direction types
├── day01/              # Day 1 solution
│   └── src/main.rs     # part1() and part2()
├── day02/              # Day 2 solution
├── ...
├── runner/             # Optional: run all solutions
├── inputs/             # Puzzle inputs (not committed)
│   ├── day01.txt
│   ├── day02.txt
│   └── examples/       # Example inputs
└── scripts/
    └── new_day.sh      # Scaffold new days
```

## Quick Start

### Running Solutions

Run a specific day's solution:
```bash
cargo run -p day01
```

This will output both Part 1 and Part 2 results.

### Testing Solutions

Test a specific day:
```bash
cargo test -p day01
```

Run all tests:
```bash
cargo test
```

### Creating a New Day

Use the helper script to scaffold a new day:
```bash
./scripts/new_day.sh 5
```

This will:
- Create `day05/` directory with boilerplate code
- Create `inputs/day05.txt` for your puzzle input
- Add the day to the workspace members

Then:
1. Download your puzzle input to `inputs/day05.txt`
2. Implement solutions in `day05/src/main.rs`
3. Run with `cargo run -p day05`

## Development Workflow

1. **Start a new day**: `./scripts/new_day.sh <day_number>`
2. **Add example input**: Update the `EXAMPLE` constant in tests
3. **Implement Part 1**: Write logic in `part1()` function
4. **Test with example**: `cargo test -p day<XX>`
5. **Run with real input**: `cargo run -p day<XX>`
6. **Implement Part 2**: Write logic in `part2()` function
7. **Test and submit**: Repeat steps 4-5

## Shared Utilities

The `utils` crate provides common functionality:

- **Grid utilities**: 2D grid operations, pathfinding helpers
- **Math utilities**: GCD, LCM, Chinese Remainder Theorem, etc.
- **Parsing utilities**: Extract numbers, parse grids, split blocks
- **Point/Direction types**: 2D coordinates with neighbor operations

Example usage in a day's solution:
```rust
use utils::*;

fn part1(input: &str) -> String {
    let grid = Grid::from_str(input);
    let numbers = parse_numbers_from_line(input);
    // ...
}
```

## Progress

| Day | Part 1 | Part 2 | Notes |
|-----|--------|--------|-------|
| [01](day01/src/main.rs) | ⭐ | ⭐ |  |
| [02](day02/src/main.rs) | ⭐ | ⭐ |  |
| [03](day03/src/main.rs) | ⭐ | ⭐ |  |
| [04](day04/src/main.rs) | ⭐ | ⭐ |  |
| [05](day05/src/main.rs) | ⭐ | ⭐ |  |
| [06](day06/src/main.rs) | ⭐ | ⭐ |  |
| [07](day07/src/main.rs) | ⭐ | ⭐ |  |
| [08](day08/src/main.rs) | ⭐ | ⭐ |  |
| [09](day09/src/main.rs) | ⭐ | ⭐ |  |
| [10](day10/src/main.rs) | ⭐ | ⭐ |  |
| [11](day11/src/main.rs) | ⭐ | ⭐ |  |
| [12](day12/src/main.rs) | ⭐ | ⭐ |  |
| [13](day13/src/main.rs) | ⭐ | ⭐ |  |
| [14](day14/src/main.rs) | ⭐ | ⭐ |  |
| [15](day15/src/main.rs) | ⭐ | ⭐ |  |
| [16](day16/src/main.rs) | ⭐ | ⭐ |  |
| [17](day17/src/main.rs) | ⭐ | ⭐ |  |
| [18](day18/src/main.rs) | ⭐ | ⭐ |  |
| [19](day19/src/main.rs) | ⭐ | ⭐ |  |
| [20](day20/src/main.rs) | ⭐ | ⭐ |  |
| [21](day21/src/main.rs) | ⭐ | ⭐ |  |
| [22](day22/src/main.rs) | ⭐ | ⭐ |  |
| [23](day23/src/main.rs) | ⭐ | ⭐ |  |
| [24](day24/src/main.rs) | ⭐ | ⭐ |  |
| [25](day25/src/main.rs) | ⭐ | ⭐ |  |

## Dependencies

- **itertools** - Iterator utilities for common operations
- **regex** - Pattern matching and text parsing
- **rayon** - Parallel processing for performance-critical solutions
- **anyhow** - Error handling

## Tips

- **Performance**: Use `cargo run --release -p day<XX>` for optimized builds
- **Debugging**: Debug builds are faster to compile but ~10x slower at runtime
- **Input files**: Keep your puzzle inputs private (they're gitignored)
- **Tests**: Use `#[ignore]` for tests with real inputs to speed up test runs

## License

This project is for educational purposes. Puzzle inputs and problem statements are property of [Advent of Code](https://adventofcode.com/).
