;; For very small numbers, the test fails because the difference between guesses
;; can be "relatively big" while still falling within the 0.001 tolerance. For
;; example, it becomes impossible to calculate the square root of 0.0004 (which
;; is a the perfect square of 0.02) because our "best" guess, 0.0354..., has a
;; square of 0.00125... which is within 0.001 of the right answer, even though
;; it's a very bad approximation for it.

;; For very large numbers, since we have limited precision, the computer can no
;; longer tell the difference between two numbers when there true difference is
;; small. (This is specific to floating-point numbers.) We can see the effect of
;; this by evaluating (= 123456789123456789.0 123456789123456788.0), which
;; Scheme tells us is true, even though we know it's false. This means we will
;; fail to detect the difference between the square of a bad guess and the true
;; value we're checking against long before we're within the 0.001 tolerance. We
;; can see this in action by trying to take the square root of
;; 15241578750190521, which should be 123456789, but which our procedure reports
;; as 39040464.523...



(define (sqrt-iter last-guess guess x)
  (if (good-enough? last-guess guess)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (good-enough? last-guess guess)
  (< (/ (abs (- last-guess guess))
        guess)
     0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x x))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))
