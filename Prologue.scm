(require 2htdp/image)
(require 2htdp/universe)

; constants 
(define WIDTH 200)
(define HEIGHT 100)
(define V 2)
(define X 50)
(define X-COORDINATE (/ WIDTH 2))
(define WIDTH-BED-OF-ROCKS (* WIDTH 2))
(define HEIGHT-BED-OF-ROCKS 10)

(define MTSCN
  (place-image
   (rectangle WIDTH-BED-OF-ROCKS HEIGHT-BED-OF-ROCKS "solid" "brown") 0 HEIGHT
   (empty-scene WIDTH HEIGHT "blue")))

(define UFO (overlay (circle 10 "solid" "red") 
  (rectangle 40 4 "solid" "yellow")))

(define UFO-CENTER-TO-TOP (- HEIGHT (/ (image-height UFO) 2)+10))

; functions
(define (picture-of-ufo t)
  (cond
    [(<= (distance t) UFO-CENTER-TO-TOP)
     (place-image UFO X-COORDINATE (distance t) MTSCN)]
    [(> (distance t) UFO-CENTER-TO-TOP)
     (place-image UFO X-COORDINATE UFO-CENTER-TO-TOP MTSCN)]))

(define (distance t)
  (* V t))

(animate picture-of-ufo)