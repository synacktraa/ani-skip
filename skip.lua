-- Importing mpv module
local mpv = require('mp')
local opts = require("mp.options")

local options = { -- setting default options
	start_time = 0,
	end_time = 0,
}
opts.read_options(options, "skip") --reading script-opts data

function skip() -- function to skip from a specified start_time
				-- to specified end_time

	-- get current time of the video
	time_pos = mpv.get_property_number("time-pos") 
	repeat 
		-- repeat until time-pos is greater than specified start_time
		time_pos = mpv.get_property_number("time-pos")
	until( options.start_time < time_pos )

	--set player time to specified end_time when time-pos == start_time 
	mpv.set_property_number("time-pos", options.end_time-1)
		
end

-- run skip() function when this script is loaded with mpv
mpv.register_event("file-loaded", skip)