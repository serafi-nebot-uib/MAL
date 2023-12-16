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

# T = [
# 	2, -3, 5;
# 	1, -1, 4;
# 	7, 5, -8;
# ];

[P, Q, L, U] = fact_lu_pivot_full(T);

Ti = eye(columns(T));
for i = 1:columns(T)
	Ti(:,i) = Q * upper_triangular(U, lower_triangular(L, P * Ti(:,i))); 
end
disp(norm(Ti*T));
printf("\r\n");
disp(norm(inverse(T)*T));
printf("\r\n");

# disp(Ti*T);
# disp(norm(Ti*T));
# disp(Ti*T);
# disp(inverse(T));





# disp(Ti - inverse(T));

# a1 = [1; 0; 0; 0; 0; 0; 0; 0; 0];
# a2 = [0; 0; 0; 0; 0; 0; 0; 1; 0];
#
# R1 = rsolve_plu(Ti, a1, 10);
# matprint(R1);
# printf("\r\n");
# R2 = rsolve_plu(Ti, a2, 10);
# matprint(R2);
# printf("\r\n");

# disp(T*Ti)
# disp(T*inverse(T));
#
# T10 = T^10;
# matprint(T10);
# printf("\r\n");
#
# a1 = [1; 0; 0; 0; 0; 0; 0; 0; 0];
# a2 = [0; 0; 0; 0; 0; 0; 0; 1; 0];
# a1_10 = T10 * a1;
# disp(a1_10);
# printf("\r\n");
# a2_10 = T10 * a2;
# disp(a2_10);
# printf("\r\n");
#
# for i = 1:columns(T)
# 	printf("Zone %d: %.6f * %.6f = %.6f\r\n", i, a1_10(i), a2_10(i), a1_10(i) * a2_10(i));
# end

# b1 = [1/24; 1/24; 1/24; 1/24; 1/3; 1/24; 1/24; 1/24; 1/24];
# b2 = [0; 0; 1; 0; 0; 0; 0; 0; 0];
