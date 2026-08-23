local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd('TextYankPost', {
    callback = function ()
        vim.hl.on_yank()
    end,
})

-- Restore cursor position on file open
autocmd('BufReadPost', {
    callback = function(args)
        local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
        local line_count = vim.api.nvim_buf_line_count(args.buf)
        if mark[1] > 0 and mark[1] <= line_count then
            vim.cmd 'normal! g`"zz'
        end
    end,
})

-- Disable auto comment on new line
autocmd('FileType', {
    pattern = '*',
    callback = function ()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

