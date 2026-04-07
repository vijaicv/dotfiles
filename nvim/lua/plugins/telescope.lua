return {
    {
        'nvim-telescope/telescope.nvim',
        config = function ()
            require("telescope").setup({
                defaults = {
                    path_display = {
                        "filename_first"
                    },
                    layout_strategy = "horizontal"
                }
            })
        end
    }}
