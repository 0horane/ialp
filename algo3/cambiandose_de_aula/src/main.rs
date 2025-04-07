use std::{io};

fn main() {
    for _caso in 0..read_line().trim().parse().unwrap() {
        println!("{}", if evaluar_caso() { "YES" } else { "NO" });
    }
}

fn read_line() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    input
}

fn parse_n_y_m() -> (usize,usize){
    let input = read_line();
    let n_y_m: Vec<_> = input.trim().split_ascii_whitespace().collect();
    let n: usize = n_y_m[0].parse().unwrap();
    let m: usize = n_y_m[1].parse().unwrap();
    (n,m)
} 

fn parse_temperaturas(n:usize) -> (Vec<Vec<i32>>, Vec<Vec<Vec<i32>>>) {

    let mut temperaturas: Vec<Vec<i32>> = vec![];
    let mut temperaturas_posibles: Vec<Vec<Vec<i32>>> = vec![];
    for _j in 0..n {
        let linea: Vec<i32> = read_line()
            .split_ascii_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        temperaturas_posibles.push(vec![vec![]; linea.len()]);
        temperaturas.push(linea);
    }
    (temperaturas, temperaturas_posibles)
}

fn evaluar_caso() -> bool {
    let (n,m) = parse_n_y_m();
    let (matrix, mut temperaturas_posibles) = parse_temperaturas(n);

    if (n + m) % 2 == 0 {
        return false;
    }

    let mut ramas_por_explorar = vec![(0, 0, 0)];
    while let Some((ypos, xpos, temp)) = ramas_por_explorar.pop() {
        let newtemp = matrix[ypos][xpos] + temp;
        if temperaturas_posibles[ypos][xpos].contains(&newtemp) {
            continue;
        }
        if ypos == n - 1 && xpos == m - 1 && newtemp == 0 {
            return true;
        }
        temperaturas_posibles[ypos][xpos].push(newtemp);

        if !(ypos == n - 1) && !(xpos == m - 1 ) {
            if newtemp > 0 {
                if matrix[ypos+1][xpos] > matrix[ypos][xpos+1]{
                    ramas_por_explorar.push((ypos + 1, xpos, newtemp));
                    ramas_por_explorar.push((ypos, xpos + 1, newtemp));
                } else {
                    ramas_por_explorar.push((ypos, xpos + 1, newtemp));
                    ramas_por_explorar.push((ypos + 1, xpos, newtemp));
                }
            } else {
                if matrix[ypos+1][xpos] > matrix[ypos][xpos+1]{
                    ramas_por_explorar.push((ypos, xpos + 1, newtemp));
                    ramas_por_explorar.push((ypos + 1, xpos, newtemp));
                } else {
                    ramas_por_explorar.push((ypos + 1, xpos, newtemp));
                    ramas_por_explorar.push((ypos, xpos + 1, newtemp));
                }
            }
        } else if !(ypos == n - 1) {
            ramas_por_explorar.push((ypos + 1, xpos, newtemp));
        } else  if !(xpos == m - 1) {
            ramas_por_explorar.push((ypos, xpos + 1, newtemp));
        }
    }
    return false;
}
