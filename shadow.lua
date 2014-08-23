function setShadows()
	for a=1,Cave.mapheight do
		for b=1,Cave.mapwidth do
			if Cave.map[a][b].tiletype == 2 or Cave.map[a][b].tiletype == 3 or Cave.map[a][b].tiletype == 4 then
				Cave.map[a][b].shadow = true
				Cave.map[a][b].shadowDirections = {}
				if a - 1 > 0 and Cave.map[a-1][b].tiletype == 1 then
					table.insert(Cave.map[a][b].shadowDirections, 'NORTH');
				end
				if b-1 > 0 and Cave.map[a][b-1].tiletype == 1 then
					table.insert(Cave.map[a][b].shadowDirections, 'WEST');
				end
				if b + 1 <= #Cave.map[1] and Cave.map[a][b+1].tiletype == 1 then
					table.insert(Cave.map[a][b].shadowDirections, 'EAST');
				end
				if a + 1 <= #Cave.map and Cave.map[a+1][b].tiletype == 1 then
					local random = math.random(4)
					local string = 'SOUTH' .. random
					table.insert(Cave.map[a][b].shadowDirections, string);
				end
			end
		end
	end
end
