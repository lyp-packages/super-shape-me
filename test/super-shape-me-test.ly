\version "2.19.37"

\require "assert"
\pinclude "../package.ly"

#(set-default-paper-size "a4" 'landscape) 
\paper {
  ragged-right = ##t
  ragged-bottom = ##t
  indent = 0
  
  system-system-spacing.padding = 6
  
  top-margin = 5
  bottom-margin = 5
}

#(assert:equal? (ssm:convert-coord '(0 . 0)) '(0 . 0))
#(assert:equal? (ssm:convert-coord '(1 . 2)) '(1 . 2))
#(assert:equal? (ssm:convert-coord #f) '(0 . 0))
#(assert:equal? (ssm:convert-coord 3) '(0 . 3))

#(assert:equal? (ssm:convert-coord-list '()) '())
#(assert:equal? (ssm:convert-coord-list '((0 . 0))) '((0 . 0)))
#(assert:equal? (ssm:convert-coord-list '((1 . 2))) '((1 . 2)))
#(assert:equal? (ssm:convert-coord-list '(#f)) '((0 . 0)))
#(assert:equal? (ssm:convert-coord-list '(3)) '((0 . 3)))

#(assert:equal? (ssm:convert-coord-list '((1 . 2) (3 . 4))) '((1 . 2) (3 . 4)))
#(assert:equal? (ssm:convert-coord-list '((1 . 2) #f (3 . 4)))
  '((1 . 2) (0 . 0) (3 . 4)))
#(assert:equal? (ssm:convert-coord-list '((1 . 2) 5 (3 . 4)))
  '((1 . 2) (0 . 5) (3 . 4)))
#(assert:equal? (ssm:convert-coord-list '(1 2 #f 4))
  '((0 . 1) (0 . 2) (0 . 0) (0 . 4)))
#(assert:equal? (ssm:convert-coord-list '(-1 1 1 -1))
  '((0 . -1) (0 . 1) (0 . 1) (0 . -1)))
  
#(assert:equal? (ssm:rate 1.5 2.5 0) 1.5)
#(assert:equal? (ssm:rate 1.5 2.5 1) 2.5)
#(assert:equal? (ssm:rate 1.5 2.5 0.5) 2.0)

#(assert:equal? (ssm:interpolate-coords #f #f)
  '((0 . 0) (0 . 0) (0 . 0) (0 . 0)))
#(assert:equal? (ssm:interpolate-coords 1 4)
  '((0 . 1) (0 . 2) (0 . 3) (0 . 4)))

#(assert:equal? (ssm:interpolate-coords '(3 . 1) #f)
  '((3 . 1) (2 . 2/3) (1 . 1/3) (0 . 0)))


\header {
  tagline = ##f
}

space = {
  \stopStaff s1*2
  \startStaff
}

\relative c' {
  \override TextScript.padding = 3
  \override TextScript.font-size = -2
  
  c'4( f,2 e'4)
  \sr 0.7 c4(^"\\sr 0.7 (ratio)" f,2 e'4)  \space
  
  c4( f, a8 f' e4) \se 1.5 c4(^"\\se 1.5" f, a8 f' e4) \space

  c4( g a b c e g e4) \sh 5 c4(^"\\sh 5" g a b c e g e4) \break

  c4( g a b c e g e4) \she 5 2 c4(^"\\she 5 2" g a b c e g e4) \space

  c4( g a b c e g e4) \she 4 3 c4(^"\\she 4 3" g a b c e g e4) \space

  c4( g'2 e4) \shr 3 0.7 c4(^"\\shr 3 0.7" g'2 e4) \break

  a,2( e'2) \sp 2.5 2.5 a,2(^"\\sp 2.3 2.5" e'2) \space
  
  a,2( e'2) \snudge 2 0 a,2(^"\\snudge 2 0" e'2) \space
  
  a,2( d'8 e g,4)
    \ss #'(-1 0 (1 . 1) #f) a,2(^"\\ss #'(-1 0 (1 . 1) #f)" d'8 e g,4) 
    
  \stopStaff
  s1*2
  s1*2
  s1*2
  s1*2
}
