vim.api.nvim_create_user_command("AutoFillhtml", function()
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
end, {})

vim.api.nvim_create_user_command("AutoFillReact", function()
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
end, {})

-- TODO: Only run if the file is empty
-- TODO: Make it only work certen file types
-- TODO: Make AutoFillReact input the name of the file as the function name and expor
