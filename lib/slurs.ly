% Slur shaping commands

sr = #(define-music-function (parser location r) (number?)
  #{ \once \override Slur.ratio = #r #})
  
se = #(define-music-function (parser location e) (number?)
  #{ \once \override Slur.eccentricity = #e #})

sh = #(define-music-function (parser location h) (number?)
  #{ \once \override Slur.height-limit = #h #})

she = #(define-music-function (parser location h e) (number? number?)
  #{ \once \override Slur.height-limit = #h
     \once \override Slur.eccentricity = #e #})

shr = #(define-music-function (parser location h r) (number? number?)
  #{ \once \override Slur.height-limit = #h
     \once \override Slur.ratio = #r #})

sp = #(define-music-function (parser location p1 p2) (number? number?)
  #{ \once \override Slur.positions = #(cons p1 p2) #})

ss = #(define-music-function (parser location s) (scheme?)
  #{ \once \shape #(ssm:convert-coord-list s) Slur #})

snudge = #(define-music-function (parser location ca cb) (scheme? scheme?)
  #{ \once \shape #(ssm:interpolate-coords ca cb) Slur #})
  
sii = #(define-music-function (parser location s) (scheme?)
  #{ \shapeII #s Slur #})