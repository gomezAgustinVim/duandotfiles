---@diagnostic disable: undefined-global

return {

	s(
		{ trig = "ctmp", snippetType = "autosnippet" },
		fmta(
			[[

drop temporary table if exists <>;
create temporary table if not exists <>

drop temporary table if exists <>;
    ]],
			{ i(1), rep(1), rep(1) }
		)
	),

	s(
		{ trig = "crpro", snippetType = "autosnippet" },
		fmta(
			[[

DELIMITER $$
DROP PROCEDURE IF EXISTS <> $$
CREATE PROCEDURE <> (<>)
BEGIN

<>

END $$

DELIMITER ;

    ]],
			{ i(1), rep(1), i(2), i(3) }
		)
	),

	s(
		{ trig = "crfun", snippetType = "autosnippet" },
		fmta(
			[[

DELIMITER $$
DROP FUNCTION IF EXISTS <> $$
CREATE FUNCTION <> (<>)
RETURNS
BEGIN

<>

RETURN

END $$

DELIMITER ;

    ]],
			{ i(1), rep(1), i(2), i(3) }
		)
	),
}
