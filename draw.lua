function love.draw()
	--TODO: just draw tiles around player
  for a=1,Cave.mapheight do
    for b=1,Cave.mapwidth do
      if Cave.map[a][b].tiletype == 1 then
				love.graphics.draw(Cave.map[a][b].image, b * Cave.tilewidth, a * Cave.tileheight)
      elseif Cave.map[a][b]==2 then
      elseif Cave.map[a][b]==3 then
      elseif Cave.map[a][b]==4 then
      else
      end
    end
  end
end
