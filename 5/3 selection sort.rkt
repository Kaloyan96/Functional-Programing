#lang racket
(require rackunit rackunit/text-ui)

(define (reverse l)
  (define (iter result l)
    (if (null? l)
        result
        (iter (cons (car l) result) (cdr l))))

  (iter '() l))

(define (biggest num1 num2)
    (if (> num1 num2) num1 num2))

(define (smallest num1 num2)
    (if (> num2 num1) num1 num2))

(define (maximum targetList)
  (define (aux listInUse currentMax)
    (if (null? listInUse)
        currentMax
        (aux (cdr listInUse) (biggest currentMax (car listInUse)))))

  (aux targetList (car targetList)))

(define (minimum targetList)
  (define (aux listInUse currentMax)
    (if (null? listInUse)
        currentMax
        (aux (cdr listInUse) (smallest currentMax (car listInUse)))))

  (aux targetList (car targetList)))

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

  (aux targetList 0 '()))

(define (selection-sort targetList)
  (define (aux listInUse returnList)
    (if (null? listInUse)
        returnList
        (aux (remove listInUse (maximum listInUse))
             (cons (maximum listInUse) returnList))))

    (aux targetList '()))             

(define selection-sort-tests
  (test-suite
    "Tests for selection-sort"

    (check-equal? (selection-sort '(42)) '(42))
    (check-equal? (selection-sort '(6 6 6)) '(6 6 6))
    (check-equal? (selection-sort '(1 2 3 4 5 6)) '(1 2 3 4 5 6))
    (check-equal? (selection-sort '(6 5 4 3 2 1)) '(1 2 3 4 5 6))
    (check-equal? (selection-sort '(3 1 4 6 2 5)) '(1 2 3 4 5 6))
    (check-equal? (selection-sort '(5 2 5 1 5 2 3)) '(1 2 2 3 5 5 5))))

(run-tests selection-sort-tests)