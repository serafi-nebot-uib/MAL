T = [
	1/3,	2/9,	0,		2/3,	0,		0,		0,		0,		0;
	1/3,	1/3,	2/3,	0,		2/9,	0,		0,		0,		0;
	0,		2/9,	1/3,	0,		0,		0,		0,		0,		0;
	1/3,	0,		0,		1/3,	0,		0,		0,		0,		0;
	0,		2/9,	0,		0,		1/3,	1/3,	0,		2/9,	0;
	0,		0,		0,		0,		2/9,	1/3,	0,		0,		1/3;
	0,		0,		0,		0,		0,		0,		1/3,	2/9,	0;
	0,		0,		0,		0,		2/9,	0,		2/3,	1/3,	1/3;
	0,		0,		0,		0,		0,		1/3,	0,		2/9,	1/3;
];

# calculate inverse of T using the PAQ = LU factorization
[P, Q, L, U] = fact_pqlu(T);
Ti = eye(columns(T));
for i = 1:columns(T)
	Ti(:,i) = Q * solve_upper_triangular(U, solve_lower_triangular(L, P * Ti(:,i)));
end

# the generated matrices, L and U, have elements very close to 0. for instance, U(9,9) = -5.20417e-18
# because machines are not exact, numbers very close to 0 can cause problems as they can be treated
# as 0, even though they aren't
printf("L:\r\n");
disp(L);
printf("\r\nU:\r\n");
disp(U);
# in fact, det(T) is very close to 0
printf("\r\ndet(T): %d\r\n", det(T));

# when performing operations with T^-1, the machine might output incorrect values like NaN or Inf
printf("\r\na1:\r\n");
a1 = rsolve_pqlu(Ti, [1; 0; 0; 0; 0; 0; 0; 0; 0], 1);
disp(a1);
