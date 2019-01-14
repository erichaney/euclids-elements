#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-12-diagram)

(def A (pt -.9 -.5))
(def B (pt .9 -.5))
(def C (pt .1 -.1))
(def D (pt .6 -.6))
(def intersections (intersect-lc A B C (dist C D)))
(def E (cadr intersections))
(def G (car intersections))
(def F (pt+ C (vec 0 (dist C D))))
(def H (med 0.5 G E))


(define prop-01-12-diagram
  (draw
   ; given
   (curve A -- B)
   (point-dot-label "C" C (top))
   (point-label "A" A (bot))
   (point-label "B" B (bot))
   ; 1
   (point-dot-label "D" D (lrt))
   ; 2
   (circle C (dist C D))
   (point-label "E" E (lrt))
   (point-label "G" G (llft))
   (point-label "F" F (top))
   ; 3
   (point-label "H" H (bot))
   ; 4
   (curve C -- G)
   (curve C -- E)
   (curve C -- H)))

;(penwidth 2 prop-01-12-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-12-diagram)) save-file "prop-01-12-diagram.png" 'png)