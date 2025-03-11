return {
  "okuuva/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true,
      trigger_events = {
        immediate_save = {"BufLeave", "FocusLost"},
        defer_save = {"TextChangedI"},
        cancel_deferred_save = {"InsertEnter"},
      },
      condition = function(buf)
        return vim.fn.getbufvar(buf, "&modifiable") == 1
      end,
      write_all_buffers = false,
      debounce_delay = 1000,
    })
    local group = vim.api.nvim_create_augroup("autosave", {})
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePost",
      group = group,
      callback = function(opts)
        if opts.data.saved_buffer then
          vim.notify(string.format("💾 %s", vim.fn.expand("%:t")), vim.log.levels.INFO, { title = "AutoSave" })
        end
      end,
    })
  end
}
