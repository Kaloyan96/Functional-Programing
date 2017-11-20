#lang racket
(require rackunit rackunit/text-ui)

(define (map-deep targetFunction targetList)
  (cond ((null? targetList) '())
        ((list? (car targetList)) (cons (map-deep targetFunction (car targetList)) (map-deep targetFunction (cdr targetList))))
        (else (cons (targetFunction (car targetList)) (map-deep targetFunction (cdr targetList))))))

(define (square x) (* x x))
(define (cube x) (* x x x))

(define map-deep-tests
  (test-suite
    "Tests for map-deep"

    (check-equal? (map-deep cube '()) '())
    (check-equal? (map-deep square '((1 2 (3 4)) 5)) '((1 4 (9 16)) 25))
    (check-equal? (map-deep square '((((2)) 1 ((4) 3)) (9)))
                  '((((4)) 1 ((16) 9)) (81)))
    (check-equal? (map-deep cube '(3 2 ((3) 4))) '(27 8 ((27) 64)))))

(run-tests map-deep-tests)