return {
    "junegunn/fzf.vim",
    config = function()
        vim.api.nvim_set_keymap('n', '<leader>f', ':Files<CR>', { noremap = true, silent = true })   -- Search files
        vim.api.nvim_set_keymap('n', '<leader>g', ':Rg<CR>', { noremap = true, silent = true })      -- Search text
        vim.api.nvim_set_keymap('n', '<leader>b', ':Buffers<CR>', { noremap = true, silent = true }) -- Search buffers
        -- FZF Preview and Config
        vim.g.fzf_preview_window = {'right:60%', 'ctrl-/'}
        vim.g.fzf_command_prefix = 'Fzf'
        vim.api.nvim_exec([[let $FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range=:500 {}"']], false)
        -- Ripgrep configuration for searching
        vim.o.grepprg = "rg --vimgrep --smart-case"
        vim.o.grepformat = "%f:%l:%c:%m"
        vim.api.nvim_set_keymap('n', '<leader>r', ':grep! ', { noremap = true, silent = false })
    end
}