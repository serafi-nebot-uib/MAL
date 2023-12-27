function [result] = solve_lower_triangular(matrix, ind)
	# Solve a lower triangular system of equations.
	mrows = rows(matrix);
	mcols = columns(matrix);

	if mrows != mcols
		error("supplied matrix is not a square matrix");
	end

	result = zeros(mcols, 1);
	result(1) = ind(1) / matrix(1, 1);

	for i = 2:mrows
		ind_result = ind(i);
		# for j = i - 1:-1:1
		for j = 1:i - 1
			prev = ind_result;
			ind_result -= matrix(i, j) * result(j);
		end
		result(i) = ind_result / matrix(i, i);
	end
end
