T = [
	1/3,	2/9,	0,		2/3,	0,		0;
	1/3,	1/3,	2/3,	0,		1/3,	0;
	0,		2/9,	1/3,	0,		0,		0;
	1/3,	0,		0,		1/3,	0,		0;
	0,		2/9,	0,		0,		1/3,	2/3;
	0,		0,		0,		0,		1/3,	1/3;
];

# calculate inverse of T using the PAQ = LU factorization
[P, Q, L, U] = fact_pqlu(T);
Ti = eye(columns(T));
for i = 1:columns(T)
	Ti(:,i) = Q * solve_upper_triangular(U, solve_lower_triangular(L, P * Ti(:,i)));
end

N = 10; # number of iterations to calculate
# recursively solve the system of equations Ti*x_i = x_i-1 for N iterations
a1 = rsolve_pqlu(Ti, [1; 0; 0; 0; 0; 0], N);
a2 = rsolve_pqlu(Ti, [0; 0; 0; 0; 0; 1], N);
b1 = rsolve_pqlu(Ti, [1/15; 1/15; 1/15; 1/15; 2/3; 1/15], N);
b2 = rsolve_pqlu(Ti, [0; 0; 1; 0; 0; 0], N);

printf("a) first individual steps\r\n");
matprint(a1);
printf("a) second individual steps\r\n");
matprint(a2);
printf("a.1) %.6f\r\n", a1(2,N+1) * a2(2,N+1));
printf("a.2) %.6f\r\n", a1(5,N+1) * a2(5,N+1));
printf("\r\n");

printf("b) first individual steps\r\n");
matprint(b1);
printf("b) second individual steps\r\n");
matprint(b2);
printf("b) %.6f\r\n", b1(1,N+1) * b2(1,N+1));
printf("\r\n");

[m i] = max(a1(:,N+1) .* a2(:,N+1));
printf("c) zone %d: %.6f\r\n", i, m);
printf("\r\n");
printf("d)\r\n");
tmp = b1(:,N+1) .* b2(:,N+1);
for i = 1:rows(tmp);
	printf("\tzone %d: %.6f\r\n", i, tmp(i));
end
