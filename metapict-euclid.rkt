#lang racket

(require metapict
         (only-in math/number-theory quadratic-solutions))
(provide (all-defined-out))

(set-curve-pict-size 500 500)

;;; CUSTOM LABELING

;; draw a dot-label with italic lettering.
(define (point-label letter pt [pos (bot)])
  (label (text letter (cons 'italic 'roman) 24) pt pos))

;; draw a label with italic lettering
(define (point-dot-label letter pt [pos (bot)])
  (dot-label (text letter (cons 'italic 'roman) 24) pt pos))

;;; SEGMENT AND ANGLE DECORATORS

;; mark-angle : pt pt pt int number number -> pict
;; mark the directed angle AOB with n arcs that are sep units apart
;; The initial arc has radius r.
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

;;; INTERSECTIONS

;;slope of line through two points. Returns false if vertical line.
(define (slope A B)
  (define-values (Ax Ay Bx By)
    (values (pt-x A) (pt-y A)
            (pt-x B) (pt-y B)))
  (if (= Ax Bx)
      #f
      (/ (- By Ay) (- Bx Ax))))


;;find the intersection point between lines AB and CD
(define (intersect-ll A B C D)
  (match-define (pt Ax Ay) A)
  (match-define (pt Bx By) B)
  (match-define (pt Cx Cy) C)
  (match-define (pt Dx Dy) D)
  (define m (slope A B))
  (define n (slope C D))
  (cond
    [(and (not m) (not n)) #f] ;parallel: both lines are vertical
    [(equal? n m) #f] ;slopes are equal, lines are parallel.
    [(not m) (pt Ax (+ (* n (- Ax Cx)) Cy))] ;AB is vertical. Ax is the x coord.
    [(not n) (pt Cx (+ (* m (- Cx Ax)) Ay))] ;CD is vertical. Cx is the x cord.
    [(zero? m) (pt (+ Cx (/ (- Ay Cy) n)) Ay)]  ;AB is horizontal. Ay is the y coord.
    [(zero? n) (pt (+ Ax (/ (- Cy Ay) m)) Cy)] ;CD is horizontal. Cy is the y coord.
    [else (let* ([x (/ (+ (* m Ax) (- (* n Cx)) Cy (- Ay)) (- m n))] ;General case
                 [y (+ (* m x) (- (* m Ax)) Ay)])
            (pt x y))]))

;;find the intersection of a line AB and circle with center C radius r
;;return a list of intersections
(define (intersect-lc A B C r)
  (match-define (pt Ax Ay) A)
  (match-define (pt Bx By) B)
  (match-define (pt Cx Cy) C)
  (define aX (- Ax Cx)) ;translate so that C is at the origin.
  (define aY (- Ay Cy))
  (define m (slope A B))
  (define xs (quadratic-solutions
              (+ 1 (expt m 2))
              (- (* 2 m aY) (* 2 (expt m 2) aX))
              (- (expt (- (* m aX) aY) 2) (expt r 2))))
  (define ys (map (lambda (x) (+ (* m (- x aX)) aY)) xs))
  (define XS (map (lambda (x) (+ x Cx)) xs)) ;translate back to original coords.
  (define YS (map (lambda (y) (+ y Cy)) ys))
  (map pt XS YS))

(define (intersect-cl C r A B)
  (intersect-lc A B C r))

;; return list of intersections of two circles
;; pt real pt real -> listof pt
(define (intersect-cc A r1 B r2)
  (define d (dist A B))
  ;; using law of cosines:
  (define α (acos (/ (+ (- (expt r2 2)) (expt r1 2) (expt d 2)) (* 2 r1 d))))
  (define-values (AB θ)
    (@ (pt- B A)))
  (cond
    [(and (equal? A B) (equal? r1 r2)) (error "Circles may not be identical.")]
    [(> d (+ r1 r2)) empty]
    [(or (= d (+ r1 r2)) ;externally tangent
         (= (+ r1 d) r2) ;internally tangent
         (= (+ r2 d) r1)) ;internally tangent
     (list (med (/ r1 (+ r1 r2)) A B))]
    [else (list
           (pt+ A (pt@ r1 (+ θ α)))
           (pt+ A (pt@ r1 (- θ α))))]))
