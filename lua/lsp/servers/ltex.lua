local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
    table.insert(words, word)
end

return {
    cmd = {"ltex-ls"};
    filetypes = {'tex', 'bib', 'latex', "markdown"};
    settings = {
        ltex = {
            enabled= {"latex", "tex", "bib", "markdown"},
            checkFrequency="save",
            language="en-us",
            diagnosticSeverity="information",
            setenceCacheSize=5000,
            additionalRules = {
                enablePickyRules = true,
                -- motherTongue= "pt-BR",
                motherTongue= "en-us",
            };
            dictionary = { ["en-us"] = words };
        };
    };
}
