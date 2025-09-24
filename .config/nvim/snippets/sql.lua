---@diagnostic disable: undefined-global

return {

	s(
		{ trig = "ctmp", snippetType = "autosnippet" },
		fmta(
			[[

drop temporary table if exists <>;
create temporary table if not exists <>

```


    ]],
			{ i(1), i(1) }
		)
	),
}
