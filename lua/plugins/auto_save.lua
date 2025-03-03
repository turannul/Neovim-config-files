return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            enabled = true,
            trigger_events = {"TextChanged", "FocusLost"},
            execution_message = {
            message = function()
		return ("Saved at " .. vim.fn.strftime("%H:%M:%S"))
		end,
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")
		local mode = vim.api.nvim_get_mode().mode
					if mode == "c" then -- CLI Mode the mode you enter when pressed ESC 
					return false
				end
                if
                    fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                    return true -- met condition(s), can save
                end
                return false -- can't save
            end,
            clean_delay = 0,
            },
            debounce_delay = 500, -- Time in milliseconds
        })
        end
}
