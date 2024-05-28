Teorema de fermat v1
$a^p \equiv a \mod p$ para todo p primo natural

Teorema de fermat V2
sea $a \in \mathbb Z$, $p \in \mathbb  N$, $(a:p)=1$
entonces $a^{p-1}\equiv 1 \mod p$ 

pseudoprimos tambien lo cumplen sin ser primos, no es doble implicación.         

sirve para resolver ejercicios como: Hallar el resto de $2^{319}$ en la division por 5
Ej.
2 y 5 son coprimos, entonces $2^4 \equiv 1 \mod 5$ 
Cada 4 (p-1) 2 son congruentes mod 5 a 1
se pueden hacer 79. Entonces $2^{319} \equiv 2^{3} \equiv 3 \mod 5$ 

Propiedad en general:
Prop: sea  $a$ un entero, $b$ un natural primo, $(a:b)=1$, $k,r \in \mathbb N_0$ 
si $k \equiv r \mod (p-1) \implies a^k\equiv a^r \mod (p)$

Dem:
$k \equiv r \mod (p-1) \implies p-1|k-r\implies k-r = (p-1)m \implies k=(p-1)m+r$
$\implies a^k  = a^{(p-1)m+r} = (a^{(p-1)})^ma^r \equiv 1^ma^r=a^r \mod p$

Ejemplo: Hallar todos los $m \in \mathbb N/30^n\equiv 1 \mod 7$
fermat nos asegura 6
multiplos de 6 tambien porque se multiplican. 
$a=30, b=7$ 7 primo, $(a:b)=1$
entonces por prop si $m\equiv r \mod 6 \implies 30^n\equiv 30^r \mod 7$
Vamos a hacer tabla entonces

| m(6) | 30^n (7)                                    |
| ---- | ------------------------------------------- |
| 0    | 1                                           |
| 1    | 2                                           |
| 2    | 4 si $30 \equiv 2 \implies 30^2 \equiv 2^2$ |
| 3    | 1                                           |
| 4    | 2 = $30^1 \cdot 30^3$                       |
| 5    | 4 = $30^3 \cdot 30^2$                       |

Entonces, nos sirven los congruentes a 0 o 3 $\mod 6$ 


Ejercicio: Hallar resto de $3^{5^{1000}}$ dividio 29
como 29 es primo, y $(3:29)=1$, 
Busco $r/5^{1000} \equiv r \mod 28$ 
TCR: Busco $r_1,r_2 : \begin{cases}5^{1000} \equiv r_1 \mod 4 \\ 5^{1000} \equiv r_2 \mod 7 \end{cases}$ 
$5 \equiv 1 \mod 4 \implies 5^{1000} \equiv 1^{1000} = 1 \mod 4$
PTF: $1000 \equiv 4 \mod 6$
Como 5 y 7 son coprimos, y 7 es primo, 
$5^{1000} \equiv 5^4\equiv 2 \mod 7$

$5^{1000} \equiv 1 \mod 4$
$5^{1000} \equiv 2 \mod 7$
buscar probando que son pocos
como 4 y 7 son coprimos, TCR: $5^{1000} \equiv 9 \mod 28$

Como $5^{1000} \equiv 9 \mod 28, (9:29)=1, \implies 3^{5^{1000}} \equiv 3^9 \mod 29$
$3^9 = 3^{3^3} \equiv (-2)^3 =-8 \equiv 21 \mod 29$



### Anillos
**Def**; Un anillo es un conjunto A, con dos operaciones:
 - +: $A \times A \to A$
 - ${\large \cdot}: A \times A \to A$
notación: +(2,3)=5. No tiene porque ser numérico. 
tales que:
##### Axiomas de anillos:

 1) $\forall a,b,c \in A, (a+b)+c = a+(b+c)$, es decir, suma asociativa
 2) $\forall a,b\in A, a+b=b+a$, es decir, suma conmutativa
 3) $\exists 0 \in A /\forall a \in A, a+0=a$ elemento neutro para suma
 4) $\forall a \in A, \exists -a / a+ (-a) = 0$ todo elemento tiene inverso aditivo
 5) $\forall a,b,c \in A (a\cdot b) \cdot c = a \cdot (b \cdot c)$ producto asociativo
 6) $\exists 1 \in A / a \cdot 1 = a \wedge 1 \cdot a = a$ elemento neutro para producto.
 7) $\forall a,b,c \in A, a\cdot (b+c) = a\cdot b +a \cdot c$ distributiva izquierda
 8) $\forall a,b,c \in A, (a+b)\cdot c = a\cdot c +b \cdot c$ distributiva derecha.

Ejemplos:
$A=\mathbb{Z,Q,R,C,R^{2\times2}, R^{3\times3}}$
$\mathbb N$ no es anillo porque le faltan 0 y inverso aditivo.

Anillo Trivial:
A=$\{*\}$. $*+*=*$ , $*\cdot*=*$ 

Se cumple la propiedad adicional 
 - $\forall a, b \in A , a\cdot b = b \cdot a$   
	A se dice un anillo conmutativo
	 Ejemplos: $\mathbb{Z,Q,R,C}$
	 No Ejemplos: $\mathbb{R^{2\times2}, R^{3\times3}}$
	  
 **Obs**: A anillo:
 1) $0 \in A,a  \in A, \exists! b \in a /a +b=0$
   Sup $a+b_1=0, a+b_2=0$
   $b_1=0+b_1 = (a+b_2) + b_1 = (b_2+a) + b_1 = b_2 + (a+b_1) = b_2 + 0 = b_2$  
 2) $1\in A, a \in A, (b_1,b_2\in A / ab_1=1, b_2a=1 \implies b_1=b_2)$
 3) $0, 0'$ son neutros, entonces $0=0'$.     $0=0+0'=0'$  
 4) 1 y 1' son neutros, entonces 1  = 1'
 5) $\forall a \in A, a\cdot 0 = 0$,
    Sea $b=a\cdot0$ 
	 $b=a\cdot0 = a \cdot (0+0) = a\cdot 0 + a \cdot 0 =b +b$
	 $b + (-b) = (b+b) + (-b) = b+(b+(-b)) = b+0=b$
  6) $0=1 \implies$ A es el anillo trivial. 
    **Dem**: Sea $a \in A$ . $a =  a \cdot 1 = a\cdot 0 = 0$ . Entonces a tiene un solo elemento 0.
  7)              