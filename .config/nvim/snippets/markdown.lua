---@diagnostic disable: undefined-global

return {
	s(
		{ trig = "ln", snippetType = "autosnippet", dscr = "Puts links" },
		fmta(
			[[
         [<>](<>)
         ]],
			{ i(1), i(2) }
		)
	),

	s(
		{ trig = "img", snippetType = "autosnippet", dscr = "Puts images" },
		fmta(
			[[
         ![<>](<>)
         ]],
			{ i(1), i(2) }
		)
	),

	s({ trig = "back", dscr = "Inserts backticks" }, fmta("```", {})),
}
