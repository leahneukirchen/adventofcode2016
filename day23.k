p:" "\'0:"day23"
v:{(r,"i"$,x)"abcd"?*x}

tgl:{s:~[**p[x]]
 `0:"TGL ",($x),"\n"
 $[s"i";p::.[p;x,0;"dec"]
   s"d";p::.[p;x,0;"inc"]
   s"t";p::.[p;x,0;"inc"]
   s"j";p::.[p;x,0;"cpy"]
   s"c";p::.[p;x,0;"jnz"]
  ]}

e:{t:"abcd"?**|c:p[i]; i+:1; s:~[**c;]
 $[s"m";r[0]:r[3]*r[1]; s"t";tgl[i+(-1)+v@*|c]; s"c";$[t<#r;r[t]:v@c@1;]; s"i";r[t]+:1; s"d";r[t]-:1; s"j";i+:(-1+v@*|c)*~0=v@c@1]; r}

r:7 0 0 0;i:0;*{i<#p}e/1	/ 10890

p:" "\'0:"day23.opt"	/ uses mul instruction for a=b*d (insn 4..9)
r:12 0 0 0;i:0;*{i<#p}e/1	/ 479007450
