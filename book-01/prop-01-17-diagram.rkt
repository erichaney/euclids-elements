#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-17-diagram)

(def A (pt -.9 .5))
(def B (pt -.7 -.3))
(def D (pt .8 -.3))
(def C (med 0.5 B D))

(define prop-01-17-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (ulft))
   (point-label "B" B (llft))
   (point-label "C" C (bot))
   ; 1
   (curve C -- D)
   (point-label "D" D (bot))))

;(frame (penwidth 2 prop-01-17-diagram))
;(send (pict->bitmap (penwidth 2 prop-01-17-diagram)) save-file "prop-01-17-diagram.png" 'png)