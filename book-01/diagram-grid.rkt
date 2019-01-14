#lang racket

(require pict
         threading)

(define diagrams
  (~>> (build-list 16 add1)
       (map number->string)
       (map (λ (s) (if (= 1 (string-length s))
                       (string-append "0" s)
                       s)))
       (map (λ (s) (string-append "prop-01-" s "-diagram.png")))
       (map bitmap)
       (map frame)
       (map (λ (p) (scale p 0.4)))))

(define diagram-grid
  (frame #:line-width 2 (vl-append
                         (apply hc-append (take diagrams 4))
                         (apply hc-append (take (drop diagrams 4) 4))
                         (apply hc-append (take (drop diagrams 8) 4))
                         (apply hc-append (drop diagrams 12)))))

diagram-grid
;(send (pict->bitmap diagram-grid) save-file "diagram-grid.png" 'png)
