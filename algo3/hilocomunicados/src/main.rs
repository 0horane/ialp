use std::{io};


fn main() {

    let data_input:String = read_line().trim().to_string();
    let mut posicion_final = 0;
    for char in data_input.chars() {
        match char {
            '+' => { posicion_final += 1; },
            '-' => { posicion_final -= 1; },
            _ => {}

        }
    }

    
    let vecino_input:String = read_line().trim().to_string();
    let mut posicion_vieja = [0.0;21];
    posicion_vieja[valor_a_indice(0)] = 1.0;
    for char in vecino_input.chars() {
        let mut posicion_nueva = [0.0;21];
        
        for (i,probabilidad) in posicion_vieja.iter().enumerate(){
            if *probabilidad != 0.0 {
                match char {
                    '+' => { 
                        posicion_nueva[i+1] += probabilidad; 
                    },
                    '-' => { 
                        posicion_nueva[i-1] += probabilidad; 
                    },
                    '?' => {
                         posicion_nueva[i+1] += probabilidad/2.0; 
                         posicion_nueva[i-1] += probabilidad/2.0; 
                        },
                    _ => {}
        
                }
            }
            
        }
        posicion_vieja = posicion_nueva;
        
    }

    
    println!("{}", posicion_vieja[valor_a_indice(posicion_final)]);
}


fn valor_a_indice(a:i32)->usize{
    (a+10) as usize
}

fn read_line() -> String {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    input
}
