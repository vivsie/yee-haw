local o = {
	player = {
		x = 300,
		y = 300,
		hp = 100,
		inv = {},
		speed = 4,
	}
}

function o.player.on_update()
	--rewrite this to accept util's assignable control scheme
	local player = o.player
	if love.keyboard.isDown("w") or love.keyboard.isDown("up") then
		player.y = player.y - player.speed
	elseif love.keyboard.isDown("s") or love.keyboard.isDown("down") then
		player.y = player.y + player.speed
	end
	if love.keyboard.isDown("a") or love.keyboard.isDown("left") then
		player.x = player.x - player.speed
	elseif love.keyboard.isDown("d") or love.keyboard.isDown("right") then
		player.x = player.x + player.speed
	end
end

local function update_objects()
	if state == "GAME_MAIN" then
		for k,v in pairs(o) do
			o[k].on_update()
		end
	end
end

local function draw_objects()
	if state == "GAME_MAIN" then
		for k,v in pairs(o) do
			love.graphics.print(k,v.x,v.y)
		end
	end
end

m = {
	o = o,
	update_objects = update_objects,
	draw_objects = draw_objects
}

return m