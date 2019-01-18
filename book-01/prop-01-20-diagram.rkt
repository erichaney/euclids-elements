#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-20-diagram)

(def A (pt -.4 -.3))
(def B (pt -.7 -.7))
(def C (pt .6 -.7))
(def D (cadr (intersect-cl A (dist A C) B A)))

(define prop-01-20-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (ulft))
   (point-label "B" B (llft))
   (point-label "C" C (lrt))
   ; 1
   (curve A -- D)
   (point-label "D" D (top))
   ; 2
   (curve D -- C)))

;(frame (penwidth 2 prop-01-20-diagram))
;(send (pict->bitmap (penwidth 2 prop-01-20-diagram)) save-file "prop-01-20-diagram.png" 'png)