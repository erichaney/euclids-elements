#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide (all-defined-out))

(def base 1.2)
(def A (pt -.9 -.5))
(def B (pt .9 -.5))
(def C (med 0.55 A B))
(def D (pt+ C (vec (- (/ base 2)) 0)))
(def E (pt+ C (vec (/ base 2) 0)))
(def F (car (intersect-cc D (dist D E) E (dist D E))))

(define prop-01-11-diagram
  (draw
   ; given
   (curve A -- B)
   (point-dot-label "C" C (bot))
   (point-label "A" A (bot))
   (point-label "B" B (bot))
   ; 1
   (point-dot-label "D" D (bot))
   ; 2
   (point-dot-label "E" E (bot))
   ; 3
   (curve D -- F -- E)
   (point-label "F" F (top))
   ; 4
   (curve F -- C)))

(penwidth 2 prop-01-11-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-11-diagram)) save-file "prop-01-11-diagram.png" 'png)