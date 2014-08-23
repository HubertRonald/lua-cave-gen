function love.update()
	if love.keyboard.isDown( "left" ) then
		Cave.camera.x = Cave.camera.x - 20
	end
	if love.keyboard.isDown( "right" ) then
		Cave.camera.x = Cave.camera.x + 20
	end
	if love.keyboard.isDown( "up" ) then
		Cave.camera.y = Cave.camera.y - 20
	end
	if love.keyboard.isDown( "down" ) then
		Cave.camera.y = Cave.camera.y + 20
	end
end
