require("util")

local offset = {
	x = 100,
	y = 128
}

local buttons = {
	MENU_MAIN = {
		{
			label = "NEW GAME",
			size = {x = 80,y = 12},
			click = function()
				state = "GAME_MAIN"
			end
		},
		{
			label = "OPTIONS",
			size = {x = 70,y = 12},
			click = function()
				state = "MENU_OPTIONS"
			end
		},
		{
			label = "QUIT",
			size = {x = 40, y = 12},
			click = function()
				love.window.close()
			end
		}
	},
	GAME_MAIN = {},
	MENU_OPTIONS = {
		{
			label = "BACK",
			size = {x = 40,y = 12},
			click = function()
				state = "MENU_MAIN"
			end
		}
	},
	GAME_PAUSE = {
		{	label = "BACK",
			size = {x = 40, y = 12},
			click = function()
				state = "GAME_MAIN"
			end
		},
		{
			label = "OPTIONS",
			size = {x = 70,y = 12},
			click = function()
				state = "GAME_OPTIONS"
			end
		},
		{
			label = "MAIN MENU",
			size = {x = 90,y = 12},
			click = function()
				state = "MENU_MAIN"
			end
		}
	},
	GAME_OPTIONS = {
		{
			label = "BACK",
			size = {x = 40,y = 12},
			click = function() 
				state = "GAME_PAUSE"
			end 
		}
	}
}

local current_button = 1

function love.keypressed(key, sc)
	local button = buttons[state][current_button]
	if state == "MENU_MAIN" or "MENU_OPTIONS" or "GAME_PAUSE" or "GAME_OPTIONS" then
		if sc == "up" or sc == "w" then
			if current_button > 1 then
				--util.decr(current_button)
				current_button = current_button - 1
			else
				current_button = #buttons[state]
			end
		elseif sc== "down" or sc == "s" then
			if current_button < #buttons[state] then
				--util.incr(current_button)
				current_button = current_button + 1
			else
				current_button = 1
			end
		elseif sc == "return" then
			button.click()
			current_button = 1
		end
	end
	if state == "GAME_MAIN" and sc == "escape" then
		state = "GAME_PAUSE"
	end
end

local function draw_menus()
	if state == "MENU_MAIN" or "MENU_OPTIONS" or "GAME_PAUSE" or "GAME_OPTIONS" then
		for k,v in pairs(buttons[state]) do
			local button = buttons[state][k]
			local button_y = k*24

			if current_button == k then
				love.graphics.rectangle("line",offset.x,offset.y+button_y,button.size.x,button.size.y+4)
			end

			love.graphics.print(button.label,offset.x,offset.y+button_y)

		end
	end
end

local m = {
	draw_menus = draw_menus,
	buttons = buttons,
	update_menus = update_menus
}

return m