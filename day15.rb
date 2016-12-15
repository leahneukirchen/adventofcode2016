t = 0
step = 1

(IO.readlines("day15") << "Disc #7 has 11 positions; at time=0, it is at position 0."
).each.with_index { |line, i|
  size, pos = line.scan(/ \d+/).map(&:to_i)
  
  while (i+pos+t) % size != 0
    t += step
  end
  
  step *= size
}

p t-1
