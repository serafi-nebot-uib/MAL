function [R] = rsolve_pqlu(A, b, n)
	# Recursively solve the equation Ax = b, n times. For each iteration, the solution x of the
	# previous iteration is used as the independent term vector b.
	[P, Q, L, U] = fact_pqlu(A);
	R = [b nan(rows(b), n)]; # each column of R will be solution of each iteration
	for i = 1:columns(R)-1
		R(:,i+1) = Q * solve_upper_triangular(U, solve_lower_triangular(L, P * R(:,i)));
	end
end
