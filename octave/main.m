function main
	matrix = [
		1, 3, 0;
		2, 1, -1;
		2, 4, -1
	];
	test_gauss_partial_pivot(matrix, zeros(3, 1));
	# test_fact_lu(matrix);
	test_fact_lu_pivot(matrix);
end

function test_fact_lu_pivot(matrix)
	printf("Fact LU pivot\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("\r\n");

	[perm, low, up] = fact_lu_pivot(matrix);
	printf("Perm:\r\n");
	disp(perm);
	printf("Upper:\r\n");
	disp(up);
	printf("Lower:\r\n");
	disp(low);
	printf("\r\n");
	printf("Solution perm*matrix = low*up\r\n");
	disp(perm * matrix);
	disp(low * up);
	printf("\r\n");
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
	printf("Solution low*up\r\n");
	disp(low * up);
	printf("\r\n");
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

function test_gauss_partial_pivot(matrix, ind)
	printf("Gaussify Pivot\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");

	printf("Processed matrix:\r\n");
	[rmat, rind] = gaussify_pivot(matrix, ind);
	disp(rmat);
	printf("Ind terms:\r\n");
	disp(rind);
	printf("\r\n");

	printf("Solution:\r\n");
	result = upper_triangular(rmat, rind);
	disp(result);
end

function test_gauss_maximal_pivot(matrix, ind)
	printf("Gaussify Pivot Maximal\r\n");
	printf("Start matrix:\r\n");
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");

	printf("Processed matrix:\r\n");
	[rmat, rind, pos] = gaussify_pivot_max(matrix, ind);
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

