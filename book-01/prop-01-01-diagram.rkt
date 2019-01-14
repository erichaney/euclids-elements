#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-01-diagram)

(define A (pt -0.3 0))
(define B (pt 0.3 0))
(define C (car (intersect-cc A (dist A B) B (dist A B))))
(define D (pt+ A (vec@ (dist A B) pi)))
(define E (pt+ B (vec@ (dist A B) 0)))

(define prop-01-01-diagram
  (draw
   ; given
   (curve A -- B)
   (point-label "A" A (lft))
   (point-label "B" B (rt))
   ; 1
   (circle A B)
   (point-label "C" C (top))
   (point-label "D" D (lft))
   ; 2
   (circle B A)
   (point-label "E" E (rt))
   ; 3
   (curve A -- C)
   (curve B -- C)))

(penwidth 2 prop-01-01-diagram)
;(send (pict->bitmap prop-01-01-diagram) save-file "prop-01-01-diagram.png" 'png)


