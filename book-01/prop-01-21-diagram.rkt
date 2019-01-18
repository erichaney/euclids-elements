#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-21-diagram)

(def A (pt -.4 .6))
(def B (pt -.7 -.6))
(def C (pt .6 -.6))
(def D (pt -.3 0))
(def E (intersect-ll B D A C))

(define prop-01-21-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (ulft))
   (point-label "B" B (llft))
   (point-label "C" C (lrt))
   (curve B -- D)
   (curve C -- D)
   (point-label "D" D (ulft))
   ; 1
   (curve D -- E)
   (point-label "E" E (urt))))

;(frame (penwidth 2 prop-01-21-diagram))
;(send (pict->bitmap (penwidth 2 prop-01-21-diagram)) save-file "prop-01-21-diagram.png" 'png)