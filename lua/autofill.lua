local bufnr = vim.api.nvim_get_current_buf() 

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("CoolStuff", { clear = true }),
    pattern = "html",
    callback = function()
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
    end,
})
