#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-10-diagram)

(def A (pt -.7 -.6))
(def B (pt+ A (vec 1.4 0)))
(def C (car (intersect-cc A (dist A B) B (dist A B))))
(def D (med 0.5 A B))

(define prop-01-10-diagram
  (draw
   ; given
   (curve A -- B)
   (point-label "A" A (bot))
   (point-label "B" B (bot))
   ; 1
   (point-label "C" C (top))
   (curve A -- C -- B)
   ; 3
   (point-label "D" D (bot))
   (curve C -- D)))

(penwidth 2 prop-01-10-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-10-diagram)) save-file "prop-01-10-diagram.png" 'png)