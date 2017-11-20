#lang racket
(require rackunit rackunit/text-ui)

(define (accumulate combiner null-value term a next b)
  (define (iter acc a)
    (if (> a b)
        acc
        (iter (combiner (term a) acc) (next a))))

  (iter null-value a))

(define (inc x) (+ x 1))

(define (count predicate a b)
  (accumulate + 0
              (lambda (x) (if (predicate x) 1 0))
              a inc b))

(define (reverse-number targetNumber)
  (define (appendDigit targetNumber targetDigit)
    (+ (* targetNumber 10) targetDigit))

  (define (getLastDigit targetNumber)
    (remainder targetNumber 10))

  (define (removeLastDigit targetNumber)
    (quotient targetNumber 10))

  (define (reverser reversedNumber targetNumber)
    (if (= targetNumber 0)
        reversedNumber
        (reverser (appendDigit reversedNumber
                               (getLastDigit targetNumber))
                  (removeLastDigit targetNumber))))

  (reverser 0 targetNumber))

(define (is-palindrome x)
  (= (reverse-number x) x))

(define (count-palindromes start end)
  (count is-palindrome start end))

(define count-palindromes-tests
  (test-suite
    "Tests for count-palindromes"

    (check = (count-palindromes 1 5) 5)
    (check = (count-palindromes 0 10) 10)
    (check = (count-palindromes 11 100) 9)
    (check = (count-palindromes 101 1000) 90)))

(run-tests count-palindromes-tests)


  
