pub fn gcd(mut a: i64, mut b: i64) -> i64 {
    while b != 0 {
        let temp = b;
        b = a % b;
        a = temp;
    }
    a.abs()
}

pub fn lcm(a: i64, b: i64) -> i64 {
    if a == 0 || b == 0 {
        0
    } else {
        (a * b).abs() / gcd(a, b)
    }
}

pub fn lcm_vec(numbers: &[i64]) -> i64 {
    numbers.iter().copied().fold(1, lcm)
}

pub fn extended_gcd(a: i64, b: i64) -> (i64, i64, i64) {
    if b == 0 {
        (a, 1, 0)
    } else {
        let (gcd, x1, y1) = extended_gcd(b, a % b);
        (gcd, y1, x1 - (a / b) * y1)
    }
}

pub fn mod_inverse(a: i64, m: i64) -> Option<i64> {
    let (gcd, x, _) = extended_gcd(a, m);
    if gcd != 1 {
        None
    } else {
        Some((x % m + m) % m)
    }
}

pub fn chinese_remainder_theorem(remainders: &[i64], moduli: &[i64]) -> Option<i64> {
    if remainders.len() != moduli.len() {
        return None;
    }

    let prod: i64 = moduli.iter().product();
    let mut sum = 0;

    for (&remainder, &modulus) in remainders.iter().zip(moduli.iter()) {
        let p = prod / modulus;
        let inv = mod_inverse(p, modulus)?;
        sum += remainder * inv * p;
    }

    Some(sum % prod)
}
