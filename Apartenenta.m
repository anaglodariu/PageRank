function y = Apartenenta(x, val1, val2)
  % a * val1 + b = 0; rezolvam acest sistem ca fct sa fie continua
  % a * val2 + b = 1;
  a = 1 / (val2 -val1);
  b = - a * val1;
  
  if (x < val1)
    y = 0;
  elseif (x > val2)
    y = 1;
  else
    y = a * x + b;
    
end	