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

[L, U] = fact_lu(T);
Ti = eye(columns(T));
for i = 1:columns(T)
	y = lower_triangular(L, Ti(:,i));
	r = Ti(:,i) - L*y;
	ytmp = NaN; rtmp = NaN;
	while !all(r == 0) && (norm(rtmp) < norm(r) || isnan(rtmp))
		printf("y: %d\r\n", i);
		if !isnan(rtmp); r = rtmp; y = ytmp; end
		ytmp = y + lower_triangular(L, r);
		rtmp = Ti(:,i) - L*ytmp;
	end

	x = upper_triangular(U, y);
	r = y - U*x;
	xtmp = NaN; rtmp = NaN;
	while !all(r == 0) && (norm(rtmp) < norm(r) || isnan(rtmp))
		printf("x: %d\r\n", i);
		if !isnan(rtmp); r = rtmp; x = xtmp; end
		xtmp = x + upper_triangular(U, r);
		rtmp = y - U*xtmp;
	end
	Ti(:,i) = x;
end
disp(norm(Ti*T));
printf("\r\n");
disp(norm(inverse(T)*T));
printf("\r\n");
