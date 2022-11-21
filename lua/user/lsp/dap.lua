local dap = require('dap')
dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python'
    end;
  },
}

    -- mappings = {
    --   i = {
    --     ["<C-n>"] = actions.cycle_history_next,
    --     ["<C-p>"] = actions.cycle_history_prev,

    --     ["<C-j>"] = actions.move_selection_next,
    --     ["<C-k>"] = actions.move_selection_previous,

    --     ["<C-c>"] = actions.close,

    --     ["<Down>"] = actions.move_selection_next,
    --     ["<Up>"] = actions.move_selection_previous,

    --     ["<CR>"] = actions.select_default,
    --     ["<C-x>"] = actions.select_horizontal,
    --     ["<C-v>"] = actions.select_vertical,
    --     ["<C-t>"] = actions.select_tab,

    --     ["<C-u>"] = actions.preview_scrolling_up,
    --     ["<C-d>"] = actions.preview_scrolling_down,

    --     ["<PageUp>"] = actions.results_scrolling_up,
    --     ["<PageDown>"] = actions.results_scrolling_down,

    --     ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
    --     ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
    --     ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
    --     ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
    --     ["<C-l>"] = actions.complete_tag,
    --     ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
    --   },

-- dap.adapters.python = {
--   type = 'executable';
--   command = '/usr/bin/python';
--   args = { '-m', 'debugpy.adapter' };
-- }
-- dap.setup {}
-- -- local keymap = vim.api.nvim_set_keymap

-- local opts = { noremap = true, silent = true }
-- local widgets = require('dap.ui.widgets')
-- keymap("n", "di", widgets.hover, opts)
-- keymap("n", "<leader>di", ":lua require'dap'.continue()", opts)
-- keymap("n", "<leader>dt", ":lua require'dap'.toggle_breakpoint()", opts)

