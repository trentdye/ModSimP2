%%
% 
% Input: integer 1-5
%
% Output: Vector of RGB values suitable as a color code.
%
% Example:
% plot(X, 'LineWidth', 4, 'Color', colorBrewer(3))

function res = col2(i)

    colors = [[161,123,138]
              [23,163,165]
              [141,191,103]
              [252,203,95]
              [252,110,89]] / 256;

    res = colors(i,:);
end

