#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-16-diagram)

(def A (pt -.1 .5))
(def B (pt -.9 -.3))
(def C (pt .1 -.3))
(def D (pt .7 -.3))
(def E (med 0.5 A C))
(def F (med 2 B E))
(def G (med 1.5 A C))


(define prop-01-16-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (curve B -- D)
   (point-label "A" A (top))
   (point-label "B" B (llft))
   (point-label "C" C (llft)) 
   (point-label "D" D (rt))
   ; 1
   (point-label "E" E (urt))
   ; 2
   (curve B -- E)
   ; 3
   (curve E -- F)
   (point-label "F" F (urt))
   ; 4
   (curve F -- C)
   ; 5
   (curve C -- G)
   (point-label "G" G (lrt))))

(penwidth 2 prop-01-16-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-16-diagram)) save-file "prop-01-16-diagram.png" 'png)