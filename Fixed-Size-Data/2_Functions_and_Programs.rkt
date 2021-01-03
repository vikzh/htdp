;2.1 Functions
(require 2htdp/image)

;11
(define (distance x y)
  (sqrt (+ (sqr x) (sqr y))))

;12
(define (cvolume side)
       (* side side side))

;13
(define (string-first string)
  (if (= (string-length string) 0)
      "string is empty"
      (substring string 0 1)))

;14
(define (string-last string)
  (if (= (string-length string) 0)
      "string is empty"
      (substring string (sub1 (string-length string)))))

;15
(define sunny #false)
(define friday #true)
(define (==> a b)
  (or (not a) b))

(==> sunny friday)


;2.3 Composing Functions
(define standardticketprice 5)
(define averageattendance 120)
(define changeinticketprice .10)
(define changeinaverageattendance 15)
(define variablecostperattendee 1.50)

(define (attendees ticket-price)
  (- averageattendance (* (- ticket-price standardticketprice) (/ changeinaverageattendance changeinticketprice))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* variablecostperattendee (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
