-- Importing mpv module
local mpv = require('mp')
local mpv_options = require("mp.options")

--Default states
local enabled = true
local keybind = "i"
local options = { -- setting default options
    op_start = 0, op_end = 0, ed_start = 0, ed_end = 0,
}
mpv_options.read_options(options, "skip") --reading script-opts data

-- Main function to check and skip if within the defined section
local function skip()
    local current_time = mp.get_property_number("time-pos")

    if not enabled then
        return
    end

    if not current_time then
        return
    end

    -- Check for opening sequence
    if current_time >= options.op_start and current_time < options.op_end then
        mp.set_property_number("time-pos", options.op_end)
    end
    
    -- Check for ending sequence
    if current_time >= options.ed_start and current_time < options.ed_end then
        mp.set_property_number("time-pos", options.ed_end)
    end
end

local function enabled_state()
    enabled = not enabled
    mp.osd_message("Ani-Skip is " .. (enabled and "enabled" or "disabled"), 1)
end  

-- Bind the function to be called whenever the time position is changed
mp.observe_property("time-pos", "number", skip)
mp.add_key_binding(keybind, "skip_enable", enabled_state)
