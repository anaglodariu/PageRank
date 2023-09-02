function R = Iterative(nume, d, eps)
  fid = fopen(nume, 'r');
  N = fscanf(fid, "%d", 1);
  N1 = N;
  A = zeros(N, N); % matrice de adiacenta
  K = zeros(N, N); % matrice diagonala ce contine nr de vecini ai fiecarui nod
  K1 = zeros(N, N); % cum fiecare nod are cel putin un vecin, matricea K este inversabila, cu inversa K1
  M = zeros(N, N);
  
  while N1 > 0
    i = fscanf(fid, "%d", 1); % nod i
    nr = fscanf(fid, "%d", 1); % cu cate noduri de invecineaza
    K(i, i) = nr;
    while nr > 0
      j = fscanf(fid, "%d", 1);
      A(i, j) = 1;
      if j == i
        A(i, j) = 0;
        K(i, i) = K(i, i) - 1;  
      endif
      nr = nr - 1;
    endwhile
    A(i, i) = 0;
    N1 = N1 - 1;
  endwhile
  fclose(fid);
 
  K1 = inv(K); % inversa lui K
  M = (K1 * A)'; % obtinem matricea in care fiecare coloana 
  % (reprezentand un nod/pagina web), are pe liniile corespunzatoare nodurilor vecine
  % (paginilor web in care se poate ajunge prin linkuri), probabilitatea de a ajunge la ele
  % (adica 1/nr noduri vecine)
  I = ones(N, 1);
  R0 = (1 / N) * I; % vector coloana cu pagerank-ul initial
  R1 = d*M*R0 + (((1 - d) / N) * I);
  
  while (norm(R1 - R0, 2) > eps)
    R0 = R1;
    R1 = d*M*R0 + (((1 - d) / N) * I);
  endwhile
  R = R0;
  
end