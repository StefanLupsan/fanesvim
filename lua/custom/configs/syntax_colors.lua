local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("User", {
    pattern = "TSBufEnable highlight",  -- fires after ts highlight attaches
    callback = function(args)
      local ft = vim.bo[args.buf].filetype
      if vim.tbl_contains({ "typescript", "typescriptreact", "tsx",
                            "javascript", "javascriptreact", "jsx" }, ft) then
        -- apply immediately
        local hl = vim.api.nvim_set_hl
        hl(0, "@keyword",   { fg = "#c792ea", italic = true })
        hl(0, "@type",      { fg = "#82aaff"       })
        hl(0, "@function",  { fg = "#c3e88d"       })
        hl(0, "@variable",  { fg = "#ffffff"       })
        hl(0, "@string",    { fg = "#ecc48d"       })
        hl(0, "@number",    { fg = "#f78c6c"       })
        hl(0, "@comment",   { fg = "#697098", italic = true })
        hl(0, "@namespace", { fg = "#c792ea"       })
        hl(0, "@interface",{ fg = "#82aaff", italic = true })
        hl(0, "@include",   { fg = "#c792ea"       })
      end
    end,
  })
end

return M
