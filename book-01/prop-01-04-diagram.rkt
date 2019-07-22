#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-04-diagram)

(define A (pt -.4 .3))
(define B (pt+ A (vec -.5 -.7)))
(define C (pt+ B (vec .7 0)))

(define v (vec 1 0))

(define D (pt+ A v))
(define E (pt+ B v))
(define F (pt+ C v))

(define diagram-0
  (draw
   (curve A -- B -- C -- cycle)
   (curve D -- E -- F -- cycle)
   (point-label "A" A (top))
   (point-label "D" D (top))
   (point-label "B" B (bot))
   (point-label "E" E (llft))
   (point-label "C" C (lrt))
   (point-label "F" F (lrt))))

(define diagram-1
  (draw
   diagram-0
   (dashed (draw (curve E .. (med 0.5 (pt+ F (vec 0 -.05)) (pt+ E (vec 0 -.05))) .. F)))))

(define (prop-01-04-diagram [n 1])
  (if (= n 0)
      diagram-0
      diagram-1))

(penwidth 2 (prop-01-04-diagram))
;(send (pict->bitmap (penwidth 2 (prop-01-04-diagram))) save-file "prop-01-04-diagram.png" 'png)