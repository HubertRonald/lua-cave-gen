function love.draw()
	--TODO: just draw tiles around player
	if Cave.state == 'title' then
		love.graphics.draw(Cave.titlescreen,0,0)
	elseif Cave.state == 'game' then
		love.graphics.push()
		love.graphics.translate(-Cave.camera.x,-Cave.camera.y)
		for a=1,Cave.mapheight do
			for b=1,Cave.mapwidth do
				if Cave.map[a][b].image ~= '' then
					love.graphics.draw(Cave.map[a][b].image, (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
				end
				if Cave.map[a][b].shadow then
					for i = 1,#Cave.map[a][b].shadowDirections do
						if Cave.map[a][b].shadowDirections[i] == 'NORTH' then
							love.graphics.draw(Cave.northShadow, (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
						elseif Cave.map[a][b].shadowDirections[i] == 'SOUTH1' then
							love.graphics.draw(Cave.floor[1], (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
						elseif Cave.map[a][b].shadowDirections[i] == 'SOUTH2' then
							love.graphics.draw(Cave.floor[2], (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
						elseif Cave.map[a][b].shadowDirections[i] == 'SOUTH3' then
							love.graphics.draw(Cave.floor[3], (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
						elseif Cave.map[a][b].shadowDirections[i] == 'SOUTH4' then
							love.graphics.draw(Cave.floor[4], (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
						elseif Cave.map[a][b].shadowDirections[i] == 'EAST' then
							love.graphics.draw(Cave.eastShadow, (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
						elseif Cave.map[a][b].shadowDirections[i] == 'WEST' then
							love.graphics.draw(Cave.westShadow, (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
						end
					end
				end
				if Cave.map[a][b].tiletype == 5 then
					if Cave.map[a][b].torchimage == 1 then
						love.graphics.draw(Cave.torch1, (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)

					elseif Cave.map[a][b].torchimage == 2 then
						love.graphics.draw(Cave.torch2, (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
					elseif Cave.map[a][b].torchimage == 3 then
						love.graphics.draw(Cave.torch3, (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
					else 
						love.graphics.draw(Cave.torch4, (b-1) * Cave.tilewidth, (a-1) * Cave.tileheight)
					end
				end
			end
		end
		love.graphics.draw(Cave.player.images[Cave.player.image],(Cave.player.x-1) * Cave.tilewidth,(Cave.player.y-1) * Cave.tileheight)
		love.graphics.pop()
	end
end
