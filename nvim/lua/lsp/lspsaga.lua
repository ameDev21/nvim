local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

require("lspsaga").setup({
  definition = {
    edit = "<CR>",
    vsplit = "<C-c>v",
    split = "<C-c>i",
    tabe = "<C-c>t",
    quit = "q",
    close = "<Esc>",
  },
})
