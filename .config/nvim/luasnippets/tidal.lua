local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require("luasnip.extras").lambda
-- local rep = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")

local som = {
    "ul", "can", "gabba", "bass1", "feel", "bottle", "less", "popkick", "moog", "kicklinn", "mt", "808sd", "cr", "bend",
    "numbers", "control", "pad", "made2", "dr2", "dorkbot", "808lt", "birds3", "auto", "msg", "dr_few", "haw", "speedupdown",
    "blue", "jungbass", "fire", "breaks152", "gab", "lt", "wobble", "bassdm", "metal", "hc", "drumtraks", "foo", "led", "808mt",
    "hand", "h", "ht", "tablex", "sine", "808", "e", "wind", "rave2", "latibro", "808lc", "tink", "blip", "crow", "made", "bd",
	"speechless", "yeah", "alphabet", "rs", "baa", "jungle", "house", "glasstap", "perc", "incoming", "808hc", "em2", "jvbass",
	"dork2", "mash2", "coins", "dist", "ab", "peri", "monsterb", "ulgab", "voodoo", "casio", "toys", "bass3", "tok", "subroc3d",
	"electro1", "909", "bev", "sheffield", "808oh", "procshort", "808ht", "sundance", "oc", "off", "sf", "battles", "gabbaloud",
	"fm", "world", "ade", "koy", "ades4", "bass0", "breath", "padlong", "noise", "clak", "sitar", "cb", "arp", "ifdrums",
	"bubble", "insect", "tech", "gabbalouder", "dr55", "gtr", "circus", "linnhats", "mute", "hardcore", "reverbkick", "tabla",
	"sugar", "armora", "hit", "ades3", "sd", "hardkick", "sequential", "rave", "cc", "808bd", "gretsch", "glitch", "alex", "db",
	"dr", "future", "ho", "sax", "proc", "hh27", "techno", "realclaps", "erk", "mash", "click", "lighter", "if", "fest", "rm",
	"ravemono", "808cy", "ades2", "pluck", "808mc", "stab", "stomp", "birds", "glitch2", "tabla2", "notes", "invaders", "baa2",
	"arpy", "sid", "hh", "short", "drum", "print", "d", "bassfoo", "bass2", "chin", "kurt", "jazz", "cp", "co", "psr", "mouth",
	"sn", "trump", "diphone", "speakspell", "v", "mp3", "industrial", "bass", "odx", "flick", "newnotes", "f", "hmm", "bin",
	"speech", "diphone2", "east", "bleep", "breaks157", "noise2", "seawolf", "clubkick", "amencutup", "xmas", "pebbles",
	"tacscan", "breaks165", "hoover", "space", "cosmicg", "juno", "uxay", "breaks125", "outdoor", "feelfx", "miniyeah",
}

local rand = function(indi)
    return (math.random(1, #indi))
end

local myTable = {} -- original table (created somewhere)
-- keep a private access to original table
local _t = myTable
-- create proxy
myTable = {}
-- create metatable
local mt = {
	__index = function(t, k)
		print("*access to element " .. tostring(k))
		return _t[k] -- access the original table
	end,
	__newindex = function(t, k, v)
		print("*update of element " .. tostring(k) .. " to " .. tostring(v))
		_t[k] = v -- update original table
	end,
}
setmetatable(myTable, mt)
--local j = 0
function list_iter(t)
	local i = 0
	local n = table.getn(t)
	return function()
		i = i + 1
		if i <= n then
			return t[i]
		end
	end
end

local choose_sound = function()
	local includeThis = som[rand(som)]
	local contem = false
	for item in list_iter(myTable) do
		if item == includeThis then
			contem = true
		end
	end
	if contem == false then
		table.insert(myTable, includeThis)
		return includeThis
		--  else
		--    table.insert(t, "POW POW POWPOW!!!!")
	end
	contem = false
	--  print( table.concat(t, ", ") )
end

local function random_freq() return tostring( math.floor(20 + (2200 - 20) * math.random() ^ 2) ) end
local function rand_normal() return string.format( "%.2f", math.random() ) end

return {
	s( { trig = "dd1", snippetType = "autosnippet" }, fmta(
		[[
		d1 $ <>"<>"
		    <>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( { trig = "dd2", snippetType = "autosnippet" }, fmta(
		[[
		d2 $ <>"<>"
			<>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( { trig = "dd3", snippetType = "autosnippet" }, fmta(
		[[
		d3 $ <>"<>"
			<>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( { trig = "dd4", snippetType = "autosnippet" }, fmta(
		[[
		d4 $ <>"<>"
			<>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( { trig = "dd5", snippetType = "autosnippet" }, fmta(
		[[
		d5 $ <>"<>"
			<>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( { trig = "dd6", snippetType = "autosnippet" }, fmta(
		[[
		d6 $ <>"<>"
			<>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( { trig = "dd7", snippetType = "autosnippet" }, fmta(
		[[
		d7 $ <>"<>"
			<>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( { trig = "dd8", snippetType = "autosnippet" }, fmta(
		[[
		d8 $ <>"<>"
			<>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( { trig = "dd9", snippetType = "autosnippet" }, fmta(
		[[
		d9 $ <>"<>"
			<>
		]],
		{ i(1), c(2, { f(choose_sound), i(1,"") }), i(3, "# amp 0.1"), }
	) ),
	s( "amp", { t("# amp "), i(1, "0.1") }),
	s( "n", { i(1, "#"), t(" n "), i(2, "0") }),
	s( "chop", { t("chop "), i(1, "8"), t(" $") }),
	s( {trig = "ampp", snippetType = "autosnippet"}, { t("# amp "), i(1, "0.1") }),
	s( {trig = "nn", snippetType = "autosnippet"}, { i(1, "#"), t(" n "), i(2, "0") }),
	s( {trig = "chopp", snippetType = "autosnippet"}, { t("chop "), i(1, "8"), t(" $") }),
}
