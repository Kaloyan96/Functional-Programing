#lang racket
(require rackunit rackunit/text-ui)

(define (accumulate combiner null-value term a next b)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (combiner (term a) acc) (next a))))

  (iter null-value a))

(define (inc x) (+ x 1))

(define (exists? predicate start end)
  (accumulate (lambda (x y) (or x y))
              #f
              predicate start inc end))
              
(define exists?-tests
  (test-suite
    "Tests for exists?"

    (check-true (exists? (lambda (x) (= x 3)) 1 5))
    (check-true (exists? (lambda (x) (< x 0)) -3 9))
    (check-true (exists? (lambda (x) (= 0 (* x 0))) -3 15))

    (check-false (exists? (lambda (x) (= x 13)) 1 5))
    (check-false (exists? (lambda (x) (< x 3)) 10 42))
    (check-false (exists? (lambda (x) (< x 0)) 3 8))
    (check-false (exists? (lambda (x) (= 0 (* x 0))) 2 1))))

(run-tests exists?-tests)