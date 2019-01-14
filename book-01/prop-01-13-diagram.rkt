#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide (all-defined-out))

(def A (pt .4 .5))
(def C (pt .8 -.3))
(def D (pt -.8 -.3))
(def B (med 0.5 C D))
(def E (pt+ B (vec 0 .9)))


(define prop-01-13-diagram
  (draw
   ; given
   (curve A -- B -- D)
   (curve A -- B -- C)
   (point-label "A" A (urt))
   (point-label "B" B (bot))
   (point-label "D" D (bot))
   (point-label "C" C (bot))
   ; 1
   (point-label "E" E (top))
   (curve E -- B)))

(penwidth 2 prop-01-13-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-13-diagram)) save-file "prop-01-13-diagram.png" 'png)