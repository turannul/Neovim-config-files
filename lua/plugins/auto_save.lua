return {
  "okuuva/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      -- Auto-Save rules.
      trigger_events = {
        immediate_save = {"BufLeave", "FocusLost"},  -- events that trigger an immediate save (Immediate save)
        defer_save = {"TextChangedI"},               -- events that trigger a deferred save (Saves after debounce_delay)
        cancel_deferred_save = {"InsertEnter"},      -- events that cancel a pending deferred save (Cancels deferred save debounce_delay)
      },
      condition = function(buf)
        return vim.fn.getbufvar(buf, "&modifiable") == 1
      end,
      write_all_buffers = false,  -- only write the current buffer when its condition is met
      debounce_delay = 1000,      -- save at most every 1000 milliseconds
    })
    -- Notification on save
    local group = vim.api.nvim_create_augroup("autosave", {})
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePost",
      group = group,
      callback = function(opts)
        if opts.data.saved_buffer then
          vim.notify(string.format("💾 %s at %s", vim.fn.expand("%:t"), vim.fn.strftime("%H:%M")), vim.log.levels.INFO, { title = "AutoSave" })
        end
      end,
    })
  end
}
