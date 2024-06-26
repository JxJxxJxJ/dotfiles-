-- Enable terminal
lvim.builtin.terminal.active = true

local M = {}

M.banner = {
  [[     \\XXXXXX//]],
  [[      XXXXXXXX]],
  [[     //XXXXXX\\                      OOOOOOOOOOOOOOOOOOOO]],
  [[    ////XXXX\\\\                     OOOOOOOOOOOOOOOOOOOO]],
  [[   //////XX\\\\\\     |||||||||||||||OOOOOOOOOOOOOOOVVVVVVVVVVVVV]],
  [[  ////////\\\\\\\\    |!!!|||||||||||OOOOOOOOOOOOOOOOVVVVVVVVVVV']],
  [[ ////////  \\\\\\\\ .d88888b|||||||||OOOOOOOOOOOOOOOOOVVVVVVVVV']],
  [[////////    \\\\\\\d888888888b||||||||||||            'VVVVVVV']],
  [[///////      \\\\\\88888888888||||||||||||             'VVVVV']],
  [[//////        \\\\\Y888888888Y||||||||||||              'VVV']],
  [[/////          \\\\\\Y88888Y|||||||||||||| .             'V']],
  [[////            \\\\\\|iii|||||||||||||||!:::.            ']],
  [[///              \\\\\\||||||||||||||||!:::::::.]],
  [[//                \\\\\\\\           .:::::::::::.]],
  [[/                  \\\\\\\\        .:::::::::::::::.]],
  [[                    \\\\\\\\     .:::::::::::::::::::.]],
  [[                     \\\\\\\\]],
}

M.banner_small = {
  [[|     .-.]],
  [[|    /   \         .-.]],
  [[|   /     \       /   \       .-.     .-.     _   _]],
  [[+--/-------\-----/-----\-----/---\---/---\---/-\-/-\/\/---]],
  [[| /         \   /       \   /     '-'     '-']],
  [[|/           '-'         '-']],
}

function M.get_sections()
  local header = {
    type = "text",
    val = function()
      local alpha_wins = vim.tbl_filter(function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        return vim.api.nvim_get_option_value("filetype", { buf = buf }) == "alpha"
      end, vim.api.nvim_list_wins())

      if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) < 36 then
        return M.banner_small
      end

      return M.banner
    end,
    opts = {
      position = "center",
      hl = "Label",
    },
  }

  local buttons = {
    opts = {
      hl_shortcut = "Include",
      spacing = 1,
    },
    entries = {
      { "f", lvim.icons.ui.FindFile .. "  Find File",   "<CMD>Telescope find_files<CR>" },
      { "n", lvim.icons.ui.NewFile .. "  New File",     "<CMD>ene!<CR>" },
      { "p", lvim.icons.ui.Project .. "  Projects ",    "<CMD>Telescope projects<CR>" },
      { "r", lvim.icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>" },
      { "t", lvim.icons.ui.FindText .. "  Find Text",   "<CMD>Telescope live_grep<CR>" },
      {
        "c",
        lvim.icons.ui.Gear .. "  Configuration",
        "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
      },
      { "q", lvim.icons.ui.Close .. "  Quit", "<CMD>quit<CR>" },
    },
  }

  local text = require "lvim.interface.text"
  local lvim_version = require("lvim.utils.git").get_lvim_version()

  local footer = {
    type = "text",
    val = text.align_center({ width = 0 }, {
      "",
      "Jx",
      lvim_version,
    }, 0.5),
    opts = {
      position = "center",
      hl = "Number",
    },
  }

  return {
    header = header,
    buttons = buttons,
    footer = footer,
  }
end

lvim.builtin.alpha.dashboard.section = M.get_sections()
