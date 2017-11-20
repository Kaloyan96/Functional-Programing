#lang racket
(require rackunit rackunit/text-ui)

(define (expt x n)
  (cond ((= n 0) 1)
        ((= n 1) x)
        ((= (remainder n 2) 1) (* x (expt x (- n 1))))
        ((= (remainder n 2) 0) (* (expt x (/ n 2)) (expt x (/ n 2))))
        )
  )

(define expt-tests
  (test-suite
   "Tests for expt"

   (check = (expt 2 0) 1)
   (check = (expt 2 1) 2)
   (check = (expt 2 2) 4)
   (check = (expt 3 2) 9)
   (check = (expt 5 3) 125)
   (check = (expt 2 10) 1024)
   (check = (expt -2 10) 1024)
   (check = (expt -2 11) -2048)))

(run-tests expt-tests)