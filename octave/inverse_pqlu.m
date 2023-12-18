function [B] = inverse_paqlu(A)
	[P, Q, L, U] = fact_lu_pivot_full(A);
	Pi = inverse(P);
	B = eye(columns(A));
	for i = 1:columns(A)
		y = lower_triangular(L, P * B(:,i));
		r = B(:,i) - Pi*L*y;
		ytmp = NaN; rtmp = NaN;
		while !all(r == 0) && (norm(rtmp) < norm(r) || isnan(rtmp))
			if !isnan(rtmp); r = rtmp; y = ytmp; end
			ytmp = y + lower_triangular(L, P*r);
			rtmp = B(:,i) - Pi*L*ytmp;
		end

		z = upper_triangular(U, y);
		r = y - Q*U*z;
		ztmp = NaN; rtmp = NaN;
		while !all(r == 0) && (norm(rtmp) < norm(r) || isnan(rtmp))
			if !isnan(rtmp); r = rtmp; z = ztmp; end
			ztmp = z + upper_triangular(U, r);
			rtmp = y - Q*U*ztmp;
		end
		B(:,i) = Q*z;
	end
end
