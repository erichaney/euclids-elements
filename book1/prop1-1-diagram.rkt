#lang racket

(require metapict
         "../metapict-euclid.rkt")


(define A (pt -0.25 0))
(define B (pt 0.25 0))
(define C (car (intersect-cc A (dist A B) B (dist A B))))
(define D (pt+ A (vec@ (dist A B) pi)))
(define E (pt+ B (vec@ (dist A B) 0)))


(define prop1-1-diag
  (draw
   (curve A -- B)
   (circle A B)
   (circle B A)
   (curve A -- C)
   (curve B -- C)
   (point-label "A" A (lft))
   (point-label "B" B (rt))
   (point-label "C" C (top))
   (point-label "D" D (lft))
   (point-label "E" E (rt))))

(penwidth 2 prop1-1-diag)
;(send (pict->bitmap prop1-1-diag) save-file "prop1-1-diag.png" 'png)


