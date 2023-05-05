-- color control function
function SetGlobalColor(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

-- global call to set color on launch
SetGlobalColor()
