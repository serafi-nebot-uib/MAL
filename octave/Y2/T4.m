printf("T4.1:\r\n");
printf("Start matrix:\r\n");
c = [
	1 / 100,
	1 / 50,
	1 / 10,
	1,
	2,
	5,
	10,
	100
];
matrix = vander(c);
ind = [
	1,
	-1,
	1,
	-1,
	1,
	2,
	1,
	-1
];
solution = [-89202397011858500/343184827942444257; 
             284742741343553165/9275265620066061;
             -25810583238434097767/51997701203400645;
             29985328840009119006959/11439494264748141900;
             -6332936841882181293233/1271054918305349100;
             5934214756682873188013/1906582377458023650;
             -14214034409621076703/49026403991777751;
             1233052285368734443/343184827942444257];

disp(matrix);
printf("Ind terms:\r\n");
disp(ind);
printf("\r\n");

printf("### GAUSS ###\r\n");
printf("Processed matrix:\r\n");
[rmat, rind] = gaussify(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
result = upper_triangular(rmat, rind);
printf("Solution:\r\n");
disp(result);

printf("Expected solution:\r\n");
disp(solution);
printf("Error:\r\n");
err = error_sol(solution, result);
disp(err);
printf("\r\n");

printf("### GAUSS PIVOT ###\r\n");
printf("Processed matrix:\r\n");
[rmat, rind] = gaussify_pivot_partial(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
result = upper_triangular(rmat, rind);
printf("Solution:\r\n");
disp(result);

printf("Expected solution:\r\n");
disp(solution);
printf("Error:\r\n");
err = error_sol(solution, result);
disp(err);
printf("\r\n");

printf("### GAUSS PIVOT MAX ###\r\n");
printf("Processed matrix:\r\n");
[rmat, rind, rord] = gaussify_pivot_full(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
printf("Solution order:\r\n");
disp(rord);
printf("\r\n");

result = upper_triangular(rmat, rind);
printf("Solution:\r\n");
disp(result);
tmp_mat = rmat;
tmp_result = result;
for i = 1:length(rord)
	result(rord(i)) = tmp_result(i);
	for j = 1:columns(rmat)
		rmat(rord(i), j) = tmp_mat(i, j);
	end
end

printf("Reordered matrix\r\n");
disp(rmat);
printf("Reordered solution:\r\n");
disp(result);

printf("Expected solution:\r\n");
disp(solution);
printf("Error:\r\n");
err = error_sol(solution, result);
disp(err);
