-- return {
--   s(
--     { -- Params
--       trig = ";preg",
--       dscr = "Inicia el question environment",
--       regTrig = false,
--       priority = 1000,
--       snippetType = "autosnippet",
--     },
--     fmt(-- Format
--     -- String of text
--       [[
-- \qs{<>}{<>}

-- <>
-- ]]     ,
--       { -- Nodes
--         i(1, "Name:"),
--         i(2, "Content"),
--         i(0),
--       },
--       { -- <> as delimiters
--         delimiters = "<>"
--       }
--     ),
--     { -- Callbacks
--       callbacks = {
--         [1] = { -- Name
--           [events.enter] = Want to modify the text on [1] when entering, in this case "Name" to ""

--         },
--         --   {
--         --     [2] = { -- Content
--         --       [events.leave] = myCheck,
--         --     },
--         --   },
--       },

--     }),
-- }