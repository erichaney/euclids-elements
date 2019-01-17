#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-18-diagram)

(def A (pt -.8 .4))
(def B (pt -.6 -.3))
(def C (pt .8 -.3))
(def D (cadr (intersect-cl A (dist A B) A C)))

(define prop-01-18-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (ulft))
   (point-label "B" B (llft))
   (point-label "C" C (bot))
   ; 1
   (point-dot-label "D" D (urt))
   ; 2
   (curve B -- D)
   ))

;(frame (penwidth 2 prop-01-18-diagram))
;(send (pict->bitmap (penwidth 2 prop-01-18-diagram)) save-file "prop-01-18-diagram.png" 'png)