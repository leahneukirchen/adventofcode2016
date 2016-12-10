s = File.read("day09").chomp

o = ""
while s =~ /\((\d+)x(\d+)\)/
  o << $`
  a, b = $1.to_i, $2.to_i
  o << $'[0,a]*b
  s = $'[a..-1]
end
o << s
p o.size

s = File.read("day09")

def len(s)
  o = 0
  while s =~ /\((\d+)x(\d+)\)/
    o += $`.size
    r = $'
    a, b = $1.to_i, $2.to_i
    o += len(r[0,a])*b
    s = r[a..-1]
  end
  o += s.size
  o
end

p len(File.read("day09").chomp)
