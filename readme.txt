
- pentru ambii algoritmi (Iterative si Algebraic) - am deschis fisierul cu datele de intrare si am citit din el, construind simultan matricea de adiacenta A (neluand in considerare legaturile dintre paginile web cu ele insele, deci nu avem 1 pe diagonala principala)
- in matricea diagonala K am numarul de legaturi care pleaca de la fiecare pagina web la altele
- matricea M prezinta pentru fiecare coloana (reprezentata de o pagina web) probabilitatile de a ajunge printr-un link la alte pagini web (adica (1/ numarul total de linkuri catre alte pagini), in cazul in care exista linkul intre pagini, si in rest 0)
- consideram ca la momentul initial pagerank-ul fiecarei pagini este de 1/numarul de pagini, deci R0 va fi un vector coloana cu toate elementele egale cu 1/numarul de pagini
- in R1 pastrez pagerank-ul la un moment de timp ulterior, repetand calculul pentru R1 cat timp norma lui R1-R0 e mai mare decat eroarea eps
- rezultatul final il pastrez in R; va fi egal cu R0 pentru ca while-ul facea cu o iteratie mai mult

- la algoritmul Algebraic, calculez mai intai Q si R cu Gram-Schmidt si dupa inversa rezolvand sistemele de ecuatii date in cerinta :
De exemplu, daca trebuie sa aflu inversa unei matrice T = QR
Daca notam inversa lui T cu T1 = [x1x2...xn], vom avea: T*T1 = I  =>  T * xi = ei, cu i de la 1 la n  =>
QR*xi = ei   => R*xi = Q' * ei ; Q' = transpusa lui Q
 => R * xi = qi  ; qi = vectorul coloana i al matricei Q'

formula pentru algoritmul Algebraic am obtinut-o afland R din relatia :
R = (1-d)/N * ones(N, 1) + d * M * R

