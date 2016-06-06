# super-shape-me: Slur & Tie Tweaking for Lilypond

This package provides helper commands for tweaking slurs and ties with minimum fuss.

<p align="center">
  <a href="https://github.com/lyp-packages/super-shape-me/blob/master/super-shape-me-test.png">
  <img
    src="https://raw.githubusercontent.com/lyp-packages/super-shape-me/master/super-shape-me-test.png">
  </a>
</p>

This package also includes the excellent `\shapeII` and `\attach` functions by [Janek Warchoł](https://github.com/janek-warchol), [David Nalesnik](https://github.com/davidnalesnik) and others, extracted from the [openlilylib](https://github.com/openlilylib) project.

## Installation

Install using [lyp](https://github.com/noteflakes/lyp)

```bash
lyp install super-shape-me
```

## Usage

For detailed instructions regarding the `\shapeII` command please consult the example [PDF file](./shape2-test.pdf) and the [source](./test/shape2-test.ly).

```lilypond
\require "super-shape-me"

% \sr - set slur ratio (height relative to length)
\sr 0.5 c( d)

% \se - set slur eccentricity - or where most of the curve goes
% (negative for left, positive for right)
\se -1 c( d)

% \sh - set slur max height (in staff spaces)
\sh 4 c( d)

% \shr - set slur max height and ratio
\shr 4 0.5 c( d)

% \she - set slur max height and eccentricity
\she 4 1 c( d)

% \sp - set slur end vertical positions
% (staff spaces relative to middle staff line)
\sp 1.5 1 c( d)

% \snudge - move slur by specifying relative end positions. The slur shape is 
% maintained. That way a slur can be rotated, elongated or skewed.
% A coordinate can be either a scheme pair, a number signifying vertical 
% position, or #f for a zero coordinate.
\snudge 2 0 c( d)

% \ss - set slur shape by specifying all four control points. 
% A coordinate can be either a scheme pair, a number signifying vertical 
% position, or #f for a zero coordinate.
\ss #'(-1 0 (1 . 1) #f) c( d)

% \sii - shortcut to apply \shapeII to the following slur.
\sii #'((a 0 0)(a 1 1)(a 4 1)(a 5 0)) g'1 ( d'')
````

The included [example](./super-shape-me-test.png) ([source](./test/super-shape-me-test.ly)) demonstrates the effect of each command.

