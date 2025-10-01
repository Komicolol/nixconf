vim.loader.enable()
-- options
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
vim.o.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    signs = false,
})
-- onedark
require("onedarkpro").setup ({
  options = {
    transparency = true
  }
})
vim.cmd("colorscheme onedark")

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
      -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
      -- ['<C-Space>'] = cmp.mapping.complete(),
      -- ['<C-e>'] = cmp.mapping.abort(),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
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

require('nvim-autopairs').setup()
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- bars!
require('barbar').setup()

-- keybinds
vim.keymap.set('n', '<leader>.', ':Ex<CR>')
vim.keymap.set('n', '<leader>u', ':update<CR> :source ./nvim/init.lua<CR>') -- testing purposes, delete later

vim.keymap.set('n', '<leader><tab>', '<cmd>BufferNext<CR>')
vim.keymap.set('n', '<leader><s-tab>', '<cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<leader>x', '<cmd>BufferClose<CR>')

vim.keymap.set('n', '<leader>ff', ':FzfLua files<CR>')
vim.keymap.set('n', '<leader>fgs', ':FzfLua git_status<CR>')
vim.keymap.set('n', '<leader>fgd', ':FzfLua git_diff<CR>')


-- lsp configs
local nlsp = vim.lsp
-- nlsp.enable('nixd')
nlsp.enable('clangd')
nlsp.enable('pyright')

