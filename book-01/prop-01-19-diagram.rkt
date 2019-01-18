#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-19-diagram)

(def A (pt .4 .6))
(def B (pt -.3 0))
(def C (pt .4 -.7))

(define prop-01-19-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (urt))
   (point-label "B" B (lft))
   (point-label "C" C (lrt))))

;(frame (penwidth 2 prop-01-19-diagram))
;(send (pict->bitmap (penwidth 2 prop-01-19-diagram)) save-file "prop-01-19-diagram.png" 'png)