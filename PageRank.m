function [R1 R2] = PageRank(nume, d, eps)
  fid = fopen(nume, 'r');
  N = fscanf(fid, "%d", 1);
  N1 = N;
  while N1 > 0
    i = fscanf(fid, "%d", 1); % nod i
    nr = fscanf(fid, "%d", 1); % cu cate noduri de invecineaza
    while nr > 0
      j = fscanf(fid, "%d", 1);
      nr = nr - 1;
    endwhile
    N1 = N1 - 1;
  endwhile
  val1 = fscanf(fid, "%f", 1);
  val2 = fscanf(fid, "%f", 1);
  fclose(fid);

  output = [nume ".out"];
  fid = fopen(output, 'w');
  fprintf(fid, "%d\n\n", N);
  R1 = Iterative(nume, d, eps);
  fprintf(fid, "%.6f\n", R1);
  fprintf(fid, "\n");
  R2 = Algebraic(nume, d);
  fprintf(fid, "%.6f\n", R2);
  fprintf(fid, "\n");
  % ordonam descrescator vectorul coloana R2
  PR = R2;
  PR1 = sort(PR, "descend"); 
  % facem afisarea
  j = 0;
  for i = 1 : N
    for t = 1 : N
      if (PR1(i) == R2(t))
        j = t;
      endif
    endfor
    fprintf(fid, "%d %d %.6f", i, j, Apartenenta(PR1(i), val1, val2));
    fprintf(fid, "\n");
  endfor
  fclose(fid);

end