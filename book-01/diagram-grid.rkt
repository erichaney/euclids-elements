#lang racket

(require metapict
         racket/draw)


(require "prop-01-01-diagram.rkt"
         "prop-01-02-diagram.rkt"
         "prop-01-03-diagram.rkt"
         "prop-01-04-diagram.rkt"
         "prop-01-05-diagram.rkt"
         "prop-01-06-diagram.rkt"
         "prop-01-07-diagram.rkt"
         "prop-01-08-diagram.rkt"
         "prop-01-09-diagram.rkt"
         "prop-01-10-diagram.rkt"
         "prop-01-11-diagram.rkt"
         "prop-01-12-diagram.rkt"
         "prop-01-13-diagram.rkt"
         "prop-01-14-diagram.rkt"
         "prop-01-15-diagram.rkt"
         "prop-01-16-diagram.rkt")

(define bgcolors
  '("SeaShell"
    "LightCyan"
    "AliceBlue"
    "WhiteSmoke"
    "Honeydew"
    "Snow"
    "GhostWhite"
    "OldLace"
    "LightYellow"
    "Azure"
    "PapayaWhip"
    ))

(define fgcolors
  '("OrangeRed"
    "Red"
    "DeepPink"
    "VioletRed"
    "HotPink"
    "Magenta"
    "Salmon"
    "LightSalmon"))

(define diagrams
  (map (λ (p) (cc-superimpose
               (color (car (shuffle bgcolors)) (filled-rectangle 250 250))
               (frame #:line-width 2 (scale 0.5 (pencolor (car (shuffle fgcolors)) (penwidth 2 p))))) )
       `(,prop-01-01-diagram
         ,prop-01-02-diagram
         ,prop-01-03-diagram
         ,prop-01-04-diagram
         ,prop-01-05-diagram
         ,prop-01-06-diagram
         ,prop-01-07-diagram
         ,prop-01-08-diagram
         ,prop-01-09-diagram
         ,prop-01-10-diagram
         ,prop-01-11-diagram
         ,prop-01-12-diagram
         ,prop-01-13-diagram
         ,prop-01-14-diagram
         ,prop-01-15-diagram
         ,prop-01-16-diagram)))

(define diagram-grid
  (frame #:line-width 4
         (above
          (apply beside (take diagrams 4))
          (apply beside (take (drop diagrams 4) 4))
          (apply beside (take (drop diagrams 8) 4))
          (apply beside (drop diagrams 12)))))

diagram-grid
;(send (pict->bitmap diagram-grid) save-file "diagram-grid3.png" 'png)

;(bitmap "diagram-grid3.png")