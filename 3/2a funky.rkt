#lang racket
(require rackunit rackunit/text-ui)

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define f-tests
  (test-suite
   "Tests for f"

   (check = (f 0) 0)
   (check = (f 1) 1)
   (check = (f 2) 2)
   (check = (f 3) 4)
   (check = (f 4) 11)
   (check = (f 5) 25)
   (check = (f 6) 59)
   (check = (f 7) 142)))

(run-tests f-tests)