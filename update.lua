function love.update()
	if Cave.state == 'title' then
		if love.keyboard.isDown( "return" ) then
			Cave.state = 'game'
		end
	elseif Cave.state == 'game' then

		if Cave.player.jumping == true then
			if Cave.player.hopping == false then
				if Cave.player.image == 3 then
					Cave.player.y = Cave.player.y - (1/9)
				elseif Cave.player.image == 11 then
					Cave.player.y = Cave.player.y - (1/9)
					Cave.player.jumping = false
					Cave.player.x = round(Cave.player.x)
					Cave.player.y = round(Cave.player.y)
					Cave.player.image = 1
				else
					if Cave.player.image < 7 then 
						Cave.player.y = Cave.player.y - 0.07
						Cave.player.y = Cave.player.y - (1/9)
					elseif Cave.player.image == 7 then
						Cave.player.y = Cave.player.y - (1/9)
						--do nothing
					else
						Cave.player.y = Cave.player.y - (1/9)
						Cave.player.y = Cave.player.y + 0.07
					end
				end
				Cave.player.image = Cave.player.image + 1
			else
				if Cave.player.image == 3 then
					if Cave.player.direction == 'left' then
						Cave.player.x = Cave.player.x - (1/9)
					else
						Cave.player.x = Cave.player.x + (1/9)
					end
					Cave.player.y = Cave.player.y - (1/9)
				elseif Cave.player.image == 11 then
					if Cave.player.direction == 'left' then
						Cave.player.x = Cave.player.x - (1/9)
					else
						Cave.player.x = Cave.player.x + (1/9)
					end
					Cave.player.y = Cave.player.y - (1/9)
					Cave.player.hopping = false
					Cave.player.jumping = false
					Cave.player.x = round(Cave.player.x)
					Cave.player.y = round(Cave.player.y)
					Cave.player.image = 1
				else
					if Cave.player.image < 7 then 
						Cave.player.y = Cave.player.y - (1/9)
						Cave.player.y = Cave.player.y - 0.07
					elseif Cave.player.image == 7 then
						Cave.player.y = Cave.player.y - (1/9)
						--do nothing
					else
						Cave.player.y = Cave.player.y - (1/9)
						Cave.player.y = Cave.player.y + 0.07
					end
					if Cave.player.direction == 'left' then
						Cave.player.x = Cave.player.x - (1/9)
					else
						Cave.player.x = Cave.player.x + (1/9)
					end
				end
				Cave.player.image = Cave.player.image + 1
			end
		elseif Cave.player.hopping == true then
			if Cave.player.image == 3 then
				if Cave.player.direction == 'left' then
					Cave.player.x = Cave.player.x - (1/9)
				else
					Cave.player.x = Cave.player.x + (1/9)
				end
			elseif Cave.player.image == 11 then
				if Cave.player.direction == 'left' then
					Cave.player.x = Cave.player.x - (1/9)
				else
					Cave.player.x = Cave.player.x + (1/9)
				end
				Cave.player.hopping = false
				Cave.player.image = 1
				Cave.player.x = round(Cave.player.x)
				Cave.player.y = round(Cave.player.y)
			else
				if Cave.player.image < 7 then 
					Cave.player.y = Cave.player.y - 0.07
				elseif Cave.player.image == 7 then
					--do nothing
				else
					Cave.player.y = Cave.player.y + 0.07
				end
				if Cave.player.direction == 'left' then
					Cave.player.x = Cave.player.x - (1/9)
				else
					Cave.player.x = Cave.player.x + (1/9)
				end
			end
			Cave.player.image = Cave.player.image + 1
		elseif Cave.player.falling == false and checkBelow() == true then
			Cave.player.falling = true
			Cave.player.image = 12
			Cave.player.velocity = 3
			Cave.player.fallcount = 3
		elseif Cave.player.falling == true then
			if Cave.player.fallcount == 0 then
				if checkBelow() == true then
					Cave.player.fallcount = 3
				else
					Cave.player.falling = false
					Cave.player.x = round(Cave.player.x)
					Cave.player.image = 1
					Cave.player.velocity = 3
					Cave.player.fallcount = 3
				end
			else
				Cave.player.x = Cave.player.x + Cave.player.shudder
				Cave.player.shudder = Cave.player.shudder * -1
				Cave.player.fallcount = Cave.player.fallcount - 1
				Cave.player.y = Cave.player.y + (1/Cave.player.velocity)
			end
		else 
			if Cave.player.wait == 4 then
				Cave.player.wait = 0
				Cave.player.image = Cave.player.image + 1
				if Cave.player.image > 2 then
					Cave.player.image = 1
				end
			end
			Cave.player.wait = Cave.player.wait + 1
		end

	Cave.camera.x = (Cave.player.x*Cave.tilewidth) - (5*Cave.tilewidth)
	Cave.camera.y = (Cave.player.y*Cave.tileheight) - (4*Cave.tileheight)
		if Cave.camera.x < 0 then 
			Cave.camera.x = 0
		end
		if Cave.camera.y < 0 then 
			Cave.camera.y = 0
		end
		if Cave.camera.x > (Cave.tilewidth * Cave.mapwidth) - Cave.windowwidth then
			Cave.camera.x = (Cave.tilewidth * Cave.mapwidth) - Cave.windowwidth
		end
		if Cave.camera.y > (Cave.tileheight * Cave.mapheight) - Cave.windowheight then
			Cave.camera.y = (Cave.tileheight * Cave.mapheight) - Cave.windowheight
		end
		--update torches
		for i=1,#Cave.torches do
			if Cave.map[Cave.torches[i][2]][Cave.torches[i][1]].torchwait == 2 then
				Cave.map[Cave.torches[i][2]][Cave.torches[i][1]].torchimage = Cave.map[Cave.torches[i][2]][Cave.torches[i][1]].torchimage + 1
				Cave.map[Cave.torches[i][2]][Cave.torches[i][1]].torchwait = 0
				if Cave.map[Cave.torches[i][2]][Cave.torches[i][1]].torchimage > 4 then
					Cave.map[Cave.torches[i][2]][Cave.torches[i][1]].torchimage = 1
				end
			end
			Cave.map[Cave.torches[i][2]][Cave.torches[i][1]].torchwait = Cave.map[Cave.torches[i][2]][Cave.torches[i][1]].torchwait + 1
			--update player
		end
	end
end
