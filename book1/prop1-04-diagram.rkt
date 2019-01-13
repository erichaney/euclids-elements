#lang racket

(require metapict
         "../metapict-euclid.rkt")

(define A (pt -.3 .2))
(define B (pt+ A (vec -.5 -.6)))
(define C (pt+ B (vec .6 0)))

(define v (vec 1 0))

(define D (pt+ A v))
(define E (pt+ B v))
(define F (pt+ C v))

(define prop1-4-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (curve D -- E -- F -- cycle)
   (point-label "A" A (top))
   (point-label "D" D (top))
   (point-label "B" B (bot))
   (point-label "E" E (llft))
   (point-label "C" C (lrt))
   (point-label "F" F (lrt))
   ; 1
   (dashed (draw (curve E .. (med 0.5 (pt+ F (vec 0 -.05)) (pt+ E (vec 0 -.05))) .. F)))))

(penwidth 2 prop1-4-diagram)
;(send (pict->bitmap (penwidth 2 prop1-4-diagram)) save-file "prop1-4-diagram.png" 'png)