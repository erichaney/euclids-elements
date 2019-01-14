#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-15-diagram)

(def A (pt -.75 .5))
(def B (pt .75 -.5))
(def C (pt -.8 0))
(def D (pt .8 0))
(def E (med 0.5 C D))


(define prop-01-15-diagram
  (draw
   ; given
   (curve A -- B)
   (curve D -- C)
   (point-label "A" A (ulft))
   (point-label "B" B (lrt))
   (point-label "D" D (rt))
   (point-label "C" C (lft)) 
   (point-label "E" E (top))))

(penwidth 2 prop-01-15-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-15-diagram)) save-file "prop-01-15-diagram.png" 'png)