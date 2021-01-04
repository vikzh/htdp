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

;Programs
;31-31
(require 2htdp/batch-io)

(define (letter fst lst signature-name)
  (string-append
    (opening fst)
    "\n\n"
    (body fst lst)
    "\n\n"
    (closing signature-name)))
 
(define (opening fst)
  (string-append "Dear " fst ","))
 
(define (body fst lst)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))
 
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

(define (main out)
  (write-file out
              (letter (read-file 'stdin)
                      (read-file 'stdin)
                      (read-file 'stdin))))


;world state
(require 2htdp/universe)

(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))
 
(define (main y)
  (big-bang y
    [on-tick sub1]
    [stop-when zero?]
    [to-draw place-dot-at]
    [on-key stop]))
 
(define (place-dot-at y)
  (place-image DOT 50 y BACKGROUND))
 
(define (stop y ke)
  0)
