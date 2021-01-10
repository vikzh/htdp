;; 3.2 Finger Exercises: Functions

;34
; String -> String
; extracts the first character from a non empty string
; given: "Hello World", expect: "H"
(define (string-first string)
  (substring string 0 1))

;35
; String -> String
; extracts the last character from a non empty string
; given: "Hello World", expect: "d"
(define (string-last string)
  (substring string (- (string-length string) 1)))

;36
; Image -> Number
; counts number of pixels in a given Image
; given: (rectangle 10 10 "solid" "black"), expect: 100
(define (image-area image)
  (* (image-width image) (image-height image)))

;37
; String -> String
; removes the first character from a string
; given: "Hello World", expect: "ello World"
(define (string-rest string)
  (substring string 1))

;38
; String -> String
; removes the last character from a string
; given: "Hello World", expect: "Hello Worl"
(define (string-remove-last string)
  (substring string 0 (- (string-length string) 1)))


;39
(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))  

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle WHEEL-DISTANCE (/ WHEEL-RADIUS 8) "solid" "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CHASSIS
  (above
   (rectangle (* WHEEL-DISTANCE 2) WHEEL-RADIUS "solid" "red")
   (rectangle (* WHEEL-DISTANCE 4) (* WHEEL-RADIUS 2) "solid" "red")))

(overlay/align/offset "middle" "bottom"
  BOTH-WHEELS
   0 (* WHEEL-RADIUS -1)
   CHASSIS)

;40
; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples:
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

(define (tock cw)


;41-44
(define CAR
  (overlay/align/offset "middle" "bottom"
  BOTH-WHEELS
   0 (* WHEEL-RADIUS -1)
   CHASSIS))

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define BACKGROUND (overlay tree (empty-scene 200 100)))
(define Y-CAR 50)

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(define (render cw)
  (place-image CAR cw Y-CAR BACKGROUND))

(check-expect (last-pixel? 100) #false)
(check-expect (last-pixel? 250) #true)
(define (last-pixel? cw)
  (< (image-width BACKGROUND) cw))

(define (hyper x-position-of-car x-mouse y-mouse  me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

(define (main n)
  (big-bang n
    [on-tick tock]
    [to-draw render]
    [stop-when last-pixel?]
    [on-mouse hyper]))

;45-46
(define cat1 .)
(define cat2 .)
(define WORLD-WIDTH 300)
(define WORLD-HEIGHT 300)
(define BACKGROUND (empty-scene WORLD-WIDTH WORLD-HEIGHT))

(define (render x-cor)
  (cond
    [(odd? x-cor) (place-image cat1 x-cor (/ WORLD-HEIGHT 2) BACKGROUND)]
    [else (place-image cat2 x-cor (/ WORLD-HEIGHT 2) BACKGROUND)]))

(define (tock cw)
  (+ cw 3))

(define (main n)
  (big-bang n
    [on-tick tock]
    [to-draw render]))
