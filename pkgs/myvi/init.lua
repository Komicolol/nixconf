-- i can't be bothered splitting this up.
-- i don't care if it looks like i'm copying sioodmy, because there's
-- a 99% chance i did.

vim.loader.enable()
-- options
vim.o.termguicolors = true
vim.o.laststatus=3
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.cursorline = true
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.shiftwidth=4
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.relativenumber = true
vim.o.number = true
vim.o.cmdheight = 0
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    signs = false,
})
-- !!! themes !!!
-- *** onedark ***
require("onedarkpro").setup ({
  options = {
    transparency = false
  }
})
vim.cmd("colorscheme onedark")
-- *** kanagawa ***
-- require("kanagawa").setup({
--     transparent = true
-- })
-- vim.cmd("colorscheme kanagawa")
-- *** everforest ***
-- vim.cmd("colorscheme everforest")

-- bars!
require('barbar').setup()

-- dashboard
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
dashboard.section.header.val = {
[[  __          __          __          __          __          __          ]],
[[_/  |_  _____/  |_  _____/  |_  _____/  |_  _____/  |_  _____/  |_  ____  ]],
[[\   __\/ __ \   __\/  _ \   __\/ __ \   __\/  _ \   __\/ __ \   __\/  _ \ ]],
[[ |  | \  ___/|  | (  <_> )  | \  ___/|  | (  <_> )  | \  ___/|  | (  <_> )]],
[[ |__|  \___  >__|  \____/|__|  \___  >__|  \____/|__|  \___  >__|  \____/ ]],
[[           \/                      \/                      \/             ]],
}
dashboard.section.buttons.val = {
  dashboard.button("e", "NEW FILE", ":ene<BAR> startinsert<CR>"),
  dashboard.button("f", "find files??", ":FzfLua files<CR>"),
  dashboard.button("a", "agenda www", ":Org agenda<CR>"),
  dashboard.button("q", "leaving :(", ":qa<CR>"),
}
dashboard.section.footer.val = "▼・ᴗ・▼"
dashboard.config.opts.noautocmd = true
vim.cmd[[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]]
alpha.setup(dashboard.config)
-- orgmode 
require("orgmode").setup({
  org_agenda_files = '~/Notes/roam/agenda.org',
})
require("org-roam").setup({
  directory = '~/Notes/roam',
})

-- completions
local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup({
    snippet = {
      expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.    
    end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
         ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            if luasnip.expandable() then
                luasnip.expand()
            else
                cmp.confirm({
                    select = true,
                })
            end
        else
            fallback()
        end
    end),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    }, {
      { name = 'path' },
    }, {
      { name = 'treesitter' },
    }, {
      { name = 'luasnip'},
    })
})
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- If you want insert `(` after select function or method item
require('nvim-autopairs').setup()
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- keybinds
vim.keymap.set('n', '<leader>.', ':Ex<CR>')

vim.keymap.set('n', '<leader><tab>', '<cmd>BufferNext<CR>')
vim.keymap.set('n', '<leader><s-tab>', '<cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<leader>x', '<cmd>BufferClose<CR>')

vim.keymap.set('n', '<leader>fb', ':setl fo=aw2tq<CR>', {desc = "paragraph formatting"})
vim.keymap.set('n', '<leader>F', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>fgs', ':FzfLua git_status<CR>')
vim.keymap.set('n', '<leader>fgd', ':FzfLua git_diff<CR>')


-- lsp configs
local nlsp = vim.lsp
nlsp.enable('nixd')
nlsp.enable('clangd')
nlsp.enable('pyright')

