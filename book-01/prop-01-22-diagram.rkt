#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-22-diagram)

(def a (vec .6 0))
(def b (vec .5 0))
(def c (vec .3 0))

(def A (pt .35 .9))
(def B (pt .35 .8))
(def C (pt .35 .7))
(def A+a (pt+ A a))
(def B+b (pt+ B b))
(def C+c (pt+ C c))

(def D (pt -.9 -.1))
(def E (pt .9 -.1))

(def F (pt+ D a))
(def G (pt+ F b))
(def H (pt+ G c))

(def intersections (intersect-cc F (dist D F) G (dist G H)))

(def K (car intersections))
(def L (cadr intersections))

(define prop-01-22-diagram
  (draw
   ; given
   (point-label "A" A (lft))
   (point-label "B" B (lft))
   (point-label "C" C (lft))
   (curve A -- A+a)
   (curve B -- B+b)
   (curve C -- C+c)
   ; 1
   (curve D -- E)
   (point-label "D" D (lft))
   (point-label "E" E (llft))
   ; 2
   (point-dot-label "F" F (bot))
   (point-dot-label "G" G (bot))
   (point-dot-label "H" H (lrt))
   ; 3
   (circle F (dist F D))
   ; 4
   (circle G (dist G H))
   (point-label "K" K (top))
   (point-label "L" L (lrt))
   ; 5
   (curve F -- K)
   (curve K -- G)))

;(frame (penwidth 2 prop-01-22-diagram))
;(send (pict->bitmap (penwidth 2 prop-01-22-diagram)) save-file "prop-01-22-diagram.png" 'png)