return {
    'mrjones2014/smart-splits.nvim',
    opts = {},
    keys = {
        {
            '<A-h>',
            function()
                require('smart-splits').move_cursor_left()
            end,
            desc = 'Move cursor left',
        },
        {
            '<A-j>',
            function()
                require('smart-splits').move_cursor_down()
            end,
            desc = 'Move cursor down',
        },
        {
            '<A-k>',
            function()
                require('smart-splits').move_cursor_up()
            end,
            desc = 'Move cursor up',
        },
        {
            '<A-l>',
            function()
                require('smart-splits').move_cursor_right()
            end,
            desc = 'Move cursor right',
        },
        {
            '<A-C-h>',
            function()
                require('smart-splits').resize_left(5)
            end,
            desc = 'Resize window left',
        },
        {
            '<A-C-j>',
            function()
                require('smart-splits').resize_down(5)
            end,
            desc = 'Resize window down',
        },
        {
            '<A-C-k>',
            function()
                require('smart-splits').resize_up(5)
            end,
            desc = 'Resize window up',
        },
        {
            '<A-C-l>',
            function()
                require('smart-splits').resize_right(5)
            end,
            desc = 'Resize window right',
        },
        {
            '<A-H>',
            function()
                require('smart-splits').swap_buf_left()
            end,
            desc = 'Swap buffer left',
        },
        {
            '<A-J>',
            function()
                require('smart-splits').swap_buf_down()
            end,
            desc = 'Swap buffer down',
        },
        {
            '<A-K>',
            function()
                require('smart-splits').swap_buf_up()
            end,
            desc = 'Swap buffer up',
        },
        {
            '<A-L>',
            function()
                require('smart-splits').swap_buf_right()
            end,
            desc = 'Swap buffer right',
        },
    },
}
