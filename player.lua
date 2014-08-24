function positionPlayer()
	for a=1,#Cave.map do
		for b=1,#Cave.map[1] do
			if (Cave.map[a][b].tiletype == 2 or Cave.map[a][b].tiletype == 3 or Cave.map[a][b].tiletype == 4 or Cave.map[a][b].tiletype == 5) and a + 1 <= #Cave.map and Cave.map[a + 1][b].tiletype == 1 then
				Cave.player.x = b
				Cave.player.y = a
				return
			end
		end
	end
end
