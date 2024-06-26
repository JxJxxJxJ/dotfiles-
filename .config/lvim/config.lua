--[[
=====================================================================
====================            :)               ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||  Jx's config.NVIM  ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
-- ]]

-- [[ Options ]]
require("user.options")

-- [[ Keymaps ]]
require("user.keymaps")

-- [[ Autocommands ]]
require("user.autocommands")

-- [[ Builtin Plugins Config ]]
require("user.plugins.builtin.alpha")
require("user.plugins.builtin.nvimtree")
require("user.plugins.builtin.telescope")
require("user.plugins.builtin.treesitter")

-- [[ User Plugins Config ]]
require("user.plugins.custom.plugins")

-- [[ Theme ]]
require("user.plugins.custom.themes")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
