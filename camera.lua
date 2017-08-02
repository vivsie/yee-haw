local camera = {
	width = love.graphics.getWidth(),
	height = love.graphics.getHeight(),
	x = 0,
	y = 0
}

function camera.get_position()
	return {
		x = camera.x,
		y = camera.y
	}
end

function camera.set_position(x, y)
	camera.x = x
	camera.y = y
end

function camera.move(x, y)
	camera.x = camera.x + x
	camera.y = camera.y +y
end

return camera