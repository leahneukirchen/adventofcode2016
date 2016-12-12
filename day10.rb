b = {}
a = {}

File.readlines("day10").each { |l|
  v = l.split
  case v[0]
  when "bot"
    b[v[1].to_i] = [v[6].to_i + ((v[5] == "bot") ? 0 : 1000), v[11].to_i]
  when "value"
    (a[v[5].to_i] ||= []) << v[1].to_i
  end
}

loop {
  n, x = a.find { |nn, xx| xx.size == 2 }

  break unless n

  lo, hi = x.sort
  p n  if [lo,hi] == [17,61]

  (a[b[n][0]] ||= []) << lo
  (a[b[n][1]] ||= []) << hi
  
  a.delete(n)
}

p a.values_at(1000,1001,1002).flatten.inject(:*) 
