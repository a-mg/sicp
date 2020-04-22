(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

(define (f-iter n)
  (define (f-calc f_n-1 f_n-2 f_n-3 n)
    (if (= n 0)
        f_n-1
        (f-calc (+ f_n-1
                   (* 2 f_n-2)
                   (* 3 f_n-3))
                f_n-1
                f_n-2
                (- n 1))))
  (f-calc 2 1 0 n))
