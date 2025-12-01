use std::ops::{Add, Sub};

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub struct Point {
    pub x: i32,
    pub y: i32,
}

impl Point {
    pub fn new(x: i32, y: i32) -> Self {
        Self { x, y }
    }

    pub fn manhattan_distance(&self, other: &Point) -> i32 {
        (self.x - other.x).abs() + (self.y - other.y).abs()
    }

    pub fn neighbors(&self) -> Vec<Point> {
        vec![
            Point::new(self.x, self.y - 1), // North
            Point::new(self.x + 1, self.y), // East
            Point::new(self.x, self.y + 1), // South
            Point::new(self.x - 1, self.y), // West
        ]
    }

    pub fn neighbors_diagonal(&self) -> Vec<Point> {
        vec![
            Point::new(self.x - 1, self.y - 1),
            Point::new(self.x, self.y - 1),
            Point::new(self.x + 1, self.y - 1),
            Point::new(self.x - 1, self.y),
            Point::new(self.x + 1, self.y),
            Point::new(self.x - 1, self.y + 1),
            Point::new(self.x, self.y + 1),
            Point::new(self.x + 1, self.y + 1),
        ]
    }
}

impl Add for Point {
    type Output = Point;

    fn add(self, other: Point) -> Point {
        Point::new(self.x + other.x, self.y + other.y)
    }
}

impl Sub for Point {
    type Output = Point;

    fn sub(self, other: Point) -> Point {
        Point::new(self.x - other.x, self.y - other.y)
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum Direction {
    North,
    East,
    South,
    West,
}

impl Direction {
    pub fn delta(&self) -> Point {
        match self {
            Direction::North => Point::new(0, -1),
            Direction::East => Point::new(1, 0),
            Direction::South => Point::new(0, 1),
            Direction::West => Point::new(-1, 0),
        }
    }

    pub fn turn_right(&self) -> Direction {
        match self {
            Direction::North => Direction::East,
            Direction::East => Direction::South,
            Direction::South => Direction::West,
            Direction::West => Direction::North,
        }
    }

    pub fn turn_left(&self) -> Direction {
        match self {
            Direction::North => Direction::West,
            Direction::West => Direction::South,
            Direction::South => Direction::East,
            Direction::East => Direction::North,
        }
    }
}
