return {
  -- LaTeX: Matrices
  s({ trig = "([pbv])mat_(%d)(%d)", regTrig = true }, {
    d(1, function(_, snip)
      local type = snip.captures[1] .. "matrix"
      local rows, cols = snip.captures[2], snip.captures[3]
      local nodes = {}
      local ts = 1
      table.insert(nodes, t("\\begin{" .. type .. "}[rrrrrrrrrr]"))
      for _ = 1, rows, 1 do
        table.insert(nodes, t({ "", "\t" }))
        for _ = 1, cols, 1 do
          table.insert(nodes, i(ts))
          table.insert(nodes, t(" & "))
          ts = ts + 1
        end
        table.remove(nodes, #nodes)
        table.insert(nodes, t(" \\\\"))
      end
      table.remove(nodes, #nodes)
      table.insert(nodes, t({ "", "\\end{" .. type .. "}" }))
      return sn(1, nodes)
    end),
  }, { condition = in_mathzone }),
}
