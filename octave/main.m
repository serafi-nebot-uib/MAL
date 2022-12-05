function main
	# matrix = [
	# 	1, 2, 3;
	# 	0, 1, -1;
	# 	0, 0, 1
	# ];
	# ind = [3, -1, 2];
	# test_upper_triangular(matrix, ind);
	#
	# matrix = [
	# 	4, 0, 0;
	# 	3, -9, 0;
	# 	-8, 1, 2
	# ];
	# ind = [-1, 6, 8];
	# test_lower_triangular(matrix, ind);

	matrix = [
		1, 3, 0;
		2, 1, -1;
		2, 4, -1
	];
	ind = [4, 0, 2];
	# test_gaussify(matrix, ind);
	# test_gaussify_pivot_partial(matrix, ind);
	# test_gaussify_pivot_full(matrix, ind);
	#
	# matrix = [
	# 	1, 3, 0;
	# 	2, 1, -1;
	# 	2, 4, -1
	# ];
	#
	# test_fact_lu(matrix);
	# test_fact_lu_pivot_partial(matrix);
	test_fact_lu_pivot_full(matrix);
end

function test_upper_triangular(matrix, ind)
	printf("Upper Triangular\r\n")
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");

	printf("Solution:\r\n");
	result = upper_triangular(matrix, ind);
	disp(result);
end

function test_lower_triangular(matrix, ind)
	printf("Lower Triangular\r\n")
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");

	printf("Solution:\r\n");
	result = lower_triangular(matrix, ind);
	disp(result);
end

function test_gaussify(matrix, ind)
	printf("Gaussify\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");
	printf("Processed matrix:\r\n");
	[rmat, rind] = gaussify(matrix, ind);
	disp(rmat);
	printf("Ind terms:\r\n");
	disp(rind);
	printf("\r\n");

	printf("Solution:\r\n");
	result = upper_triangular(rmat, rind);
	disp(result);
end

function test_gaussify_pivot_partial(matrix, ind)
	printf("Gaussify Partial Pivot\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");

	printf("Processed matrix:\r\n");
	[rmat, rind] = gaussify_pivot_partial(matrix, ind);
	disp(rmat);
	printf("Ind terms:\r\n");
	disp(rind);
	printf("\r\n");

	printf("Solution:\r\n");
	result = upper_triangular(rmat, rind);
	disp(result);
end

function test_gaussify_pivot_full(matrix, ind)
	printf("Gaussify Full Pivot\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");

	printf("Processed matrix:\r\n");
	[rmat, rind, pos] = gaussify_pivot_full(matrix, ind);
	disp(rmat);
	printf("Ind terms:\r\n");
	disp(rind);
	printf("Position:\r\n");
	disp(pos);
	printf("\r\n");

	printf("Solution:\r\n");
	result = upper_triangular(rmat, rind);
	disp(result);
end

function test_fact_lu(matrix)
	printf("Fact LU\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("\r\n");

	[low, up] = fact_lu(matrix);
	printf("Upper:\r\n");
	disp(up);
	printf("Lower:\r\n");
	disp(low);
	printf("\r\n");
	printf("Solution LU\r\n");
	disp(low * up);
	printf("\r\n");
end

function test_fact_lu_pivot_partial(matrix)
	printf("Fact LU Pivot Partial\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("\r\n");

	[perm, low, up] = fact_lu_pivot_partial(matrix);
	printf("Perm:\r\n");
	disp(perm);
	printf("Upper:\r\n");
	disp(up);
	printf("Lower:\r\n");
	disp(low);
	printf("\r\n");
	printf("Solution PA = LU\r\n");
	disp(perm * matrix);
	disp(low * up);
	printf("\r\n");
end

function test_fact_lu_pivot_full(matrix)
	printf("Fact LU Pivot Full\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("\r\n");

	[perm_r, perm_c, low, up] = fact_lu_pivot_full(matrix);
	printf("Perm rows:\r\n");
	disp(perm_r);
	printf("Perm columns:\r\n");
	disp(perm_c);
	printf("Upper:\r\n");
	disp(up);
	printf("Lower:\r\n");
	disp(low);
	printf("\r\n");
	printf("Solution PAQ = LU\r\n");
	disp(perm_r * matrix * perm_c);
	disp(low * up);
	printf("\r\n");
end
