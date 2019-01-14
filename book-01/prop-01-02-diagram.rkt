#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide (all-defined-out))

(define A (pt 0 0))
(define B (pt .2 .2))
(define C (pt .1 .7))
(define AB (dist A B))
(define D (car (intersect-cc A AB B AB)))
(define G (cadr (intersect-lc D B B (dist B C))))
(define L (cadr (intersect-lc D A D (dist D G))))
(define F (med 1.4 B G))
(define E (med 1.4 D L))

(define prop-01-02-diagram
  (draw
   ; given
   (point-dot-label "A" A (lft))
   (curve B -- C)
   (point-label "B" B (urt))
   (point-label "C" C (top))
   ; 1
   (curve A -- B)
   ; 2
   (curve A -- D -- B)
   (point-label "D" D (lft))
   ; 3
   (curve B --  F)
   (curve A -- E)
   (point-label "F" F (bot))
   (point-label "E" E (bot))
   ;4
   (circle B C)
   (point-label "G" G (urt))
   (point-label "H" (pt+ B (vec@ (dist B C) (* 7/8 pi))) (ulft))
   ; 5
   (circle D G)
   (point-label "L" L (llft))
   (point-label "K" (pt+ D (vec@ (dist D G) (* 3/4 pi)))(ulft))
   
   ))
(penwidth 2 prop-01-02-diagram)
;(send (pict->bitmap (penwidth 2 prop-01-02-diagram)) save-file "prop-01-02-diagram.png" 'png)