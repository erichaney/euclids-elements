#lang racket

(require metapict
         "../metapict-euclid.rkt")

(def A (pt -.5 -.3))
(def B (pt+ A (vec .9 0)))
(def C (pt .1 .4))
(def D (pt+ C (vec .25 -.1)))

(define prop1-7-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (lft))
   (point-label "B" B (rt))
   (point-label "C" C (top))
   ; 1
   (point-label "D" D (urt))
   (curve A -- D -- B)
   ; 2
   (curve C -- D)))

(penwidth 2 prop1-7-diagram)
;(send (pict->bitmap (penwidth 2 prop1-7-diagram)) save-file "prop1-7-diagram.png" 'png)