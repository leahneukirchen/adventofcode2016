s = "abcdefgh"

def rl(s, c)
  s = s.dup
  a = s.index c
  s = s.slice!(-1) + s
  a.times {
    s = s.slice!(-1) + s
  }
  s = s.slice!(-1) + s  if a >= 4
  s
end

File.readlines("day21").each { |line|
  case line
  when /reverse positions (\d+) through (\d+)/
    a, b = $1.to_i, $2.to_i
    s[a..b] = s[a..b].reverse
  when /rotate based on position of letter (.)/
    s = rl(s, $1)
  when /rotate right (\d+) step/
    $1.to_i.times {
      s = s.slice!(-1) + s
    }
  when /rotate left (\d+) step/
    $1.to_i.times {
      s = s + s.slice!(0)
    }
  when /swap position (\d+) with position (\d+)/
    a, b = $1.to_i, $2.to_i
    s[a], s[b] = s[b], s[a]
  when /move position (\d+) to position (\d+)/
    s.insert($2.to_i, s.slice!($1.to_i))
  when /swap letter (.) with letter (.)/
    s.tr! $1+$2, $2+$1
  else
    abort "what is #{line.dump}"
  end
}

p s # gfdhebac

def brute(s, a)
  s = s.dup
  (1..s.size).each { |i|
    t = s.dup
    i.times {
      t = t.slice!(-1) + t
    }
    if rl(t, a) == s
      return t
    end
  }

  abort "oops"
end

s = "fbgdceah"
File.readlines("day21").reverse_each { |line|
  case line
  when /reverse positions (\d+) through (\d+)/  #idem
    a, b = $1.to_i, $2.to_i
    s[a..b] = s[a..b].reverse
  when /rotate based on position of letter (.)/  #brute
    s = brute(s, $1)
  when /rotate left (\d+) step/  #swap
    $1.to_i.times {
      s = s.slice!(-1) + s
    }
  when /rotate right (\d+) step/  #swap
    $1.to_i.times {
      s = s + s.slice!(0)
    }
  when /swap position (\d+) with position (\d+)/  #idem
    a, b = $1.to_i, $2.to_i
    s[a], s[b] = s[b], s[a]
  when /move position (\d+) to position (\d+)/  #swap
    s.insert($1.to_i, s.slice!($2.to_i))
  when /swap letter (.) with letter (.)/   #idem
    s.tr! $1+$2, $2+$1
  else
    abort "what is #{line.dump}"
  end
}

p s
