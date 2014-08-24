function checkLeft()
	if Cave.player.x - 1 < 1 then
		return false
	elseif Cave.map[round(Cave.player.y)][round(Cave.player.x - 1)].tiletype ~= 1 then
		return true
	else
		return false
	end
end
function checkUpLeft()
	if Cave.player.x - 1 < 1 or Cave.player.y - 1 < 1 then
		return false
	elseif Cave.map[round(Cave.player.y - 1)][round(Cave.player.x - 1)].tiletype ~= 1 then
		return true
	else
		return false
	end
end
function checkRight()
	if Cave.player.x + 1 > #Cave.map[1] then
		return false
	elseif Cave.map[round(Cave.player.y)][round(Cave.player.x + 1)].tiletype ~= 1 then
		return true
	else
		return false
	end
end
function checkUpRight()
	if Cave.player.x + 1 > #Cave.map[1] or Cave.player.y - 1 < 1 then
		return false
	elseif Cave.map[round(Cave.player.y - 1)][round(Cave.player.x + 1)].tiletype ~= 1 then
		return true
	else
		return false
	end
end
function checkBelow()
	if Cave.player.y + 1 > #Cave.map then
		return false
	elseif Cave.map[round(Cave.player.y+1)][round(Cave.player.x)].tiletype ~= 1 then
		return true
	else
		return false
	end
end
function checkAbove()
	if Cave.player.y - 1 < 1 then
		return false
	elseif Cave.map[round(Cave.player.y-1)][round(Cave.player.x)].tiletype ~= 1 then
		return true
	else
		return false
	end
end
function round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end
