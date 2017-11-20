#lang racket

(require rackunit rackunit/text-ui)

;(define (reverse-digits number)
;  (if (< number 10)
;    number
;    (+ (remainder number 10)
;       (* (reverse-digits (quotient number 10)) 10))
;  )
;)

;You said it... Let's fly the to the moon.

(define (reverse-digits number)
  (define (aux number power)
    (if (< number 10)
      number
      (+ (* (remainder number 10)
            power)
         (aux (quotient number 10) (/ power 10)))
    )
  )
  (define (count-power number)
    (if (< number 10)
      1
      (* (count-power (quotient number 10)) 10)
    )
  )
  (aux number (count-power number))
)

;!!!YOU GOT FUCKED!!!

(define reverse-digits-tests
  (test-suite
   "Tests for reverse-digits"

   (check = (reverse-digits 3) 3)
   (check = (reverse-digits 12) 21)
   (check = (reverse-digits 42) 24)
   (check = (reverse-digits 666) 666)
   (check = (reverse-digits 1337) 7331)
   (check = (reverse-digits 65510) 1556)
   (check = (reverse-digits 1234567) 7654321)
   (check = (reverse-digits 8833443388) 8833443388)
   (check = (reverse-digits 100000000000) 1)))

(run-tests reverse-digits-tests)