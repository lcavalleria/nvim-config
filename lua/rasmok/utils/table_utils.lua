local M = {}

local table_to_string

local function noop(...)
	return ...
end

local function concat(t1, t2)
	local t3 = {}
	for k, v in pairs(t1) do
		t3[k] = v
	end
	for k, v in pairs(t2) do
		t3[k] = v
	end
	return t3
end

-- convert a nested table to a flat table
local function flatten(t, sep, key_modifier, res)
	if type(t) ~= "table" then
		return t
	end

	if sep == nil then
		sep = "."
	end

	if res == nil then
		res = {}
	end

	if key_modifier == nil then
		key_modifier = noop
	end

	for k, v in pairs(t) do
		if type(v) == "table" then
			local v = flatten(v, sep, key_modifier, {})
			for k2, v2 in pairs(v) do
				res[key_modifier(k) .. sep .. key_modifier(k2)] = v2
			end
		else
			res[key_modifier(k)] = v
		end
	end
	return res
end

-- Convert a lua table into a lua syntactically correct string
table_to_string = function(tbl)
	local result = "{"
	for k, v in pairs(tbl) do
		-- Check the key type (ignore any numerical keys - assume its an array)
		if type(k) == "string" then
			result = result .. '["' .. k .. '"]' .. "="
		end

		-- Check the value type
		if type(v) == "table" then
			result = result .. table_to_string(v)
		elseif type(v) == "boolean" then
			result = result .. tostring(v)
		else
			result = result .. '"' .. v .. '"'
		end
		result = result .. ","
	end
	-- Remove leading commas from the result
	if result ~= "" then
		result = result:sub(1, result:len() - 1)
	end
	return result .. "}"
end

local values_of = function(t)
	local vt = {}
	for _, v in pairs(t) do
		table.insert(vt, v)
	end
	return vt
end

local keys_of = function(t)
	local kt = {}
	for k, _ in pairs(t) do
		table.insert(kt, k)
	end
	return kt
end

local map_values -- declare early to call recursively
map_values = function(t, f)
	local mt = {}
	for k, v in pairs(t) do
		if type(v) == "string" then
			mt[k] = f(v)
		else
			mt[k] = map_values(v, f)
		end
	end
	return mt
end

M.flatten = flatten
M.table_to_string = table_to_string
M.values_of = values_of
M.keys_of = keys_of
M.map_values = map_values
M.concat = concat

return M
