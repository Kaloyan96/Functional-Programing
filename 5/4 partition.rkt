#lang racket
(require rackunit rackunit/text-ui)

(define (partition predicate targetList)
  (define (invalids listInUse)
    (cond ((null? listInUse) '())
          ((not (predicate (car listInUse))) (cons (car listInUse) (invalids (cdr listInUse))))
          (else (invalids (cdr listInUse)))))

  (define (valids listInUse)
    (cond ((null? listInUse) '())
          ((predicate (car listInUse)) (cons (car listInUse) (valids (cdr listInUse))))
          (else (valids (cdr listInUse)))))

  (define (combine)
    (cons (valids targetList) (cons (invalids targetList) '())))

  (combine))
  
        

(define partition-tests
  (test-suite
    "Tests for partition"

    (check-equal? (partition even? '(1 2 3 4 5 6 7)) '((2 4 6) (1 3 5 7)))
    (check-equal? (partition odd? '(1 3 3 7 42)) '((1 3 3 7) (42)))
    (check-equal? (partition odd? '(3)) '((3) ()))
    (check-equal? (partition even? '()) '(() ()))
    (check-equal? (partition (lambda (x) (< x 4)) '(1 2 3 4 5 6 7))
                  '((1 2 3) (4 5 6 7)))))

(run-tests partition-tests)