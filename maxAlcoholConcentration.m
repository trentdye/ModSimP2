function res = maxAlcoholConcentration(T, M)
	Y1 = M(:,1);
    Y2 = M(:,2);
    res = max(Y2);

% Find the latest time when concentration in lean body mass is less
% than a given level.
%     for i = length(Y2):-1:1
%         if Y2(i) > 0.2
%             res = T(i);
%             return
%         end
%     end
%     res = 0;
end