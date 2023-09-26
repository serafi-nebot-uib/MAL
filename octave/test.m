A = [
  1, 2, 0, 9;
  3, 9, 1, 3;
  6, 3, 1, 3;
  2, 5, 2, 7
];
b = [1; 2; 3; 4];

disp(A);
printf("\r\n");
disp(b);
printf("\r\n");

[A2, b2] = gaussify(A, b);

disp(A2);
printf("\r\n");
disp(b2);
printf("\r\n");

[x] = upper_triangular(A2, b2);

disp(x);
