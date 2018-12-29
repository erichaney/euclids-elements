#lang racket

(require metapict)

;;; CUSTOM LABELING

;; draw a dot-label with italic lettering.
(define (point-label letter pt [pos (bot)])
  (label (text letter (cons 'italic 'roman) 24) pt pos))

;; draw a label with italic lettering
(define (point-dot-label letter pt [pos (bot)])
  (dot-label (text letter (cons 'italic 'roman) 24) pt pos))

;;; SEGMENT AND ANGLE DECORATORS

; mark-angle : pt pt pt int number number -> pict
; mark the directed angle AOB with n arcs that are sep units apart
; The initial arc has radius r.
(define (mark-angle A O B [n 1] [r 1] [sep 0.5])
  (define α (angle (pt- A O)))
  (define β (angle (pt- B O)))
  (for/draw ([n (in-range 1 (add1 n))])
    (shifted O (arc (+ r (* sep (sub1 n))) α β))))

;; mark a right angle with a perpendicular angle mark
(define (mark-right-angle A O B [r 1])
  (define vA (vec@ r (angle (pt- A O))))
  (define vB (vec@ r (angle (pt- B O))))
  (define Ap (shifted O (vec->pt vA)))
  (define Bp (shifted O (vec->pt vB)))
  (define Op (shifted O (vec->pt (vec+ vA vB))))
  (penjoin 'miter (pencap 'butt (draw (curve  Ap -- Op -- Bp)))))
 
;; Internal helper function for making scales and marking lines. 
;; draw a small line segment of lenth "size" so that "pt" is its midpoint at an angle of "dir".
(define (tick-at pt dir size)
  (define v (vec@ (/ size 2) dir))
  (define -v (vec* -1 v))
  (define pt0 (pt+ pt v))
  (define pt1 (pt+ pt -v))
  (draw (curve pt0 -- pt1)))

;; draw evenly spaced tick marks from start-pt to end-pt that are sep units apart.
(define (mark-scale start-pt end-pt [sep 1] #:max-ticks [max-ticks #f] #:tick-size [size 0.5])
  (define α (angle (pt- end-pt start-pt)))
  (define ⊥α (+ (/ pi 2) α))
  (define Δv (vec@ sep α))
  (define partitions (add1 (floor (/ (dist start-pt end-pt) sep))))
  (define pts
    (for/list ([n (in-range partitions)])
      #:break (and max-ticks (> n max-ticks))
      (pt+ start-pt (vec* n Δv))))
  (for/draw ([p pts])
    (tick-at p ⊥α size)))

;; mark a line segment with n ticks centered at pos
;; along line AB.
(define (mark-line A B [num 1] [sep 0.25]  #:tick-size [size 0.5] #:position [pos 0.5])
  (define sep-vec (vec* sep (vec* (/ (dist A B)) (pt- B A))))
  (define start-pt (pt+ (med pos A B) (vec* (/ (sub1 num) -2) sep-vec)))
  (mark-scale start-pt B sep #:max-ticks (sub1 num) #:tick-size size))

;; internal helper function for drawing arrowheads at a point facing along a line 
(define (arrow-at start dir #:size [size 1]) ; TODO: adjust the function to make use of size parameter.
  (define direction-vector (vec* 0.001 dir))
  (draw-arrow (curve start -- (pt+ start direction-vector))))

;; mark a line segment with arrowheads to indicate parallelism
;; with num arrowheads centered at pos along line AB.
(define (mark-parallel A B [num 1] [sep 0.25] #:arrow-size [size 1] #:position [pos 0.5])
  (define sep-vec (vec* sep (vec* (/ (dist A B)) (pt- B A))))
  (define start-pt (pt+ (med pos A B) (vec* (/ (sub1 num) -2) sep-vec)))
  (define points (for/list ([n (in-range num)])
                   (pt+ start-pt (vec* n sep-vec))))
  (for/draw ([p points])
    (arrow-at p sep-vec #:size size)))

