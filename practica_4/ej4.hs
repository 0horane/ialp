sumaImpares :: Integer->Integer
sumaImpares 1 = 1
sumaImpares n = (2*n-1) + sumaImpares (n-1) 
