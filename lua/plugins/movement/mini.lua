return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Simple and easy statusline.
    --  You could remove this setup call if you don't like it,
    --  and try some other statusline plugin
    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
    -- left = '<M-h>',
    --     right = '<M-l>',
    --     down = '<M-j>',
    --     up = '<M-k>',
    --
    --     -- Move current line in Normal mode
    --     line_left = '<M-h>',
    --     line_right = '<M-l>',
    --     line_down = '<M-j>',
    --     line_up = '<M-k>',
    require('mini.move').setup {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = 'Ì',
        right = '¬',
        down = 'Ï',
        up = 'È',

        -- Move current line in Normal mode
        line_left = 'Ì',
        line_right = '¬',
        line_down = 'Ï',
        line_up = 'È',
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    }

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}