return {
  "olimorris/persisted.nvim",
  lazy=false,
  config = function ()
    require("persisted").setup({
        autosave=true,
        autostart=true
    })
  end
}
