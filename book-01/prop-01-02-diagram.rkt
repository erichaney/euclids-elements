#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-02-diagram)

(define A (pt 0 -.1))
(define B (pt .2 .1))
(define C (pt .1 .6))
(define AB (dist A B))
(define D (car (intersect-cc A AB B AB)))
(define G (cadr (intersect-lc D B B (dist B C))))
(define L (cadr (intersect-lc D A D (dist D G))))
(define F (med 1.4 B G))
(define E (med 1.4 D L))

(define diagram-0
  (draw
   ; given
   (point-dot-label "A" A (lft))
   (curve B -- C)
   (point-label "B" B (urt))
   (point-label "C" C (top))))

(define diagram-1
  (draw
   diagram-0
   (curve A -- B)))

(define diagram-2
  (draw
   diagram-1
   (curve A -- D -- B)
   (point-label "D" D (lft))))

(define diagram-3
  (draw
   diagram-2
   (curve B --  F)
   (curve A -- E)
   (point-label "F" F (bot))
   (point-label "E" E (bot))))

(define diagram-4
  (draw
   diagram-3
   (circle B C)
   (point-label "G" G (urt))
   (point-label "H" (pt+ B (vec@ (dist B C) (* 7/8 pi))) (ulft))))

(define diagram-5
  (draw
   diagram-4
   (circle D G)
   (point-label "L" L (llft))
   (point-label "K" (pt+ D (vec@ (dist D G) (* 3/4 pi)))(ulft))))

(define (prop-01-02-diagram [n 5])
  (case n
    [(0) diagram-0]
    [(1) diagram-1]
    [(2) diagram-2]
    [(3) diagram-3]
    [(4) diagram-4]
    [else diagram-5]))
 
(penwidth 2 (prop-01-02-diagram))
;(send (pict->bitmap (penwidth 2 (prop-01-02-diagram))) save-file "prop-01-02-diagram.png" 'png)