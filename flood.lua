function floodfill()

  --find first open square
  --flood fill
  --check for still open squares
  
  --the first free square x coord
  local x
  --the first free square y coord
  local y
  --whether we have found that first square yet
  local foundFirstSquare = false

  --find the first square
  for b = 1,#Cave.map do
    for a = 1,#Cave.map[1] do
      if Cave.map[b][a] == 0 then
        x = a
        y = b
        foundFirstSquare = true
        break
      end
    end
    if foundFirstSquare == true then
      break
    end
  end

  if foundFirstSquare == false then
    io.write("That was a terrible generation.\n")
    os.exit()
  end

  --our target 'colour' is a 0
  --our replacement 'colour' is a 2
  --to store nodes in
  local queue = {}
  --this is the initial node, it is just coords
  local node = { x , y }
  --this keeps a track of the west most node from the current node that is still the target 'colour'
  local w
  --this keeps a track of the east most node from the current node that is still the target 'colour'
  local e


  --YES MOTHERFUCKER
  table.insert( queue , node )
  local added = 1
  while added > 0 do
    added = 0
    for i = 1,#queue do
      if Cave.map[queue[i][2]][queue[i][1]] == 0 then
        w = queue[i]
        e = queue[i]
        while w[1] - 1 > 0 and Cave.map[w[2]][w[1]-1] == 0 do
          w = { w[1]-1, w[2] }
        end
        while e[1] + 1 <= #Cave.map[1] and Cave.map[e[2]][e[1]+1] == 0 do
          e = { e[1]+1, e[2] }
        end
        for m = w[1],e[1] do
          Cave.map[w[2]][m] = 2
          if w[2]-1 > 0 and Cave.map[w[2]-1][m] == 0 then
            table.insert( queue, {m, w[2]-1} )
            added = added + 1
          end
          if w[2]+1 <= #Cave.map and Cave.map[w[2]+1][m] == 0 then
            table.insert( queue, {m, w[2]+1} )
            added = added + 1
          end
        end
      end
    end
    for z = 1,#queue-added do
      table.remove( queue, 1 )
    end
  end
end
