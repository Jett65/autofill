-- TODO: Only run if the file is empty
-- TODO: Make it only work certen file types
-- TODO: Make AutoFillReact input the name of the file as the function name and export it
local popup = require("plenary.popup")

local Win_id

function autohtml()
    local bufnr = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_set_lines(bufnr, 0, 12, false, {
        '<!DOCTYPE html>',
        '<html lang="en">',
        '<head>',
        '    <meta charset="UTF-8">',
        '    <meta http-equiv="X-UA-Compatible" content="IE=edge">',
        '    <meta name="viewport" content="width=device-width, initial-scale=1.0">',
        '    <title>Document</title>',
        '</head>',
        '<body>',
        '',
        '</body>',
        '</html>',
    })
end

function autoReact()
    local bufnr = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_set_lines(bufnr, 0, 12, false, {
        "import React from 'react'",
        " ",
        "function () {",
        "  return (",
        "    <>",
        " ",
        "    </>",
        "  )",
        "}",
        " ",
        "export default "
    })
end

vim.api.nvim_create_user_command("AutoFillhtml", autohtml, {})

vim.api.nvim_create_user_command("AutoFillReact", autoReact, {})


-- Pop up menu
function ShowMenu(opts, cb)
    local height = 10
    local width = 30
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    Win_id = popup.create(opts, {
        title = "AutoFill",
        highlight = "AutoFillWIndow",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        padding = { 0, 3, 0, 3 },
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
        callback = cb,
    })
    local bufnr = vim.api.nvim_win_get_buf(Win_id)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent = false })
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", "<cmd>lua CloseMenu()<CR>", { silent = false })
end

function CloseMenu()
    vim.api.nvim_win_close(Win_id, true)
end

function MyMenu()
    local run_fill
    local opts = {
        "HTML",
        "React",
    }
    local cb = function(_, sel)

    end
    ShowMenu(opts, cb)
end
