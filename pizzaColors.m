%%
% 
% Input: integer 1-5
%
% Output: Vector of RGB values suitable as a color code.
%
% Example:
% plot(X, 'LineWidth', 4, 'Color', colorBrewer(3))

%CHEESE CRUST AIR BOX
function res = pizzaColors(i)

    colors = [[252 203 96]
              [243 110 90]
              [21 163 165]
              [182 141 97]
              [141 191 102]
              [161 123 138]] / 256;

    res = colors(i,:);
end

