local present, impatient = pcall(require, "impatient")

if present then
   impatient.enable_profile()
end

local core_modules = {
    "settings",
    "mappings",
    "autocmd",
    "util",
}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading " .. module .. "\n\n" .. err)
    end
end

require('util').disable()
