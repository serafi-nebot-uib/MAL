function [R] = rsolve_pqlu(A, b, n)
	[P, Q, L, U] = fact_pqlu(A);
	R = [b nan(rows(b), n)];
	for i = 1:columns(R)-1
		R(:,i+1) = Q * upper_triangular(U, lower_triangular(L, P * R(:,i)));
	end
end
