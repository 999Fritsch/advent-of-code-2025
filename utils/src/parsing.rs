use regex::Regex;

pub fn parse_numbers<T>(s: &str) -> Vec<T>
where
    T: std::str::FromStr,
    T::Err: std::fmt::Debug,
{
    s.split_whitespace()
        .filter_map(|word| word.parse::<T>().ok())
        .collect()
}

pub fn parse_numbers_from_line<T>(s: &str) -> Vec<T>
where
    T: std::str::FromStr,
    T::Err: std::fmt::Debug,
{
    let re = Regex::new(r"-?\d+").unwrap();
    re.find_iter(s)
        .filter_map(|m| m.as_str().parse::<T>().ok())
        .collect()
}

pub fn parse_grid(s: &str) -> Vec<Vec<char>> {
    s.lines().map(|line| line.chars().collect()).collect()
}

pub fn parse_blocks(s: &str) -> Vec<&str> {
    s.split("\n\n").collect()
}

pub fn parse_csv_line<T>(s: &str) -> Vec<T>
where
    T: std::str::FromStr,
    T::Err: std::fmt::Debug,
{
    s.split(',')
        .filter_map(|item| item.trim().parse::<T>().ok())
        .collect()
}
