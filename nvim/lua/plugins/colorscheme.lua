return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        require('kanagawa').setup({
            -- tranasparent = true,
            theme = "wave",              -- Load "wave" theme
            background = {               -- map the value of 'background' option to a theme
                dark = "wave",           -- try "dragon" !
                light = "lotus"
            },
        })
        vim.cmd("colorscheme kanagawa")
    end
}
