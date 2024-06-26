-- [[ Helper Functions ]]
function ToggleLineNumber()
  if vim.wo.number then
    vim.wo.number = false
  else
    vim.wo.number = true
    vim.wo.relativenumber = false
  end
end

function ToggleRelativeLineNumber()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
    vim.wo.number = false
  end
end

function ToggleWrap()
  if vim.wo.wrap then
    vim.wo.wrap = false
  else
    vim.wo.wrap = true
    vim.wo.number = false
  end
end

function ToggleConceal()
  if vim.wo.conceallevel == 1 then
    vim.wo.conceallevel = 0
  else
    vim.wo.conceallevel = 1
  end
end

vim.keymap.set('n', '<leader>uw', ToggleWrap, { silent = true, desc = 'Toggle wrap' })
vim.keymap.set('n', '<leader>uL', ToggleRelativeLineNumber, { silent = true, desc = 'Toggle relative line numbers' })
vim.keymap.set('n', '<leader>ul', ToggleLineNumber, { silent = true, desc = 'Toggle line numbers' })
vim.keymap.set('n', '<leader>uc', ToggleConceal, { silent = true, desc = 'Toggle conceal' })

-- if vim.lsp.inlay_hint then
--   vim.keymap.set('n', '<leader>uh', function()
--     vim.lsp.inlay_hint(0, nil)
--   end, { desc = 'Toggle Inlay Hints' })
-- end
