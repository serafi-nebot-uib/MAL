function [perm, low, up] = fact_lu_pivot_partial(matrix, ind)
	# Perform a matrix PLU decomposition
	#	Factorizes a square matrix to lower and upper triangular matrices
	#	with partial pivoting, where A = original matrix, P = row permutation matrix,
	#	L = lower triangular matrix, U = upper triangular matrix,
	#	so that PA = LU
	#
	# Params:
	#	matrix: matrix to factorize (must be a square matrix)
	#
	# Returns:
	#	vector[perm, low, up]
	#		perm: row permutation matrix
	#		low: lower triangular factorized matrix
	#		up: upper triangular factorized matrix
	mrows = rows(matrix);
	mcols = columns(matrix);
	up = matrix;
	low = zeros(mrows, mcols);
	perm = eye(mrows, mcols);

	if mrows != mcols
		error("supplied matrix is not a square matrix");
	end

	for i = 1:mrows - 1
		# find the greatest value inside the current column
		gri = i; # greatest row index
		for j = i:mrows
			if abs(up(j, i)) > abs(up(gri, i))
				gri = j;
			end
		end

		# printf("\r\n");
		# disp(up);
		# printf("greatest: %d, %d = %f\r\n", gri, i, up(gri, i));

		if up(gri, i) != 0
			# permutate rows
			tmp_up = up;
			tmp_low = low;
			tmp_perm = perm;
			for j = 1:mcols
				up(i, j) = tmp_up(gri, j);
				up(gri, j) = tmp_up(i, j);
				low(i, j) = tmp_low(gri, j);
				low(gri, j) = tmp_low(i, j);
				perm(i, j) = tmp_perm(gri, j);
				perm(gri, j) = tmp_perm(i, j);
			end
		end

		# gaussian elimination
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

