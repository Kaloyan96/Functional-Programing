#lang racket
(define (matrix1) '((1 2 3) (4 5 6)))
(define (matrix2) '((1 2 3) (4 5 6) (7 8 9)))

(define (dimensions targetMatrix)
  (cons (length targetMatrix) (length (car targetMatrix))))

(define (reverse-list targetList)
  (define (aux listInUse returnList)
    (if (null? listInUse) returnList
        (aux (cdr listInUse)
             (cons (car listInUse) returnList))))

  (aux targetList '()))

(define (nth-element targetList targetElement)
  (if (= targetElement 1) (car targetList)
      (nth-element (cdr targetList) (- targetElement 1))))

(define (nth-column targetMatrix targetColumn)
  (if (null? targetMatrix) '()
      (cons (nth-element (car targetMatrix) targetColumn)
            (nth-column (cdr targetMatrix)
                        targetColumn))))
  
(define (reverse-rows targetMatrix)
  (if (null? targetMatrix) '()
      (cons (reverse-list (car targetMatrix))
            (reverse-rows (cdr targetMatrix)))))

(define (remove-first-column targetMatrix)
  (if (null? targetMatrix) '()
      (cons (cdr (car targetMatrix)) (remove-first-column (cdr targetMatrix)))))

(define (main-diagonal targetMatrix)
  (define (aux listInUse returnList )))
                                             
