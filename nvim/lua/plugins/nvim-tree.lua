return {
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>", {desc = "Toggle [E]xplorer"})
            require("nvim-tree").setup({
                hijack_netrw = true,
                auto_reload_on_write = true,
                actions = {
                    change_dir = {
                      restrict_above_cwd = true, -- Prevents going above the current root
                    },
                },
                -- Disable sync to avoid erratic root changes
                sync_root_with_cwd = false,
                respect_buf_cwd = false,
                renderer = {
                  group_empty = true,
                }, -- combine empty directories like packages and folders
                update_focused_file = {
                  enable = true,
                  update_cwd = true,
                  ignore_list = {},
                },
                view = {
                    width = 40
                }
            })
        end
    },
    { "nvim-tree/nvim-web-devicons",
      config = function()
          require'nvim-web-devicons'.setup {
             -- globally enable different highlight colors per icon (default to true)
             -- if set to false all icons will have the default icon's color
             color_icons = true;
             -- globally enable default icons (default to false)
             -- will get overriden by `get_icons` option
             default = true;
             -- globally enable "strict" selection of icons - icon will be looked up in
             -- different tables, first by filename, and if not found by extension; this
             -- prevents cases when file doesn't have any extension but still gets some icon
             -- because its name happened to match some extension (default to false)
             strict = true;
             -- set the light or dark variant manually, instead of relying on `background`
             -- (default to nil)
             variant = "light|dark";
             -- override blend value for all highlight groups :h highlight-blend.
             -- setting this value to `0` will make all icons opaque. in practice this means
             -- that icons width will not be affected by pumblend option (see issue #608)
             -- (default to nil)
             blend = 0;
             -- same as `override` but specifically for overrides by filename
             -- takes effect when `strict` is true
             override_by_filename = {
              [".gitignore"] = {
                icon = "",
                color = "#f1502f",
                name = "Gitignore"
              }
             };
             -- same as `override` but specifically for overrides by extension
             -- takes effect when `strict` is true
             override_by_extension = {
              ["log"] = {
                icon = "",
                color = "#81e043",
                name = "Log"
              }
             };
            }
      end
    }
}
