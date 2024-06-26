require("obsidian").setup({

  workspaces = {
    {
      name = "notes",
      path = "~/Documentos/quartz/content/"
    },
  },

  templates = {
    subdir = "000 Templates",
  },

  attachments = {
    img_folder = "001 Assets/",

    img_text_func = function(client, path)
      local link_path
      local vault_relative_path = client:vault_relative_path(path)
      if vault_relative_path ~= nil then
        -- Use relative path if the image is saved in the vault dir.
        link_path = vault_relative_path
      else
        -- Otherwise use the absolute path.
        link_path = tostring(path)
      end
      local display_name = vim.fs.basename(link_path)
      -- return string.format("![%s](%s)", display_name, link_path)
      return string.format("![[%s]]", display_name)   -- I want just the name since I use shortest path on quartz and obsidian
    end,

  },

  completion = {
    nvim_cmp = true,
    min_chars = 1,
  },

  finder = "telescope.nvim",

  mappings = { -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    -- ["gf"] = {
    --   action = function()
    --     return require("obsidian").util.gf_passthrough()
    --   end,
    --   opts = { noremap = false, expr = true, buffer = true },
    -- },

    -- Toggle check-boxes.
    ["<leader>ch"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },

  -- Optional, boolean or a function that takes a filename and returns a boolean.
  -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
  disable_frontmatter = true,

  -- Use bullet marks for non-checkbox lists.
  bullets = { char = "•", hl_group = "ObsidianBullet" },
  external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },


  note_id_func = function()
    -- Ignore the title and always return the static string "Sin título.md"
    return "Sin título.md"
  end
})

-- gf passthrough
vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })

-- Syntax highlighting
require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline" },
  highlight = {
    enable = true,
  },
})


