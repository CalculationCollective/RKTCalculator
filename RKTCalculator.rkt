#lang racket

(define (ensure-float num)
  (if (integer? num)
      (exact->inexact num)
      num))

(define (parse-number str)
  (let ((num (string->number str)))
    (if num
        num
        (error "Invalid number"))))

(define (main)
  (display "Enter the first number: ")
  (define num1-string (read-line))
  (define num1 (ensure-float (parse-number num1-string)))
  
  (display "Choose between:\n1) Addition\n2) Subtraction\n3) Multiplication\n4) Division\n: ")
  (define calculation-type (string->number (read-line)))
  
  (display "Enter the second number: ")
  (define num2-string (read-line))
  (define num2 (ensure-float (parse-number num2-string)))
  
  (define result
    (case calculation-type
      [(1) (+ num1 num2)]
      [(2) (- num1 num2)]
      [(3) (* num1 num2)]
      [(4) (/ num1 num2)]
      [else (error "Invalid calculation type.")]))
  
  (printf "The result is: ~v\n" result))

(main)
