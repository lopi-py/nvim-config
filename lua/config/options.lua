local o = vim.opt

o.autoindent = true
o.backspace = { "indent", "eol", "start" }
o.colorcolumn = "+0"
o.conceallevel = 0
o.confirm = true
o.cursorline = true
o.errorbells = false
o.expandtab = true
o.exrc = true
o.fillchars = {
  diff = "╱",
  eob = " ",
  fold = " ",
  foldsep = " ",
  foldopen = "",
  foldclose = "",
}
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.guifont = "JetBrainsMono Nerd Font:h10"
o.history = 50
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.list = true
o.listchars = {
  eol = " ",
  tab = "  ",
  extends = "»",
  precedes = "«",
  trail = "•",
}
o.modeline = false
o.mousemoveevent = true
o.number = true
o.relativenumber = true
o.scrolloff = 1
o.shiftround = true
o.shiftwidth = 2
o.showcmd = false
o.showmode = false
o.sidescrolloff = 1
o.smartcase = true
o.smartindent = true
o.smarttab = true
o.smoothscroll = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 2
o.termguicolors = true
o.undofile = false
o.updatetime = 300
o.whichwrap:append "<,>,[,],h,l"
o.wildmenu = false
o.wrap = true
o.writebackup = false
