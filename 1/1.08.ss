(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cbrt-iter x y y_)
  (if (good-guess? y y_)
      y
      (cbrt-iter x (improve x y) y)))

(define (good-guess? y y_)
  (< (/ (abs (- y y_))
        y)
     0.001))

(define (improve x y)
  (/ (+ (/ x
           (square y))
        (* 2 y))
     3))

(define (cbrt x)
  (cbrt-iter x 1.0 x))
