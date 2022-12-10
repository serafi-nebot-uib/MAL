printf("T11\r\n");
printf("Start matrix:\r\n");
c = [
	1 / 100;
	1 / 50;
	1 / 10;
	1;
	2;
	5;
	10;
	100
];
matrix = vander(c);
ind = [
	1;
	-1;
	1;
	-1;
	1;
	2;
	1;
	-1
];
solution = [
	-89202397011858500 / 343184827942444257; 
	284742741343553165 / 9275265620066061;
	-25810583238434097767 / 51997701203400645;
	29985328840009119006959 / 11439494264748141900;
	-6332936841882181293233 / 1271054918305349100;
	5934214756682873188013 / 1906582377458023650;
	-14214034409621076703 / 49026403991777751;
	1233052285368734443 / 343184827942444257
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
printf("det(A) = (1 / det(P)) * det(L) * det(U) = %f\r\n", (1 / det(perm)) * det(low) * det(up));
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

printf("PAQ = LU decomposition\r\n");
[perm_r, perm_c, low, up] = fact_lu_pivot_full(matrix);
printf("Row Permutation:\r\n");
disp(perm_r)
printf("Column Permutation:\r\n");
disp(perm_c)
printf("Lower:\r\n");
disp(low)
printf("Upper:\r\n");
disp(up)
printf("\r\n");

printf("PAQ = LU decomposition - det(A)\r\n");
printf("det(P) = %f\r\n", det(perm_r));
printf("det(Q) = %f\r\n", det(perm_c));
printf("det(L) = %f\r\n", det(low));
printf("det(U) = %f\r\n", det(up));
printf("det(A) = (1 / det(P)) * (1 / det(Q)) * det(L) * det(U) = %f\r\n", (1 / det(perm_r)) * (1 / det(perm_c)) * det(low) * det(up));
printf("\r\n");

printf("PAQ = LU decomposition - solution\r\n");
printf("Lc = Pb\r\n");
c = lower_triangular(low, perm_r * ind);
printf("c = ");
disp(transpose(c));
printf("Uz = c\r\n");
z = upper_triangular(up, c);
printf("z = ");
disp(transpose(z));
x = perm_c * z;
printf("x = Qz = ")
disp(transpose(x));
printf("\r\n");

printf("PAQ = LU decomposition - solution error\r\n");
printf("Solution:\t\t");
disp(transpose(x));
printf("Expected solution:\t");
disp(transpose(solution));
printf("Error:\t\t\t");
err = error_sol(solution, x);
disp(err);
