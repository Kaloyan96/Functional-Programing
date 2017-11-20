#lang racket

(require rackunit rackunit/text-ui)

(define (expt-iter base power)
  (define (aux accumulator counter)
    (if (= counter power)
      accumulator
      (aux (* accumulator base)
           (+ counter 1)
      )
    )
  )
  (aux 1 0)
)

(define expt-iter-tests
  (test-suite
   "Tests for expt-iter"

   (check = (expt-iter 2 0) 1)
   (check = (expt-iter 2 1) 2)
   (check = (expt-iter 2 2) 4)
   (check = (expt-iter 3 2) 9)
   (check = (expt-iter 5 3) 125)
   (check = (expt-iter 2 10) 1024)
   (check = (expt-iter -2 10) 1024)
   (check = (expt-iter -2 11) -2048)))

(run-tests expt-iter-tests)