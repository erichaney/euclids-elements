#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-03-diagram)

(define A (pt 0 0))
(define B (pt 0.8 0))
(define C (pt 0 0.8))
(define C1 (pt -0.3 0.8))
(define C2 (pt 0.3 0.8))
(define D (pt+ A (vec@ (dist C1 C2) (* 4/5 pi))))
(define F (pt+ A (vec@ (dist C1 C2) (* -1/5 pi))))
(define E (pt+ A (vec@ (dist C1 C2) 0)))

(define prop-01-03-diagram
  (draw
   ; given
   (curve C1 -- C2)
   (curve A -- B)
   (point-label "A" A)
   (point-label "B" B)
   (point-label "C" C (top))
   ; 1
   (curve A -- D)
   (point-label "D" D (ulft))
   ; 2
   (circle A D)
   (point-label "F" F (lrt))
   (point-label "E" E (urt))))


;(penwidth 2 prop-01-03-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-03-diagram)) save-file "prop-01-03-diagram.png" 'png)