-- Used in plugin-list.lua. Referencing kickstart.nvim.
return function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping.confirm { select = true },

        -- If you prefer more traditional completion keymaps,
        -- you can uncomment the following lines
        --['<CR>'] = cmp.mapping.confirm { select = true },
        --['<Tab>'] = cmp.mapping.select_next_item(),
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),

        -- Manually trigger a completion from nvim-cmp.
        --  Generally you don't need this, because nvim-cmp will display
        --  completions whenever it has completion options available.
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Think of <c-l> as moving to the right of your snippet expansion.
        --  So if you have a snippet that's like:
        --  function $name($args)
        --    $body
        --  end
        --
        -- <c-l> will move you to the right of each of the expansion locations.
        -- <c-h> is similar, except moving you backwards.
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },
      sources = {
        {
          name = 'lazydev',
          -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
          group_index = 0,
        },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
      },
    }

    -- Cmdline (`:`) completion. `cmdline` source feeds the matches
    -- you'd get from native `wildmenu` (commands, flags, paths) plus
    -- buffer-word fallback. Tab/S-Tab cycle the popup; <CR> still
    -- runs the command.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline({
        ['<Tab>'] = {
          c = function(fallback)
            if cmp.visible() then cmp.select_next_item()
            else cmp.complete() end
          end,
        },
        ['<S-Tab>'] = {
          c = function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            else fallback() end
          end,
        },
      }),
      sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
      ),
      matching = { disallow_symbol_nonprefix_matching = false },
    })

    -- Search (`/` and `?`) completion: just buffer words. Cheap, fast.
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = 'buffer' } },
    })
  end
