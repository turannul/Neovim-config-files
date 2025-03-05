return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      trigger_events = {"TextChanged", "TextChangedI", "CursorHoldI"},
      execution_message = {
        message = function()
          local save_msg = string.format(("💾 %s at %s"):format(vim.fn.expand("%:t"), vim.fn.strftime("%H:%M")))
          return vim.notify(save_msg)
        end,
      },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true -- Save (If file is modifiable and not blacklisted.)
        end
        return false  -- Default to not save
      end,
      write_all_buffers = false, -- write all buffers when the current one meets `condition`
      debounce_delay = 5000, -- saves the file at most every `debounce_delay` milliseconds
    })
  end
}
