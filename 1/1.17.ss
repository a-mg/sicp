(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (* a b)
  (cond ((= b 0) 1)
        ((even? b) (double (* a (halve b))))
        (else (+ b (* a (- b 1))))))
