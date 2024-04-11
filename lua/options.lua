local opt = vim.opt

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                                -- Enable mouse support
opt.clipboard = 'unnamedplus'                  -- Copy/paste to system clipboard
opt.swapfile = false                           -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options
opt.breakindent = true                         -- Enable break indent
opt.undofile = true                            -- Save undo history
opt.scrolloff = 30                             -- Minimal number of screen lines to keep above and below the cursor
opt.hlsearch = true                            -- Set highlight on search, but clear on pressing <Esc> in normal mode

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.syntax = 'on'
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', eol = '|', space = '~' }
opt.number = true           -- Show line number
-- opt.relativenumber = true --
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus = 3          -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event
