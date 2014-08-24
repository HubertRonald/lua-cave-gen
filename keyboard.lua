function love.keypressed( key )
	if Cave.state == 'game' then
		if key == 'left' and Cave.player.hopping == false and checkLeft() == true and Cave.player.falling == false then
			Cave.player.hopping = true
			Cave.player.direction = 'left'
			if Cave.player.jumping == false then
				Cave.player.image = 3
			end
		elseif key == 'left' and Cave.player.hopping == false and checkUpLeft() == true and Cave.player.falling == false and Cave.player.jumping == true then
			Cave.player.hopping = true
			Cave.player.direction = 'left'
			if Cave.player.jumping == false then
				Cave.player.image = 3
			end
		elseif key == 'right' and Cave.player.hopping == false and checkRight() == true and Cave.player.falling == false then
			Cave.player.hopping = true
			Cave.player.direction = 'right'
			if Cave.player.jumping == false then
				Cave.player.image = 3
			end
		elseif key == 'right' and Cave.player.hopping == false and Cave.player.falling == false and checkUpRight() == true and Cave.player.jumping == true then
			Cave.player.hopping = true
			Cave.player.direction = 'right'
			if Cave.player.jumping == false then
				Cave.player.image = 3
			end
		elseif key == ' ' and Cave.player.jumping == false and checkAbove() == true and Cave.player.falling == false then
			Cave.player.jumping = true
			if Cave.player.hopping == false then
				Cave.player.image = 3
			end
		end
	end
end
function love.keyreleased( key )
	if key == 'left' then
	end
	if key == 'right' then
	end
end
