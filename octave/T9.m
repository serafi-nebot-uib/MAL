A = [
	1/10 ^ 5,	1/10 ^ 4,	1/10 ^ 3,	1/10 ^ 2,	1/10,	1;
	2 ^ 5,		2 ^ 4,		2 ^ 3,		2 ^ 2,		2,		1;
	7 ^ 5,		7 ^ 4,		7 ^ 3,		7 ^ 2,		7,		1;
	10 ^ 5,		10 ^ 4,		10 ^ 3,		10 ^ 2,		10,		1;
	23 ^ 5,		23 ^ 4,		23 ^ 3,		23 ^ 2,		23,		1;
	31 ^ 5,		31 ^ 4,		31 ^ 3,		31 ^ 2,		31,		1;
];

b = [-1; 5; -7; -1; 1; 2];

printf("A:\n");
matprint(A);
printf("\n");

printf("b:\n");
matprint(b);
printf("\n");

[L, U] = fact_lu(A);
printf("#### A = LU\n");
printf("L:\n");
matprint(L);
printf("\n");

printf("U:\n");
matprint(U);
printf("\n");

c = lower_triangular(L, b);
x = upper_triangular(U, c);

printf("x:\n");
matprint(x);
printf("\n");

r1 = 7^5*x(1) + 7^4*x(2) + 7^3*x(3) + 7^2*x(4) + 7*x(5) + x(6);
printf("r: %f\n", r1);
printf("\n");
printf("error: %f\n", 7 - r1);
printf("\n");

[P, L, U] = fact_lu_pivot_partial(A);
printf("#### PA = LU\n");
printf("P:\n");
matprint(P);
printf("\n");

printf("L:\n");
matprint(L);
printf("\n");

printf("U:\n");
matprint(U);
printf("\n");

c = lower_triangular(L, P * b);
x = upper_triangular(U, c);

printf("x:\n");
matprint(x);
printf("\n");

r2 = 7^5*x(1) + 7^4*x(2) + 7^3*x(3) + 7^2*x(4) + 7*x(5) + x(6);
printf("r: %f\n", r2);
printf("\n");
printf("error: %f\n", 7 - r2);
printf("\n");
