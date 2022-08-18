return {
    cmd = {"ltex-ls"};
    filetypes = {'tex', 'bib', 'latex',};
    settings = {
        ltex = {
            enabled= {"latex", "tex", "bib"},
            checkFrequency="save",
            language="en-us",
            diagnosticSeverity="information",
            setenceCacheSize=5000,
            additionalRules = {
                enablePickyRules = true,
                -- motherTongue= "pt-BR",
                motherTongue= "en-us",
            };
            },
        };
    }
