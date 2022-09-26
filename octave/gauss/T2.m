printf("T2:\r\n");
printf("Start matrix:\r\n");
matrix = [
	-4 / 5, -20 / 7, -54 / 11, 4;
	-60 / 59, -12, 270 / 17, 60 / 31;
	-64 * sqrt(7) / 87 - 196 / 87, 1600 * sqrt(7) / 4377 + 2380 / 4377, 2916 * sqrt(7) / 9137 + 3591 / 9137, 64 * sqrt(7) / 249 + 28 / 249;
	4 / 3, 20 / 33, 54 / 97, 4 / 9
];
ind = [1, 1, 1, 1];
solution = [
	-295 * sqrt(7) / 791 + 2065 / 1808;
	55 * sqrt(7) / 158 - 1309 / 2528;
	580448 * sqrt(7) / 3061961 - 2757128 / 11810421;
	279 * sqrt(7) / 686 - 279 / 1568
];
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
printf("Expected solution:\r\n");
disp(solution);
printf("Error:\r\n");
err = error_sol(solution, result);
disp(err);

