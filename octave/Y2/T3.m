printf("###### Problem 1 ######\r\n");
matrix = [
	3, 7, 1;
	0, 2, -2;
	6, 5, 3
];
ind = [-3, 1, 0];
printf("Start matrix:\r\n");
disp(matrix);
printf("Ind terms:\r\n");
disp(ind);
printf("\r\n");

printf("Intermediate matricies:\r\n");
[rmat, rind] = gaussify(matrix, ind);
printf("Processed matrix:\r\n");
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
printf("\r\n");

printf("Solution:\r\n");
result = upper_triangular(rmat, rind);
disp(result);

printf("###### Problem 2 ######\r\n");
matrix = [
	1, 3, 1, 5;
	1, 4, 2, 6;
	1, 5, 3, 7;
	1, 6, -1, 8;
];
ind = [0, 1, 2, -2];
printf("Start matrix:\r\n");
disp(matrix);
printf("Ind terms:\r\n");
disp(ind);
printf("\r\n");

printf("GAUSS\r\n");
printf("Intermediate matricies:\r\n");
[rmat, rind] = gaussify(matrix, ind);
printf("Processed matrix:\r\n");
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
printf("\r\n");

printf("Solution:\r\n");
result = upper_triangular(rmat, rind);
disp(result);
printf("\r\n");
printf("\r\n");

printf("GAUSS PARTIAL PIVOT\r\n");
printf("Intermediate matrix:\r\n");
[rmat, rind] = gaussify_pivot_partial(matrix, ind);
printf("Processed matrix:\r\n");
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
printf("\r\n");

printf("Solution:\r\n");
result = upper_triangular(rmat, rind);
disp(result);
