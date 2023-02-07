function onInit()
    registerOptionsT();
end

function registerOptionsT()
    OptionsManager.registerOption2("TSOS",true, "option_header_tooltip", "option_label_TSOS", "option_entry_cycler", 
    { labels = "option_val_on", values = "on", baselabel = "option_val_off", baseval = "off", default = "off" });
end
