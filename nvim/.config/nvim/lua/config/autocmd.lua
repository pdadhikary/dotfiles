local open_group = vim.api.nvim_create_augroup("FileOpenGroup", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = open_group,
  pattern = "*",
  callback = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
          highlighters = {
              fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
              hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
              todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
              note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

              hex_color = hipatterns.gen_highlighter.hex_color(),
          },
      })
  end,
})
