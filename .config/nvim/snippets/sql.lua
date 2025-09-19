---@diagnostic disable: undefined-global

return {

	s(
		{ trig = "ctmp", snippetType = "autosnippet" },
		fmta(
			[[

drop temporary table if exists <>;
create temporary table <>

```


    ]],
			{ i(1), i(1) }
		)
	),
}
