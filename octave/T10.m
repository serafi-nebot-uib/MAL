A = vander([10; 15; 20; 25; 30; 35; 40]);
b = [15; 30; 40; 55; 70; 85; 100];
printf("A: \n");
matprint(A);
printf("\n");

printf("b: \n");
matprint(b);
printf("\n");

printf("################################ A = LU ################################\n");
[L, U] = fact_lu(A);
printf("L: \n");
matprint(L);
printf("\n");
printf("U: \n");
matprint(U);
printf("\n");

c = lower_triangular(L, b);
x1 = upper_triangular(U, c);

printf("x1:\n");
matprint(x1);
printf("\n");

sol25_1 = poly(x1, 25);
printf("sol[25]: %.15f\n", sol25_1);
printf("err[25]: ");
disp(55 - sol25_1);
printf("\n");

printf("sol[37.5]: ");
sol37_5_1 = poly(x1, 37.5);
disp(sol37_5_1);
printf("\n");

printf("################################ PA = LU ################################\n");
[P, L, U] = fact_lu_pivot_partial(A);
printf("P: \n");
matprint(P);
printf("\n");
printf("L: \n");
matprint(L);
printf("\n");
printf("U: \n");
matprint(U);
printf("\n");

c = lower_triangular(L, P * b);
x2 = upper_triangular(U, c);

printf("x2:\n");
matprint(x2);
printf("\n");

sol25_2 = poly(x2, 25);
printf("sol[25]: %.15f\n", sol25_2);
printf("err[25]: ");
disp(55 - sol25_2);
printf("\n");

printf("sol[37.5]: ");
sol37_5_2 = poly(x2, 37.5);
disp(sol37_5_2);
printf("\n");

# printf("diff(x):\n");
# disp(x1 - x2)
# printf("diff(25): ");
# disp(sol25_1 - sol25_2);
# printf("diff(37.5): ");
# disp(sol37_5_1 - sol37_5_2);
# printf("\n");
