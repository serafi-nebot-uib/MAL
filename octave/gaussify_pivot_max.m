function [rmat, rind, rpos] = gaussify_pivot_max(matrix, ind)
	# Convert a system of equations to upper triangular.
	#	Converts a system of equations to an equilavent upper triangular system of equations
	#	using maximal pivoting and gaussian elimination.
	#
	# Params:
	#	matrix: matrix containing the system of equation's terms
	#	ind: vector containing the system of equation's independent terms
	#
	# Returns:
	#	vector[rmat, rind, rpos]
	#		rmat: converted matrix
	#		rind: converted independent terms vector
	#		rpos: solution order
	mrows = rows(matrix);
	mcols = columns(matrix);
	rmat = matrix;
	rind = ind;
	rpos = 1:mrows;

	if mrows != mcols
		error("supplied matrix is not a square matrix");
	end

	for i = 1:mrows - 1
		# find the greatest value inside the current submatrix
		gri = i; # greatest row index
		gci = i; # greatest column index
		for j = i:mrows
			for k = i:mcols
				if abs(rmat(j, k)) > abs(rmat(gri, gci))
					gri = j;
					gci = k;
				end
			end
		end

		if rmat(gri, gci) != 0
			# permutate rows
			tmp_mat = rmat;
			for j = 1:mcols
				rmat(i, j) = tmp_mat(gri, j);
				rmat(gri, j) = tmp_mat(i, j);
			end
			tmp_ind = rind;
			rind(i) = tmp_ind(gri);
			rind(gri) = tmp_ind(i);

			# permutate columns
			tmp_mat = rmat;
			for j = 1:mrows
				rmat(j, i) = tmp_mat(j, gci);
				rmat(j, gci) = tmp_mat(j, i);
			end
			tmp_pos = rpos;
			rpos(i) = tmp_pos(gci);
			rpos(gci) = tmp_pos(i);
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

