#lang racket
(require rackunit rackunit/text-ui)

(define (remove targetList targetNumber)
  (define (aux listInUse encounterCounter returnList)
    (cond ((null? listInUse) returnList)
          ((and (= (car listInUse) targetNumber)
                (= encounterCounter 0)) (aux (cdr listInUse)
                                             (+ encounterCounter 1)
                                             returnList))
          (else (aux (cdr listInUse)
                     encounterCounter
                     (cons (car listInUse) returnList)))))

  (define (reverse l)
    (define (iter result l)
      (if (null? l)
          result
          (iter (cons (car l) result) (cdr l))))

    (iter '() l))

  (reverse (aux targetList 0 '())))

(define remove-tests
  (test-suite
    "Tests for remove"

    (check-equal? (remove '(42) 42) '())
    (check-equal? (remove '(5 3 5 5) 5) '(3 5 5))
    (check-equal? (remove '(8 4 92 82 8 13) 82) '(8 4 92 8 13))
    (check-equal? (remove '(8 4 82 12 31 133) 133) '(8 4 82 12 31))))

(run-tests remove-tests)