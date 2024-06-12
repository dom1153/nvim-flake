if vim.g.did_load_conform_plugin then
  return
end
vim.g.did_load_conform_plugin = true

-- [[ VIM OPTIONS ]]
vim.g.autoformat = true
--
-- -- there exists a recipe to do conform toggle...
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*',
--   callback = function(args)
--     local buf = vim.b.autoformat
--     local globe = vim.g.autoformat
--     if false == buf then
--     elseif buf or globe then
--       require('conform').format({
--         bufnr = args.buf,
--         -- async ignores timout ; for some reason in practice my fomrmatters run slow...
--         async = true,
--         lsp_fallback = true,
--         -- timeout_ms = 500,
--       })
--     end
--   end,
-- })
--
-- [[ DEFINES ]]

-- [[ HELPER FUNCTIONS ]]
local function autoformat_toggle_buffer()
  -- never initially set buffer autoformat value
  -- if nil == vim.b.autoformat then
  --   -- so the first time we toggle, we want to disable autoformat
  --   vim.b.autoformat = false
  -- else
  --   vim.b.autoformat = not vim.b.autoformat
  -- end

  if nil == vim.b.autoformat then
    -- so the first time we toggle, we want to disable autoformat
    vim.b.autoformat = false
  else
    vim.b.autoformat = not vim.b.autoformat
  end
end

local function autoformat_toggle_global()
  vim.g.autoformat = not vim.g.autoformat
end

-- [[ KEYMAPS ]]
-- vim.keymap.set('n', '<leader>uf', autoformat_toggle_buffer, { desc = 'Toggle auto format (buffer)' })
-- vim.keymap.set('n', '<leader>uF', autoformat_toggle_global, { desc = 'Toggle auto format (global)' })

-- [[ SETUP ]]
require('conform').setup({
  -- timeout_ms = 500,
  lsp_fallback = true,

  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.autoformat == false or vim.b[bufnr].autoformat == false then
      return
    end
    -- timeout_ms does not apply with async (default 1000ms)
    -- async is not great with format_on_save
    return { lsp_fallback = true }
  end,

  -- notify_on_error = true,
  formatters = {
    -- yamlfix env untested
    yamlfix = {
      env = {
        YAMLFIX_SECTION_WHITELINES = '1',
      },
    },
    yamlfmt = {
      -- https://github.com/google/yamlfmt/blob/main/docs/config-file.md--basic-formatter
      prepend_args = { '-formatter', 'retain_line_breaks_single=true,include_document_start=true' },
    },
  },
  formatters_by_ft = {
    lua = { 'stylua' },

    -- Conform will run multiple formatters sequentially
    python = { 'isort', 'black' },

    -- Use a sub-list to run only the first available formatter
    javascript = { { 'prettierd', 'prettier' } },
    javascriptreact = { { 'prettierd', 'prettier' } },
    typescript = { { 'prettierd', 'prettier' } },
    typescriptreact = { { 'prettierd', 'prettier' } },

    html = { { 'prettierd', 'prettier' } },
    css = { { 'prettierd', 'prettier' } },

    nix = { 'alejandra' },

    markdown = { { 'prettierd', 'prettier' } },

    rust = { 'rustfmt' },

    java = { 'google-java-format' },

    go = { 'gofmt' },

    fish = { 'fish_indent' },

    sh = { 'shfmt' },
    -- zsh = ["shfmt"],

    json = { { 'fixjson', 'deno_fmt' } },
    jsonc = { 'deno_fmt' }, --## fixjson will delete comments

    yaml = { { 'yamlfmt' } },

    --## c/cpp seem to be covered by lsp or something

    -- unsure how to make kdl autoformat (wants cli tools). oh well

    -- Use the "_" filetype to run formatters on filetypes that don't
    -- have other formatters configured.
    ['_'] = { 'trim_whitespace' },
  },
})
