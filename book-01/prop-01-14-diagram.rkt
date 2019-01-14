#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide (all-defined-out))

(def A (pt -.4 .5))
(def C (pt -.8 -.3))
(def D (pt .8 -.3))
(def B (med 0.5 C D))
(def E (pt .8 -.1))


(define prop-01-14-diagram
  (draw
   ; given
   (curve A -- B -- D)
   (curve A -- B -- C)
   (point-label "A" A (ulft))
   (point-label "B" B (bot))
   (point-label "D" D (bot))
   (point-label "C" C (bot))
   ; 1
   (point-label "E" E (top))
   (subcurve (curve C .. B .. E) 1 2)))

(penwidth 2 prop-01-14-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-14-diagram)) save-file "prop-01-14-diagram.png" 'png)