function [B] = inverse_lu(A)
	[L, U] = fact_lu(A);
	B = eye(columns(A));
	for i = 1:columns(A)
		y = lower_triangular(L, B(:,i));
		r = B(:,i) - L*y;
		ytmp = NaN; rtmp = NaN;
		while !all(r == 0) && (norm(rtmp) < norm(r) || isnan(rtmp))
			if !isnan(rtmp); r = rtmp; y = ytmp; end
			ytmp = y + lower_triangular(L, r);
			rtmp = B(:,i) - L*ytmp;
		end

		x = upper_triangular(U, y);
		r = y - U*x;
		xtmp = NaN; rtmp = NaN;
		while !all(r == 0) && (norm(rtmp) < norm(r) || isnan(rtmp))
			if !isnan(rtmp); r = rtmp; x = xtmp; end
			xtmp = x + upper_triangular(U, r);
			rtmp = y - U*xtmp;
		end
		B(:,i) = x;
	end
end

