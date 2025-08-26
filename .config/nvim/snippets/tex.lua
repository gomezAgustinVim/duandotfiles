return {
	s(
		{ trig = "fig", snippetType = "autosnippet", dscr = "Puts figures" },
		fmta(
			[[
        \begin{figure}[H]
        \centering
        \includegraphics[width=0.95\linewidth]{<>}
        \caption{
            \textbf{<>}
            <>
        }
        \label{fig:<>}
        \end{figure}
        ]],
			{ i(1, "filename"), i(2, "captionBold"), i(3, "captionText"), i(4, "figureLabel") }
		)
	),

	s(
		{ trig = "beg", snippetType = "autosnippet" },
		fmta(
			[[
        \begin{<>}
            <>
        \end{<>}
        ]],
			{ i(1, "document"), i(2), rep(1) }
		)
	),
	s(
		{ trig = "item", snippetType = "autosnippet" },
		fmta(
			[[
        \begin{<>}
            \item <>
        \end{<>}
        ]],
			{ i(1, "itemize"), i(2), rep(1) }
		)
	),
}
