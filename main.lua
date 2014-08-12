function love.load()
  --allows you to change size of map
  mapheight=45
  mapwidth=100
  floodfill()

  --creates global "map" (eventually will be the equivalent of 2D array)
  map = {}
  --runs function to populate map so it is your desired size and sets up alive/dead cells
  initialise(mapwidth,mapheight)

  --repeats the simulation step 4 times (what I find optimal, can be changed to more or less)
  for s=1,4 do
    simstep()
  end

  --make the left most and right most columns into walls (so player can't leave map, could make bottom and top walls too if wanted)
  for t=1,#map do
    map[t][1] = 1
    map[t][#map[1]] = 1
  end

  --just prints an ascii representation of finished map to terminal
  for a=1,mapheight do
    for b=1,mapwidth do
      if map[a][b]==1 then
        io.write("X")
      else
        io.write(" ")
      end
    end
    print()
  end
end


