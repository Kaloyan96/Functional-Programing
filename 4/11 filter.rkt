#lang racket
(require rackunit rackunit/text-ui)

(define (my-filter targetList condition)
  (cond ((null? targetList) '())
        ((condition (car targetList)) (cons (car targetList) (my-filter (cdr targetList) condition)))
        (else (my-filter (cdr targetList) condition))))
       
(define filter-tests
  (test-suite
    "Tests for filter"

    (check-equal? (my-filter '() even?) '())
    (check-equal? (my-filter '(42) even?) '(42))
    (check-equal? (my-filter '(42) odd?) '())
    (check-equal? (my-filter '(1 2 3 4) (lambda (x) (> x 0))) '(1 2 3 4))
    (check-equal? (my-filter '(1 2 3 4) (lambda (x) (< x 0))) '())
    (check-equal? (my-filter '(1 2 -42 3 4) (lambda (x) (< x 0))) '(-42))
    (check-equal? (my-filter '(8 4 92 82 8 13) even?) '(8 4 92 82 8))
    (check-equal? (my-filter '(8 4 92 82 8 13) odd?) '(13))))

(run-tests filter-tests)