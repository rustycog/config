local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    return
end

comment.setup {
    mappings ={
        --
        -- gcc line mode comment
        -- gbc block mode comment
        basic = true,
        -- gco Insert comment on next line and enter INSERT mode
        -- gcO Insert comment on previous line and enter INSERT mode
        -- gcA insert comment to end of current line and enters INSERT mode
        extra = true,
        -- g>c line mode comment current line
        -- g>b block mode comment current line
        -- g<c uncomment current line using line mode
        -- g<b uncomment current line using block mode 
        -- g> comment region using line mode
        -- g< uncomment region using line mode
        extended = true,
    },
    pre_hook = function(ctx)
        local U = require "Comment.utils"

        local location = nil
        if ctx.ctype == U.ctype.block then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        return require("ts_context_commentstring.internal").calculate_commentstring {
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
        }
    end,
}
