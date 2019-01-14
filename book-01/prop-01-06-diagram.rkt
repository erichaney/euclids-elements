#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-06-diagram)

(define A (pt 0 0.6))
(define B (pt -0.5 -.6))
(define C (pt 0.5 -.6))
(define D (med 0.25 A B))

(define prop-01-06-diagram
  (draw
   ;given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (top))
   (point-label "B" B (llft))
   (point-label "C" C (lrt))
   ;1
   (point-dot-label "D" D (ulft))
   ;2
   (curve D -- C)))



(penwidth 2 prop-01-06-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-06-diagram)) save-file "prop-01-06-diagram.png" 'png)