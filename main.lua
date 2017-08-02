local menus = require("menus")
local util = require("util")
local game = require("game")

state = "GAME_PAUSE"

local debug = true

local states = {
	"MENU_MAIN",
	"MENU_OPTIONS",
	"GAME_MAIN",
	"GAME_PAUSE",
	"GAME_OPTIONS"
}

local oldMouseDown = false

function love.update()
	game.update_objects()
end

function love.draw()
	menus.draw_menus()
	game.draw_objects()

	if debug then
		love.graphics.print(state,0,0)
	end
end