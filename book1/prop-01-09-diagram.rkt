#lang racket

(require metapict
         "../metapict-euclid.rkt")

(def A (pt 0 .7))
(def B (pt -.5 -.6))
(def C (pt .5 -.6))
(def D (med 0.6 A B))
(def E (med 0.6 A C))
(def F (cadr (intersect-cc D (dist D E) E (dist D E))))

(define prop1-9-diagram
  (draw
   ; given
   (curve C -- A -- B)
   (point-label "A" A (top))
   (point-label "B" B (llft))
   (point-label "C" C (lrt))
   ; 1
   (point-dot-label "D" D (ulft))
   ; 2
   (point-dot-label "E" E (urt))
   ; 3
   (curve D -- E)
   ; 4
   (curve D -- F -- E)
   (point-label "F" F (bot))
   ; 5
   (curve A -- F)))
   
(penwidth 2 prop1-9-diagram)
;(send (pict->bitmap (penwidth 2 prop1-9-diagram)) save-file "prop-01-09-diagram.png" 'png)