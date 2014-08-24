function love.load()
	--set window
	love.window.setMode(Cave.windowwidth,Cave.windowheight)
	--load in title screen
	Cave.titlescreen = love.graphics.newImage('assets/titlescreen.png')
	love.graphics.draw(Cave.titlescreen,0,0)
  --creates global "map" (eventually will be the equivalent of 2D array)
  Cave.map = {}
	Cave.camera = {}
	Cave.camera.x = 0
	Cave.camera.y = 0

	Cave.player = {}
	Cave.player.x = 1
	Cave.player.y = 1
	Cave.player.wait = 1
	Cave.player.images = {}
	Cave.player.images[1] = love.graphics.newImage('assets/bunny-still1.png')
	Cave.player.images[2] = love.graphics.newImage('assets/bunny-still2.png')
	Cave.player.image = 1

	--list of torches for quick access
	Cave.torches = {}

	--set the state to the title screen
	Cave.state = 'title'
  --runs function to populate map so it is your desired size and sets up alive/dead cells
  initialise(Cave.mapwidth,Cave.mapheight)

  --repeats the simulation step 4 times (what I find optimal, can be changed to more or less)
  for s=1,4 do
    simstep()
  end

  --make the left most and right most columns into walls (so player can't leave map, could make bottom and top walls too if wanted)
  for t=1,#Cave.map do
    Cave.map[t][1].tiletype = 1
    Cave.map[t][#Cave.map[1]].tiletype = 1
  end

  --testing flood
  while floodfill() == false do
    connect()
  end

	--load in the shadow images
	Cave.northShadow = love.graphics.newImage('assets/northShadow.png')
	Cave.southShadow = love.graphics.newImage('assets/southShadow.png')
	Cave.westShadow = love.graphics.newImage('assets/westShadow.png')
	Cave.eastShadow = love.graphics.newImage('assets/eastShadow.png')
	--load in floor images
	Cave.floor = {}
	Cave.floor[1] = love.graphics.newImage('assets/tile-earthfloor1.png')
	Cave.floor[2] = love.graphics.newImage('assets/tile-earthfloor2.png')
	Cave.floor[3] = love.graphics.newImage('assets/tile-earthfloor3.png')
	Cave.floor[4] = love.graphics.newImage('assets/tile-earthfloor4.png')
	--torch images
	Cave.torch1 = love.graphics.newImage('assets/torch1.png')
	Cave.torch2 = love.graphics.newImage('assets/torch2.png')
	Cave.torch3 = love.graphics.newImage('assets/torch3.png')
	Cave.torch4 = love.graphics.newImage('assets/torch4.png')
	--make the cave look a little more realistic
	setShadows()
	setTorches()
	positionPlayer()
	Cave.camera.x = (Cave.player.x*Cave.tilewidth) - (5*Cave.tilewidth)
	Cave.camera.y = (Cave.player.y*Cave.tileheight) - (4*Cave.tileheight)

  --just prints an ascii representation of finished map to terminal
  for a=1,Cave.mapheight do
    for b=1,Cave.mapwidth do
      if Cave.map[a][b].tiletype == 1 then
        io.write("X")
				tilenumber = math.random(6)
				tilestring = 'tile-earth' .. tilenumber
				image = love.graphics.newImage('assets/' .. tilestring .. '.png')
				Cave.map[a][b].image = image
      elseif Cave.map[a][b].tiletype == 2 then
        io.write(" ")
				tilenumber = math.random(5)
				tilestring = 'tile-wall' .. tilenumber
				image = love.graphics.newImage('assets/' .. tilestring .. '.png')
				Cave.map[a][b].image = image
      elseif Cave.map[a][b].tiletype == 3 then
        io.write(".")
				tilenumber = math.random(5)
				tilestring = 'tile-wall' .. tilenumber
				image = love.graphics.newImage('assets/' .. tilestring .. '.png')
				Cave.map[a][b].image = image
      elseif Cave.map[a][b].tiletype == 4 then
        io.write(".")
				tilenumber = math.random(5)
				tilestring = 'tile-wall' .. tilenumber
				image = love.graphics.newImage('assets/' .. tilestring .. '.png')
				Cave.map[a][b].image = image
      elseif Cave.map[a][b].tiletype == 5 then
        io.write("O")
				tilenumber = math.random(5)
				tilestring = 'tile-wall' .. tilenumber
				image = love.graphics.newImage('assets/' .. tilestring .. '.png')
				Cave.map[a][b].image = image
      else
        io.write(" ")
      end
    end
    print()
  end
end
