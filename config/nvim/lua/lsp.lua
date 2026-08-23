vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        style = 'minimal',
        border = 'single',
        source = 'if_many',
        header = '',
        prefix = '',
    },
})

vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client ~= nil and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable({
    'lua_ls',
    'nil_ls',
    'bashls',
    'rust_analyzer',
    'ruby_lsp',
    'html',
    'cssls',
    'taplo',
    'gopls',
    'zls',
    'ts_ls',
    'oxlint',
    'oxfmt',
})

