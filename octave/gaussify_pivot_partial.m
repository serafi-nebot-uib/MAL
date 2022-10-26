function [rmat, rind] = gaussify_pivot_partial(matrix, ind)
	# Convert a system of equations to upper triangular.
	#	Converts a system of equations to an equilavent upper triangular system of equations
	#	using partial pivoting and gaussian elimination.
	#
	# Params:
	#	matrix: matrix containing the system of equation's terms
	#	ind: vector containing the system of equation's independent terms
	#
	# Returns:
	#	vector[rmat, rind]
	#		rmat: converted matrix
	#		rind: converted independent terms vector
	mrows = rows(matrix);
	mcols = columns(matrix);
	rmat = matrix;
	rind = ind;

	if mrows != mcols
		error("supplied matrix is not a square matrix");
	end

	for i = 1:mrows - 1
		# find the greatest value inside the current column
		gri = i; # greatest row index
		for j = i:mrows
			if abs(rmat(j, i)) > abs(rmat(gri, i))
				gri = j;
			end
		end

		if rmat(gri, i) != 0
			# permutate rows
			tmp_mat = rmat;
			for j = 1:mcols
				rmat(i, j) = tmp_mat(gri, j);
				rmat(gri, j) = tmp_mat(i, j);
			end
			tmp_ind = rind;
			rind(i) = tmp_ind(gri);
			rind(gri) = tmp_ind(i);
		end

		# gaussian elimination
		for j = i + 1:mrows
			mult = rmat(j, i) / rmat(i, i);
			for k = 1:mcols
				rmat(j, k) = rmat(j, k) - mult * rmat(i, k);
			end
			rind(j) = rind(j) - mult * rind(i);
		end
	end
end

