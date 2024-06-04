local M = {}

local hyphens_to_underscores = function(s)
	return s:gsub("-", "_")
end

M.hyphens_to_underscores = hyphens_to_underscores

return M
