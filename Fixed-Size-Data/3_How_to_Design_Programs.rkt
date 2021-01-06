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
