function initialise(x,y)
  --this is the percentage chance of a cell being "alive" at first, can be tweaked but I find this to be ideal
  local chance = 46
  --until you get to your desired size, this adds a row, then the second for loop adds the correct amount of columns to your row, then onto the next row until map height is reached
  for a=1,y do
    table.insert(Cave.map,{})
    for b=1,x do
      --cell is a 1 (1=wall or "alive") 41/100 times
      if math.random(100) < chance then
        table.insert(Cave.map[a],1)
      else
        table.insert(Cave.map[a],0)
      end
    end
  end
end

--the simulation step that actually implements the cellular automata part
--(0 = PASSAGE, 1 = WALL)
function simstep()
  --the birth limit
  local birth = 4
  --the death limit
  local death = 3
  --iterates through every cell in the Cave.map
  for a=1,#Cave.map do
    for b=1,#Cave.map[1] do
      --gets the current amount of cells around it (including diagonals)
      local newval = countNeighbours(b,a)
      --if its a wall ("alive") then we need to see if it is lonely, and will "die"
      if Cave.map[a][b]==1 then
        --it "dies" if there are less than the death limit of "alive" cells around it
        if newval < death then
          Cave.map[a][b] = 0
        else
          --otherwise it stays the same
          Cave.map[a][b] = 1
        end
      else
        --if its a "dead" square, it can be "born" if it has enough "alive" squares around it, ie if the neighbours are higher than the birth limit
        if newval > birth then
          Cave.map[a][b] = 1
        else
          --otherwise it stays "dead"
          Cave.map[a][b] = 0
        end
      end
    end
  end
end

--function that counts the number of alive neighbours around a cell, takes the x and y coordinates of that cell
function countNeighbours(x,y)
  --initialises the number of alive neighbours
  local count = 0
  --iterates through every cell around our target
  for i=-1,1 do
    for j=-1,1 do
      --the current neighbour cell's x coordinate
      local n_X = x+i
      --the current neighbour cell's y coordinate
      local n_Y = y+j
      --if i and j are 0, then we are on our original cell
      if i==0 and j==0 then
        --so do nothing here
        --this next line makes sure we aren't going to check an invalid index of our Cave.map table to stop errors, and instead, if it's out of bounds, we just count it as alive
      elseif n_X<1 or n_Y<1 or n_X>#Cave.map[1] or n_Y>#Cave.map then
        count = count + 1
        --if its a wall, then its alive so add to our count
      elseif Cave.map[n_Y][n_X]==1 then
        count = count + 1
      end
    end
  end
  --finally, return the number of alive neighbours for our given cell
  return count
end
