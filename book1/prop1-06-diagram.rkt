#lang racket

(require metapict
         "../metapict-euclid.rkt")

(define A (pt 0 0.8))
(define B (pt -0.4 -.2))
(define C (pt 0.4 -.2))
(define D (med 0.25 A B))

(define prop1-6-diagram
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



(penwidth 2 prop1-6-diagram)
;(send (pict->bitmap (penwidth 2 prop1-6-diagram)) save-file "prop1-6-diagram.png" 'png)