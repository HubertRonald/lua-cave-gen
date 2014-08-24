function love.update()
	if Cave.state == 'title' then
		if love.keyboard.isDown( "return" ) then
			Cave.state = 'game'
		end
	elseif Cave.state == 'game' then
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
		if Cave.player.wait == 4 then
			Cave.player.wait = 0
			Cave.player.image = Cave.player.image + 1
			if Cave.player.image > 2 then
				Cave.player.image = 1
			end
		end
		Cave.player.wait = Cave.player.wait + 1
		io.write(Cave.player.x)
		io.write(" ")
		io.write(Cave.player.y)
		print()
	end
end
