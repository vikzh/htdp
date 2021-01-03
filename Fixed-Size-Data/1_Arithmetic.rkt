(require 2htdp/image)
(require 2htdp/universe)

;1
(define x 3)
(define y 4)
(define (distance x y)
  (sqrt (+ (sqr x) (sqr y))))
(distance x y)

;2
(define prefix "hello")
(define suffix "world")
(string-append prefix "_" suffix)

;3
(define str "helloworld")
(define i 5)

(string-append (substring str 0 i) "_" (substring str i))

;4
(string-append (substring str 0 i) (substring str (+ i 1)))

;5
(define map-size 100)
(define grass (rectangle map-size (/ map-size 10) "solid" "green"))
(define stick (rectangle (/ map-size 10) map-size "solid" "brown"))

(define my-map (empty-scene map-size map-size))

(scene+line (overlay/align "middle" "middle"
               stick
               (overlay/align "left" "bottom"
                              grass
                              my-map))0 (/ map-size 2) (/ map-size 2) 0 "green")

;6
(define cat .)
(* (image-width cat) (image-height cat))

;7
(define sunny #true)

(define friday #false)

(or (not sunny) friday)

;8
(if (> (image-height cat) (image-width cat))
      "tall"
      (if (< (image-height cat) (image-width cat))
          "wide"
          (if (= (image-height cat) (image-width cat))
              "equal"
              "error")))

;9
(define (in-test in)
  (cond
    [(string? in) (string-length in)]
    [(image? in) (* (image-width in) (image-height in))]
    [(number? in) (if (<= in 0) in (+ in 1))]
    [(boolean? in) (if in 10 20)]))


