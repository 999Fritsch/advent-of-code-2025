use crate::point::Point;

#[derive(Debug, Clone)]
pub struct Grid<T> {
    pub cells: Vec<Vec<T>>,
    pub width: usize,
    pub height: usize,
}

impl<T> Grid<T> {
    pub fn new(cells: Vec<Vec<T>>) -> Self {
        let height = cells.len();
        let width = if height > 0 { cells[0].len() } else { 0 };
        Self {
            cells,
            width,
            height,
        }
    }

    pub fn get(&self, point: &Point) -> Option<&T> {
        if point.x < 0 || point.y < 0 {
            return None;
        }
        let x = point.x as usize;
        let y = point.y as usize;
        self.cells.get(y)?.get(x)
    }

    pub fn get_mut(&mut self, point: &Point) -> Option<&mut T> {
        if point.x < 0 || point.y < 0 {
            return None;
        }
        let x = point.x as usize;
        let y = point.y as usize;
        self.cells.get_mut(y)?.get_mut(x)
    }

    pub fn contains(&self, point: &Point) -> bool {
        point.x >= 0
            && point.y >= 0
            && (point.x as usize) < self.width
            && (point.y as usize) < self.height
    }

    pub fn points(&self) -> impl Iterator<Item = Point> + '_ {
        (0..self.height).flat_map(move |y| {
            (0..self.width).map(move |x| Point::new(x as i32, y as i32))
        })
    }
}

impl Grid<char> {
    pub fn from_str(input: &str) -> Self {
        let cells: Vec<Vec<char>> = input.lines().map(|line| line.chars().collect()).collect();
        Grid::new(cells)
    }

    pub fn find(&self, target: char) -> Option<Point> {
        for (y, row) in self.cells.iter().enumerate() {
            for (x, &cell) in row.iter().enumerate() {
                if cell == target {
                    return Some(Point::new(x as i32, y as i32));
                }
            }
        }
        None
    }

    pub fn find_all(&self, target: char) -> Vec<Point> {
        let mut result = Vec::new();
        for (y, row) in self.cells.iter().enumerate() {
            for (x, &cell) in row.iter().enumerate() {
                if cell == target {
                    result.push(Point::new(x as i32, y as i32));
                }
            }
        }
        result
    }
}
