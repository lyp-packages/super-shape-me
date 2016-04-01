# super-shape-me: Slur & Tie Tweaking for Lilypond

This package provides helper commands for tweaking slurs and ties with minimum fuss.

<p align="center">
  <a href="https://github.com/noteflakes/lyp-super-shape-me/blob/master/super-shape-me-test.png">
  <img
    src="https://raw.githubusercontent.com/noteflakes/lyp-super-shape-me/master/super-shape-me-test.png">
  </a>
</p>

## Installation

Install using [lyp](https://github.com/noteflakes/lyp)

```bash
lyp install super-shape-me
```

## Usage

```lilypond
\require "super-shape-me"

% \sR - set slur ratio (height relative to length)
\sR 0.5 c( d)

% \sE - set slur eccentricity - or where most of the curve goes
% (negative for left, positive for right)
\sE -1 c( d)

% \sH - set slur max height (in staff spaces)
\sH 4 c( d)

% \sHR - set slur max height and ratio
\sHR 4 0.5 c( d)

% \sHE - set slur max height and eccentricity
\sHE 4 1 c( d)

% \sP - set slur end vertical positions
% (staff spaces relative to middle staff line)
\sP 1.5 1 c( d)

% \sNudge - move slur by specifying relative end positions. The slur shape is 
% maintained. That way a slur can be rotated, elongated or skewed.
% A coordinate can be either a scheme pair, a number signifying vertical 
% position, or #f for a zero coordinate.
\sNudge 2 0 c( d)

% \sS - set slur shape by specifying all four control points. 
% A coordinate can be either a scheme pair, a number signifying vertical 
% position, or #f for a zero coordinate.
\sS #'(-1 0 (1 . 1) #f) c( d)

````

The included [example](https://raw.githubusercontent.com/noteflakes/lyp-super-shape-me/master/super-shape-me-test.png) ([source](https://github.com/noteflakes/lyp-super-shape-me/blob/master/test/super-shape-me-test.ly)) demonstrates the effect of each command.

