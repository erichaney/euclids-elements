#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide (all-defined-out))

(define A (pt 0 0.8))
(define B (pt -0.4 -.2))
(define C (pt 0.4 -.2))
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