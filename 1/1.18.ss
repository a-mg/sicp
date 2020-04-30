(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (*-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (*-iter (double a) (halve b) c))
        (else (*-iter a (- b 1) (+ a c)))))

(define (* a b)
  (*-iter a b 0))
