local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

return {
s( { trig = "sstyle", snippetType = "autosnippet" }, fmta(
		[[
		<<style>>
		    <>
		<</style>>
		]],
		{ i(0) }
	) ),
s( { trig = "sscript", snippetType = "autosnippet" }, fmta(
		[[
		<<script>>
		    <>
		<</script>>
		]],
		{ i(0) }
	) ),
s( { trig = "ttemplate", snippetType = "autosnippet" }, fmta(
		[[
		<<template>>
		    <>
		<</template>>
		]],
		{ i(0) }
	) ),
}
