-- Importing mpv module
local mpv = require('mp')
local mpv_options = require("mp.options")

local options = { -- setting default options
	start_time = 0,
	end_time = 0,
}
mpv_options.read_options(options, "skip") --reading script-opts data

-- Main function to check and skip if within the defined section
local function skip()
    local current_time = mp.get_property_number("time-pos")
    
    if not current_time then
		    return
    end

    if current_time >= options.start_time and current_time < options.end_time then
        mp.set_property_number("time-pos", options.end_time)
    end
end

-- Bind the function to be called whenever the time position is changed
mp.observe_property("time-pos", "number", skip)
