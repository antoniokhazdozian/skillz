# These are just to make the map
# easier for me to read. "M" is
# visually more dense than "o".
M = 'land'
o = 'water'

world = [[M,M,M,M,M,M,M,M,M,M,M],
		 [M,o,o,o,o,o,o,o,o,o,M],
		 [M,o,o,o,o,o,o,M,o,o,M],
		 [M,o,o,M,o,o,o,o,o,o,M],
		 [M,o,o,M,o,M,M,o,o,o,M],
		 [M,o,o,o,M,M,M,M,o,o,M],
		 [M,o,o,M,M,M,M,M,M,M,M],
		 [M,o,o,M,M,o,M,M,M,o,M],
		 [M,o,o,o,o,o,M,M,o,o,M],
		 [M,o,o,o,o,M,o,o,o,o,M],
		 [M,M,M,M,M,M,M,M,M,M,M]]

def continent_size world, x, y
	if x < 0 or x > 10 or y < 0 or y > 10
		return 0
	end

	if world[y][x] != 'land'

		# Either it's water or we already
		# counted it, but either way, we don't
		# want to count it now.
		return 0
	end
	#puts world[y][x].to_s
	# So first we count this tile...
	size = 1
	world[y][x] = 'counted land'
	# ...then we count all of the
	# neighboring eight tiles (and,
	# of course, their neighbors by
	# way of the recursion).
	size = size + continent_size(world, x-1, y-1)
	#puts size.to_s
	size = size + continent_size(world, x , y-1)
	#puts size.to_s
	size = size + continent_size(world, x+1, y-1)
	#puts size.to_s
	size = size + continent_size(world, x-1, y )
	#puts size.to_s
	size = size + continent_size(world, x+1, y )
	#puts size.to_s
	size = size + continent_size(world, x-1, y+1)
	#puts size.to_suh
	size = size + continent_size(world, x , y+1)
	#puts size.to_s
	size = size + continent_size(world, x+1, y+1)
	size
end
puts continent_size(world, 5, 5)