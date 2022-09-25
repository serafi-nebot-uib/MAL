printf("T1\r\n");
printf("Start matrix:\r\n");
matrix = [
	4, -1, 0 -1;
	-1, 4, -1, 0;
	0, -1, 4, -1;
	-1, 0, -1, 4;
];
ind = [
	25,
	15,
	25,
	35
	];
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
