function [perm_r, perm_c, low, up] = fact_lu_pivot_full(matrix)
	# Perform a matrix PLU decomposition
	#	Factorizes a square matrix to lower and upper triangular matrices
	#	with full pivoting, where A = original matrix, P = row permutation matrix,
	#	Q = column permutation matrix, L = lower triangular matrix, U = upper triangular matrix,
	#	so that PAQ = LU
	#
	# Params:
	#	matrix: matrix to factorize (must be a square matrix)
	#
	# Returns:
	#	vector[perm_r, perm_c, low, up]
	#		perm_r: row permutation matrix
	#		perm_c: column permutation matrix
	#		low: lower triangular factorized matrix
	#		up: upper triangular factorized matrix
	mrows = rows(matrix);
	mcols = columns(matrix);
	up = matrix;
	low = zeros(mrows, mcols);
	perm_r = eye(mrows, mcols);
	perm_c = eye(mrows, mcols);

	if mrows != mcols
		error("supplied matrix is not a square matrix");
	end

	for i = 1:mrows - 1
		# find the greatest value inside the current submatrix
		gri = i; # greatest row index
		gci = i; # greatest column index
		for j = i:mrows
			for k = i:mcols
				if abs(up(j, k)) > abs(up(gri, gci))
					gri = j;
					gci = k;
				end
			end
		end

		if up(gri, gci) != 0
			# permutate rows
			tmp_up = up;
			tmp_perm_r = perm_r;
			for j = 1:mcols
				up(i, j) = tmp_up(gri, j);
				up(gri, j) = tmp_up(i, j);
				perm_r(i, j) = tmp_perm_r(gri, j);
				perm_r(gri, j) = tmp_perm_r(i, j);
			end

			# permutate columns
			tmp_up = up;
			tmp_perm_c = perm_c;
			for j = 1:mrows
				up(j, i) = tmp_up(j, gci);
				up(j, gci) = tmp_up(j, i);
				perm_c(j, i) = tmp_perm_c(j, gci);
				perm_c(j, gci) = tmp_perm_c(j, i);
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
