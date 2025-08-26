---@diagnostic disable: undefined-global

-- function in_math_mode()
-- 	local tree = vim.treesitter.get_parser():parse()[1]
-- 	local query = vim.treesitter.query.parse("lua", [[(math)]])
-- 	local cursor = vim.treesitter.get_node()
-- 	for id, node, meta in query:iter_captures(tree:root(), 0) do
-- 		if node == cursor then
-- 			print("yes")
-- 		end
-- 	end
-- 	if node then
-- 		print(node:parent():type())
-- 	end
-- end

-- setting the initial snippets for typst.
-- this is just because i want to have something going for typst so that i can avoid using friendly snippets
-- copied this from sylvan franklin

return {
	-- math modes
	s({ trig = "mt", snippetType = "autosnippet" }, fmta("$<>$ ", { i(1) })),
	s(
		{ trig = "(%d+)", regTrig = true },
		fmta(
			[[
#for i in range(<>) {
	<>
}]],
			{
				f(function(_, s)
					return s.captures[1]
				end),
				i(1),
			}
		)
	),
	s(
		{ trig = "([^%s]+)t", regTrig = true }, -- capture any text and make a superscript when expanded with ctrl e
		fmta("(<>)^(<>) ", {
			f(function(_, s)
				return s.captures[1]
			end),
			i(1),
		})
	),
	s({ trig = "mmt", snippetType = "autosnippet" }, fmta("$ <> $ ", { i(1) })),
}
