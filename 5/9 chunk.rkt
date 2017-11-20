#lang racket
(require rackunit rackunit/text-ui)

(define (sub-list targetList range)
    (if (or (= range 0) (null? targetList)) '()
        (cons (car targetList)
              (sub-list (cdr targetList)
                        (- range 1)))))

(define (rest targetList range)
    (if (or (= range 0) (null? targetList)) targetList
        (rest (cdr targetList) (- range 1))))

(define (chunk targetList partitionSize)  
  (if (null? targetList) '()
      (cons (sub-list targetList partitionSize)
            (chunk (rest targetList partitionSize)
                   partitionSize))))

(define chunk-tests
  (test-suite
    "Tests for chunk"

    (check-equal? (chunk '() 42) '())
    (check-equal? (chunk '(1 2) 3) '((1 2)))
    (check-equal? (chunk '(1 2 3 4 5 6) 2) '((1 2) (3 4) (5 6)))
    (check-equal? (chunk '(1 2 3 4 5 6) 3) '((1 2 3) (4 5 6)))
    (check-equal? (chunk '(1 2 3 4 5 6 7 8) 3) '((1 2 3) (4 5 6) (7 8)))))

(run-tests chunk-tests)