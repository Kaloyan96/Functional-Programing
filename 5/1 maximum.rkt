#lang racket
(require rackunit rackunit/text-ui)

(define (maximum targetList)
  (define (biggest num1 num2)
    (if (> num1 num2) num1 num2))
  
  (define (aux listInUse currentMax)
    (if (null? listInUse)
        currentMax
        (aux (cdr listInUse) (biggest currentMax (car listInUse)))))

  (aux targetList (car targetList)))

(define maximum-tests
  (test-suite
    "Tests for maximum"

    (check = (maximum '(2)) 2)
    (check = (maximum '(5 3 5 5)) 5)
    (check = (maximum '(8 4 92 82 8 13)) 92)
    (check = (maximum '(8 4 82 12 31 133)) 133)))

(run-tests maximum-tests)