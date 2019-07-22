#lang racket

(require metapict
         "../metapict-euclid.rkt")
(provide prop-01-01-diagram)

(define A (pt -0.3 0))
(define B (pt 0.3 0))
(define C (car (intersect-cc A (dist A B) B (dist A B))))
(define D (pt+ A (vec@ (dist A B) pi)))
(define E (pt+ B (vec@ (dist A B) 0)))

(define diagram-0
  (draw
   ; given
   (curve A -- B)
   (point-label "A" A (lft))
   (point-label "B" B (rt))))

(define diagram-1
  (draw
   diagram-0
   (circle A B)
   (point-label "C" C (top))
   (point-label "D" D (lft))))

(define diagram-2
   (draw
    diagram-1
   (circle B A)
   (point-label "E" E (rt))))

(define diagram-3
   (draw
    diagram-2
   (curve A -- C)
   (curve B -- C)))

(define (prop-01-01-diagram [n 3])
  (case n
    [(0) diagram-0]
    [(1) diagram-1]
    [(2) diagram-2]
    [else diagram-3]))

(penwidth 2 (prop-01-01-diagram))
;(send (pict->bitmap prop-01-01-diagram) save-file "prop-01-01-diagram.png" 'png)


