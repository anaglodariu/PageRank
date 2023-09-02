function B = PR_Inv(A)
  [N N] = size(A); % factorizare Gram-Schmidt A = QR
  disp(inv(A));
  for i = 1 : N
    R(i, i) = norm(A(:, i)); % matrice superior triunghiulara
    Q(:, i) = A(:, i) / R(i, i); % matrice ortogonala
    for j = (i + 1) : N
      R(i, j) = Q(:, i)' * A(:, j);
      A(:, j) = A(:, j) - Q(:, i) * R(i, j);
    endfor
  endfor
  B = zeros(N, N); % B = inversa lui A, B = [x1x2...xN]
  % rezolvarea celor N sisteme de ecuatie 
  % R * xi = qi  ; qi = vectorul coloana i al matricei Q' ; cu i de la 1 la N
  for t = 1 : N
    for i = N:-1:1
      B(i, t) = (Q(t, i) - R(i, :) * B(:, t)) / R(i, i);
    endfor
  endfor
end