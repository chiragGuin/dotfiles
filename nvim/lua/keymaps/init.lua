local path = "keymaps"
local files = vim.fn.stdpath("config") .. "/lua/" .. path
for name, type in vim.fs.dir(files) do
	if type == "file" and name:match("%.lua$") and name ~= "init.lua" then
		require(path .. "." .. name:gsub("%.lua$", ""))
	end
end
