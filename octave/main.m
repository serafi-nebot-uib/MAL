function main
	test_fact_lu();
end

function test_fact_lu()
	printf("Fact LU\r\n");
	printf("Start matrix:\r\n");
	matrix = [
		1, 3, 2;
		1, -1, -4;
		0, 3, 6;
	];
	disp(matrix);
	printf("\r\n");

	[low, up] = fact_lu(matrix);
	printf("Lower:\r\n");
	disp(low);
	printf("Upper:\r\n");
	disp(up);
	printf("\r\n");
	printf("Solution low*up\r\n");
	disp(low * up);
	printf("\r\n");
end

function test_upper_triangular
	printf("Upper Triangular\r\n")
	printf("Start matrix:\r\n");
	matrix = [
		1, 2, 3;
		0, 1, -1;
		0, 0, 1
	];
	ind = [3, -1, 2];
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");

	printf("Solution:\r\n");
	result = upper_triangular(matrix, ind);
	disp(result);
end

function test_lower_triangular
	printf("Lower Triangular\r\n")
	printf("Start matrix:\r\n");
	matrix = [
		4, 0, 0;
		3, -9, 0;
		-8, 1, 2
	];
	ind = [-1, 6, 8];
	disp(matrix);
	printf("Ind terms:\r\n");
	disp(ind);
	printf("\r\n");

	printf("Solution:\r\n");
	result = lower_triangular(matrix, ind);
	disp(result);
end

function test_gaussify
	printf("Gaussify\r\n");
	printf("Start matrix:\r\n");
	matrix = [1, 3, 0;  2, 1, -1; 2, 4, -1];
	ind = [4, 0, 2];
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

function test_gauss_partial_pivot
	printf("Gaussify Pivot\r\n");
	printf("Start matrix:\r\n");
	matrix = [1, 3, 0;  2, 1, -1; 2, 4, -1];
	ind = [4, 0, 2];
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

function test_gauss_maximal_pivot
	printf("Gaussify Pivot Maximal\r\n");
	printf("Start matrix:\r\n");
	matrix = [1, 3, 0;  2, 1, -1; 2, 4, -1];
	ind = [4, 0, 2];
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

