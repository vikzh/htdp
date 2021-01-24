;50
; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

;51
(require 2htdp/image)
(require 2htdp/universe)

(define (tock cw)
  (traffic-light-next cw))

; TrafficLight -> Image
(check-expect (render "green") (circle 30 "solid" "green"))
(define (render current-light)
  (circle 30 "solid" current-light))

; TrafficLight -> TrafficLight
(define (main init-color)
  (big-bang init-color
    [on-tick tock 3]
    [to-draw render]))

(main "red")
