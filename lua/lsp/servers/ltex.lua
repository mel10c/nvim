return {
    cmd = {"ltex-ls"};
    filetypes = {'tex', 'bib', 'latex'};
    settings = {
        ltex = {
            enabled= {"latex", "tex", "bib"},
            checkFrequency="save",
            language="pt-BR",
            diagnosticSeverity="information",
            setenceCacheSize=5000,
            additionalRules = {
                enablePickyRules = true,
                motherTongue= "pt-BR",
            };
            },
        };
    }
