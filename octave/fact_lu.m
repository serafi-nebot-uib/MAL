function [low, up] = fact_lu(matrix)
	# Perform a matrix LU decomposition
	#	Factorizes a square matrix to lower and upper triangular matrices,
	#	where A = original matrix, L = lower triangular matrix, U = upper triangular matrix,
	#	so that A = LU
	#
	# Params:
	#	matrix: matrix to factorize (must be a square matrix)
	#
	# Returns:
	#	vector[low, up]
	#		low: lower triangular factorized matrix
	#		up: upper triangular factorized matrix
	mrows = rows(matrix);
	mcols = columns(matrix);
	up = matrix;
	low = zeros(mrows, mcols);

	if mrows != mcols
		error("supplied matrix is not a square matrix");
	end

	# gaussian elimination
	for i = 1:mrows - 1
		for j = i + 1:mrows
			mult = up(j, i) / up(i, i);
			for k = 1:mcols
				up(j, k) = up(j, k) - mult * up(i, k);
			end
			low(j, i) = mult;
		end
	end

	for i = 1:mrows
		low(i, i) = 1;
	end
end

