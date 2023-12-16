function [R] = rsolve_plu(Ti, a, n)
	[P, L, U] = fact_lu_pivot_partial(Ti);
	R = [a nan(rows(a), n)];
	for i = 1:columns(R)-1
		R(:,i+1) = upper_triangular(U, lower_triangular(L, P * R(:,i)));
	end
end
