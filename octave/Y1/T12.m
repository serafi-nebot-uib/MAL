# 1/79, 1/50, 1/10, 2, 7, 10, 23, 31
# -1, 1, -1, 5, -7, -1, 1, 2
A = [
	(1/79)^7, (1/79)^6, (1/79)^5, (1/79)^4, (1/79)^3, (1/79)^2, (1/79)^1, (1/79)^0;
	(1/50)^7, (1/50)^6, (1/50)^5, (1/50)^4, (1/50)^3, (1/50)^2, (1/50)^1, (1/50)^0;
	(1/10)^7, (1/10)^6, (1/10)^5, (1/10)^4, (1/10)^3, (1/10)^2, (1/10)^1, (1/10)^0;
	(2)^7, (2)^6, (2)^5, (2)^4, (2)^3, (2)^2, (2)^1, (2)^0;
	(7)^7, (7)^6, (7)^5, (7)^4, (7)^3, (7)^2, (7)^1, (7)^0;
	(10)^7, (10)^6, (10)^5, (10)^4, (10)^3, (10)^2, (10)^1, (10)^0;
	(23)^7, (23)^6, (23)^5, (23)^4, (23)^3, (23)^2, (23)^1, (23)^0;
	(31)^7, (31)^6, (31)^5, (31)^4, (31)^3, (31)^2, (31)^1, (31)^0;
];
b = [
	-1;
	1;
	-1;
	5;
	-7;
	-1;
	1;
	2;
];

solution = [809652087205591923515252387075/23323346315290544274320178145536; 
-2114064033799350617189700660833/832976654117519438368577790912;
1427340035469454748902303807848023/22212710776467185023162074424320;
-3008304405905608684403491408770955/4442542155293437004632414884864;
12931709176068700536879250099241957/4442542155293437004632414884864;
-730485677053229035838559338267443/193154006751888565418800647168;
2868538564423774071942317133211043/7288545723528295085725055670480;
-779635237316329884432986801717/144865505063916424064100485376];

printf("A =\r\n");
disp(A);
printf("\r\n");

printf("b = ");
disp(transpose(b));
printf("\r\n");

[L1, U1] = fact_lu(A);
printf("A = LU\r\n");
printf("L1 =\r\n");
disp(L1);
printf("U1 =\r\n");
disp(U1);
printf("\r\n");

[P2, L2, U2] = fact_lu_pivot_partial(A);
printf("PA = LU\r\n");
printf("P2 =\r\n");
disp(P2);
printf("L2 =\r\n");
disp(L2);
printf("U2 =\r\n");
disp(U2);
printf("\r\n");

[P3, Q3, L3, U3] = fact_lu_pivot_full(A);
printf("PAQ = LU\r\n");
printf("P3 =\r\n");
disp(P3);
printf("Q3 =\r\n");
disp(Q3);
printf("L3 =\r\n");
disp(L3);
printf("U3 =\r\n");
disp(U3);
printf("\r\n");

printf("A = LU - solution\r\n");
printf("Lc = b\r\n");
c1 = lower_triangular(L1, b);
printf("c = ");
disp(transpose(c1));
printf("Ux = c\r\n");
x1 = upper_triangular(U1, c1);
printf("x = ");
disp(transpose(x1));
printf("\r\n");

printf("PA = LU - solution\r\n");
printf("Lc = Pb\r\n");
c2 = lower_triangular(L2, P2 * b);
printf("c = ");
disp(transpose(c2));
printf("Ux = c\r\n");
x2 = upper_triangular(U2, c2);
printf("x = ");
disp(transpose(x2));
printf("\r\n");

printf("PAQ = LU - solution\r\n");
printf("Lc = Pb\r\n");
c3 = lower_triangular(L3, P3 * b);
printf("c = ");
disp(transpose(c3));
printf("Uz = c\r\n");
z3 = upper_triangular(U3, c3);
printf("z = ");
disp(transpose(z3));
x3 = Q3 * z3;
printf("x = Qz = ")
disp(transpose(x3));
printf("\r\n");

printf("A = LU - solution error\r\n");
printf("Solution:\t\t");
disp(transpose(x1));
printf("Expected solution:\t");
disp(transpose(solution));
printf("Error:\t\t\t");
err = error_sol(solution, x1);
disp(err);
printf("\r\n");

printf("PA = LU - solution error\r\n");
printf("Solution:\t\t");
disp(transpose(x2));
printf("Expected solution:\t");
disp(transpose(solution));
printf("Error:\t\t\t");
err = error_sol(solution, x2);
disp(err);
printf("\r\n");

printf("PAQ = LU decomposition - solution error\r\n");
printf("Solution:\t\t");
disp(transpose(x3));
printf("Expected solution:\t");
disp(transpose(solution));
printf("Error:\t\t\t");
err = error_sol(solution, x3);
disp(err);
