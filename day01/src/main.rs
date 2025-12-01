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
    let input = include_str!("../../inputs/day01.txt");

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
        let input = include_str!("../../inputs/day01.txt");
        assert_eq!(part1(input), "your answer here");
    }

    #[test]
    #[ignore]
    fn test_part2_real() {
        let input = include_str!("../../inputs/day01.txt");
        assert_eq!(part2(input), "your answer here");
    }
}
