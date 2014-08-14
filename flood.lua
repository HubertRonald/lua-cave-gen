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
    return true
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
  connectedList = {}

  --YES MOTHERFUCKER
  table.insert( queue , node )
  local added = 1
  while added > 0 do
    added = 0
    for i = 1,#queue do
      if Cave.map[queue[i][2]][queue[i][1]] == 0 or Cave.map[queue[i][2]][queue[i][1]] == 3 then
        w = queue[i]
        e = queue[i]
        while w[1] - 1 > 0 and (Cave.map[w[2]][w[1]-1] == 0 or Cave.map[w[2]][w[1]-1] == 3) do
          w = { w[1]-1, w[2] }
        end
        while e[1] + 1 <= #Cave.map[1] and (Cave.map[e[2]][e[1]+1] == 0 or Cave.map[e[2]][e[1]+1] == 3) do
          e = { e[1]+1, e[2] }
        end
        for m = w[1],e[1] do
          if Cave.map[w[2]][m] == 0 then
            Cave.map[w[2]][m] = 2
          else 
            Cave.map[w[2]][m] = 4
          end
          table.insert(connectedList, {m, w[2]})
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
  return false
end
  --next step, check for unconnected chambers
function connect() 
  local unconnected = false
  local unconnectedList = {}
  
  for a=1,Cave.mapheight do
    for b=1,Cave.mapwidth do
      if Cave.map[a][b]==0 then
        unconnected = true
        local nodePoint = { b, a }
        table.insert(unconnectedList, nodePoint)
      end
    end
  end

  --somehow need to find the shortest distance between the unconnected and connected sections in both node lists
  local difflist = {}

  for s = 1,#connectedList do
    for t = 1,#unconnectedList do
      local diff = math.sqrt((connectedList[s][1] - unconnectedList[t][1])^2 + (connectedList[s][2] - unconnectedList[t][2])^2)
      table.insert(difflist, {diff, connectedList[s], unconnectedList[t]})
    end
  end

  --sort the lists (write a godamn better sort)
  table.sort(difflist, compare)
  if difflist[1] == null then
    return
  end
  local close1 = difflist[1][2]
  local close2 = difflist[1][3]

  if close1[1] <= close2[1] then
    for u = close1[1],close2[1] do
      Cave.map[close1[2]][u] = 3
    end
  else
    for u = close2[1],close1[1] do
      Cave.map[close1[2]][u] = 3
    end
  end

  if close1[2] <= close2[2] then
    for u = close1[2],close2[2] do
      Cave.map[u][close2[1]] = 3
    end
  else
    for u = close2[2],close1[2] do
      Cave.map[u][close2[1]] = 3
    end
  end

end

function compare(a,b)
    return a[1] < b[1]
end
