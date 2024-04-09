local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

function setup_colours()
    return {
        bright_bg = utils.get_highlight("Folded").bg,
        bright_fg = utils.get_highlight("Folded").fg,
        red = utils.get_highlight("DiagnosticError").fg,
        dark_red = utils.get_highlight("DiffDelete").bg,
        green = utils.get_highlight("DiagnosticOk").fg,
        blue = utils.get_highlight("Function").fg,
        gray = utils.get_highlight("NonText").fg,
        orange = utils.get_highlight("Constant").fg,
        purple = utils.get_highlight("Statement").fg,
        cyan = utils.get_highlight("Special").fg,
        diag_warn = utils.get_highlight("DiagnosticWarn").fg,
        diag_error = utils.get_highlight("DiagnosticError").fg,
        diag_hint = utils.get_highlight("DiagnosticHint").fg,
        diag_info = utils.get_highlight("DiagnosticInfo").fg,
        git_del = utils.get_highlight("diffDeleted").fg,
        git_add = utils.get_highlight("diffAdded").fg,
        git_change = utils.get_highlight("diffChanged").fg,
    }
end

vim.api.nvim_create_augroup("Heirline", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        utils.on_colorscheme(setup_colours)
    end,
    group = "Heirline",
})

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,

    static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
            n = "NORMAL",
            no = "NORMAL",
            nov = "NORMAL",
            noV = "NORMAL",
            ["no\22"] = "NORMAL",
            niI = "INSERT",
            niR = "REPLACE",
            niV = "VISUAL",
            nt = "TERMINAL",
            v = "VISUAL",
            vs = "VISUAL",
            V = "V-LINE",
            Vs = "V-BLOCK",
            ["\22"] = "V-BLOCK",
            ["\22s"] = "V-BLOCK",
            s = "SELECT",
            S = "SELECT LINE",
            ["\19"] = "SELECT",
            i = "INSERT",
            ic = "INSERT",
            ix = "INSERT",
            R = "REPLACE",
            Rc = "REPLACE",
            Rx = "REPLACE",
            Rv = "V-REPLACE",
            Rvc = "V-REPLACE",
            Rvx = "V-REPLACE",
            c = "COMMAND",
            cv = "COMMAND",
            r = "...",
            rm = "MORE",
            ["r?"] = "CONFIRM",
            ["!"] = "SHELL",
            t = "TERMINAL",
        },
        mode_colours = {
            n = "blue",
            i = "green",
            v = "purple",
            V = "purple",
            ["\22"] = "purple",
            c = "orange",
            s = "cyan",
            S = "cyan",
            ["\19"] = "cyan",
            R = "orange",
            r = "orange",
            ["!"] = "red",
            t = "red",
        },
    },
    provider = function(self)
        return "▎ %2("..self.mode_names[self.mode].."%)"
    end,
    hl = function(self)
        local mode = self.mode:sub(1, 1)
        return { fg = self.mode_colours[mode], bold = true, }
    end,
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd("redrawstatus")
        end),
    },
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = "white" },

    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
}

local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%7(%l/%3L%):%2c %P",
    hl = { bg = "bright_bg" },
}

local ScrollBar ={
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
        -- Another variant, because the more choice the better.
        -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = { fg = "blue", bg = "bright_bg" },
}

local LSPActive = {
    condition = conditions.lsp_attached,
    update = {'LspAttach', 'LspDetach'},

    -- You can keep it simple,
    -- provider = " [LSP]",

    -- Or complicate things a bit and get the servers names
    provider  = function()
        local names = {}
        for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
            table.insert(names, server.name)
        end
        return table.concat(names, " ")
    end,
    hl = { fg = "green", bold = true },
}

local FileNameBlock = {
    -- let's first set up some attributes needed by this component and it's children
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}

local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = "[+]",
        hl = { fg = "green" },
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = "",
        hl = { fg = "orange" },
    },
}

local FileType = {
    provide = function()
        return string.upper(vim.bo.filetype)
    end,
    hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

local FileName = {
    init = function(self)
        self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
        if self.lfilename == "" then self.lfilename = "[No Name]" end
    end,
    hl = { fg = utils.get_highlight("Directory").fg },

    flexible = 2,

    {
        provider = function(self)
            return self.lfilename
        end,
    },
    {
        provider = function(self)
            return vim.fn.pathshorten(self.lfilename)
        end,
    },
}

local FileNameModifer = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return { fg = "cyan", bold = true, force=true }
        end
    end,
}

FileNameBlock = utils.insert(
    FileNameBlock,
    utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
    FileFlags,
    { provider = '%<'}
)

local Align = { provider = "%=", hl = { bg = "bright_bg" } }
local Space = { provider = " ", hl = {bg = "bright_bg"} }

local StatusLine = { ViMode, Space, Git, Space, FileNameBlock,
                     Align, LSPActive, Space, FileType, Space, Ruler, Space, ScrollBar }

require("heirline").setup {
    statusline = StatusLine,
    opts = {
        colors = setup_colours,
    },
}
