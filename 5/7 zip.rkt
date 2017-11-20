#lang racket
(require rackunit rackunit/text-ui)

(define (zip targetPair)
  (define (aux alpha bravo)
    (if (or (null? alpha) (null? bravo)) '()
        (cons (cons (car alpha) (cons (car bravo) '())) (aux (cdr alpha) (cdr bravo)))))

  (aux (car targetPair) (car (cdr targetPair))))



(define zip-tests
  (test-suite
    "Tests for zip"

    (check-equal? (zip '(() (6 6 6))) '())
    (check-equal? (zip '((1 1 1) (2 2))) '((1 2) (1 2)))
    (check-equal? (zip '((1 3 5) (2 4 6))) '((1 2) (3 4) (5 6)))
    (check-equal? (zip '((1 3 5 7 9) (2 4 6))) '((1 2) (3 4) (5 6)))))

(run-tests zip-tests)