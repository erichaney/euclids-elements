#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-05-diagram)

(define A (pt 0 0.8))
(define B (pt -0.4 -.2))
(define C (pt 0.4 -.2))
(define D (med 1.6 A B))
(define E (med 1.6 A C))
(define F (med 0.6 B D))
(define G (med 0.6 C E))


(define prop-01-05-diagram
  (draw
   ;given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (top))
   (point-label "B" B (lft))
   (point-label "C" C (rt))
   ;1
   (curve B -- D)
   (curve C -- E)
   (point-label "D" D (bot))
   (point-label "E" E (bot))
   ;2
   (point-dot-label "F" F (lft))
   ;3
   (point-dot-label "G" G (rt))
   ;4
   (curve B -- G)
   (curve F -- C)))


;(penwidth 2 prop-01-05-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-05-diagram)) save-file "prop-01-05-diagram.png" 'png)