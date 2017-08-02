local graphics = require("graphics")
local camera = require("camera")

local o = {
	player = {
		x = 300,
		y = 300,
		hp = 100,
		inv = {},
		speed = 2,
		rotation = 0,
		sprite = graphics.sprites.player
	},
	box = {
		x = 200,
		y = 150,
		sprite = graphics.sprites.box
	}
}

function o.player.on_update()
	--rewrite this to accept util's assignable control scheme
	local player = o.player
	if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
		player.y = player.y - player.speed
		camera.move(0,-player.speed)
	elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
		player.y = player.y + player.speed
		camera.move(0,player.speed)
	end
	if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
		player.x = player.x - player.speed
		camera.move(-player.speed,0)
	elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
		player.x = player.x + player.speed
		camera.move(player.speed,0)
	end
	if love.keyboard.isDown("lshift") then
		player.speed = 4
	else
		player.speed = 2
	end
	player.rotation = math.atan2(
		player.y-love.mouse.getY()-camera.y,
		player.x-camera.x-love.mouse.getX()
		)
end

local function update_objects()
	if state == "GAME_MAIN" then
		for k,v in pairs(o) do
			if o[k].on_update ~= nil then
				o[k].on_update()
			end
		end
	end
end

local function draw_objects()
	if state == "GAME_MAIN" then
		for k,v in pairs(o) do
			love.graphics.print(k,v.x-camera.x,v.y-camera.y)
			love.graphics.draw(v.sprite,v.x-camera.x,v.y-camera.y,v.rotation)
		end
		love.graphics.print("camera position: "..camera.x..", "..camera.y,120,0)
	end
end

m = {
	o = o,
	update_objects = update_objects,
	draw_objects = draw_objects
}

return m