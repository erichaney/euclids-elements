#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-08-diagram)

(def A (pt -.6 .4))
(def B (pt+ A (vec -.3 -1)))
(def C (pt+ A (vec .4 -.7)))
(def v (vec 1 0))
(defv (D E F)
  (values (pt+ A v)
          (pt+ B v)
          (pt+ C v)))
(def G (pt+ D (vec .2 -.02)))


(define prop-01-08-diagram
  (draw
   ; given
   (curve A -- B -- C -- cycle)
   (point-label "A" A (top))
   (point-label "B" B (llft))
   (point-label "C" C (rt))
   (curve D -- E -- F -- cycle)
   (point-label "D" D (top))
   (point-label "E" E (llft))
   (point-label "F" F (rt))
   ; 1
   (curve  E -- G -- F)
   (point-label "G" G (top))))

(penwidth 2 prop-01-08-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-08-diagram)) save-file "prop-01-08-diagram.png" 'png)