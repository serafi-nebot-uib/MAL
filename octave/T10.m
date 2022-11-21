printf("T10\r\n");
printf("Start matrix:\r\n");
matrix = [
	1 / 10, 1 / 5, 1 / 20, 0;
	1, -1, 1, -1;
	0, 1, -2, 1;
	100, 100 ^ 2, 100 ^ 3, 100 ^ 4
];
ind = [
	1;
	0;
	-2;
	-1
];
solution = [
	247954999 / 275992600;
	4224001803 / 1103970400;
	799940199 / 275992600;
	-32421011 / 1103970400
];
disp(matrix);
printf("Ind terms:");
disp(transpose(ind));
printf("\r\n");

printf("A = LU decomposition\r\n");
[low, up] = fact_lu(matrix);
printf("Lower:\r\n");
disp(low)
printf("Upper:\r\n");
disp(up)
printf("\r\n");

printf("A = LU decomposition - det(A)\r\n");
printf("det(L) = %f\r\n", det(low));
printf("det(U) = %f\r\n", det(up));
printf("det(A) = det(L) * det(U) = %f\r\n", det(low) * det(up));
printf("\r\n");

printf("A = LU decomposition - solution\r\n");
printf("Lc = b\r\n");
c = lower_triangular(low, ind);
printf("c = ");
disp(transpose(c));
printf("Ux = c\r\n");
x = upper_triangular(up, c);
printf("x = ");
disp(transpose(x));
printf("\r\n");

printf("A = LU decomposition - solution error\r\n");
printf("Solution:\t\t");
disp(transpose(x));
printf("Expected solution:\t");
disp(transpose(solution));
printf("Error:\t\t\t");
err = error_sol(solution, x);
disp(err);
printf("\r\n");

printf("PA = LU decomposition\r\n");
[perm, low, up] = fact_lu_pivot_partial(matrix);
printf("Permutation:\r\n");
disp(perm)
printf("Lower:\r\n");
disp(low)
printf("Upper:\r\n");
disp(up)
printf("\r\n");

printf("PA = LU decomposition - det(A)\r\n");
printf("det(P) = %f\r\n", det(perm));
printf("det(L) = %f\r\n", det(low));
printf("det(U) = %f\r\n", det(up));
printf("det(A) = det(P) * det(L) * det(U) = %f\r\n", det(perm) * det(low) * det(up));
printf("\r\n");

printf("PA = LU decomposition - solution\r\n");
printf("Lc = Pb\r\n");
c = lower_triangular(low, perm * ind);
printf("c = ");
disp(transpose(c));
printf("Ux = c\r\n");
x = upper_triangular(up, c);
printf("x = ");
disp(transpose(x));
printf("\r\n");

printf("PA = LU decomposition - solution error\r\n");
printf("Solution:\t\t");
disp(transpose(x));
printf("Expected solution:\t");
disp(transpose(solution));
printf("Error:\t\t\t");
err = error_sol(solution, x);
disp(err);
printf("\r\n");
