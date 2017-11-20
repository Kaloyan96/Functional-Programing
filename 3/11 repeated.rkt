#lang racket
(require rackunit rackunit/text-ui)

(define (accumulate combiner null-value term a next b)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (combiner (term a) acc) (next a))))

  (iter null-value a))

(define (compose func1 func2)
  (lambda (x)
    (func1 (func2 x))))

(define (repeated function repetitions)
  (if (zero? repetitions)
      (lambda (x) x)
      (compose function (repeated function (- repetitions 1)))))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (square x) (* x x))

(define repeated-tests
  (test-suite
    "Tests for repeated"

    (check = ((repeated identity 0) 0) 0)
    (check = ((repeated identity 5) 1) 1)

    (check = ((repeated inc 0) 5) 5)
    (check = ((repeated inc 5) 0) 5)
    (check = ((repeated inc 5) 5) 10)

    (check = ((repeated square 0) 5) 5)
    (check = ((repeated square 1) 5) 25)
    (check = ((repeated square 2) 5) 625)))

(run-tests repeated-tests)