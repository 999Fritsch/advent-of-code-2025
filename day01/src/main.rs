
fn part1(input: &str) -> i32 {
    let mut dial: i32 = 50;
    let mut counter = 0;
    
    for line in input.lines() {
        let distance: i32 = line[1..].parse().unwrap();
        
        if line.starts_with('L') {
            dial -= distance;
        } else {
            dial += distance;
        }
        
        dial = dial.rem_euclid(100);
        
        if dial == 0 {
            counter += 1;
        }
    }
    
    return counter;
}

fn part2(input: &str) -> i32 {
    let mut dial = 50;
        let mut counter = 0;
        
        for line in input.lines() {
            let distance: i32 = line[1..].parse().unwrap();
            
            if line.starts_with('L') {
                if dial == 0 {
                    counter += distance / 100;
                } else if distance >= dial {
                    counter += 1 + (distance - dial) / 100;
                }
                dial = (dial - distance).rem_euclid(100);
            } else {
                counter += (dial + distance) / 100;
                dial = (dial + distance).rem_euclid(100);
            }
        }
        
    return counter;
}

fn main() {
    let input = include_str!("../../inputs/day01.txt");

    println!("Part 1: {}", part1(input));
    println!("Part 2: {}", part2(input));
}

#[cfg(test)]
mod tests {
    use super::*;

    const EXAMPLE: &str = "L68
L30
R48
L5
R60
L55
L1
L99
R14
L82";

    #[test]
    fn test_part1_example() {
        assert_eq!(part1(EXAMPLE), 3);
    }

    #[test]
    fn test_part2_example() {
        assert_eq!(part2(EXAMPLE), 6);
    }

    #[test]
    #[ignore]
    fn test_part1_real() {
        let input = include_str!("../../inputs/day01.txt");
        assert_eq!(part1(input), 962);
    }

    #[test]
    #[ignore]
    fn test_part2_real() {
        let input = include_str!("../../inputs/day01.txt");
        assert_eq!(part2(input), 5782);
    }
}
