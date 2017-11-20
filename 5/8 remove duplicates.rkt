#lang racket
(require rackunit rackunit/text-ui)

(define (remove-target-duplicates targetList targetNumber)
  (cond ((null? targetList) '())
        ((= (car targetList) targetNumber) (remove-target-duplicates (cdr targetList) targetNumber))
        (else (cons (car targetList) (remove-target-duplicates (cdr targetList) targetNumber)))))

(define (remove-duplicates targetList)
  (if (null? targetList) '()
      (cons (car targetList) (remove-duplicates (remove-target-duplicates (cdr targetList) (car targetList))))))

(define remove-duplicates-tests
  (test-suite
    "Tests for remove-duplicates"

    (check-equal? (remove-duplicates '(42)) '(42))
    (check-equal? (remove-duplicates '(6 6 6)) '(6))
    (check-equal? (remove-duplicates '(1 2 3 4 5 6)) '(1 2 3 4 5 6))
    (check-equal? (remove-duplicates '(4 3 3 2 5 2)) '(4 3 2 5))
    (check-equal? (remove-duplicates '(10 10 8 2 2 2 9 9)) '(10 8 2 9))))

(run-tests remove-duplicates-tests)