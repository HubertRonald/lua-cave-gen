function setTorches()
  for a=1,Cave.mapheight do
    for b=1,Cave.mapwidth do
      if Cave.map[a][b].tiletype == 2 or Cave.map[a][b].tiletype == 3 or Cave.map[a][b].tiletype == 4 then
				if math.random(100) < 3 then
					Cave.map[a][b].tiletype = 5
					Cave.map[a][b].torchimage = math.random(4)
					Cave.map[a][b].torchwait = math.random(2)
					table.insert(Cave.torches,{b,a})
				end
      end
    end
  end

end
