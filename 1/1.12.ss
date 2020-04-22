;; r -> row
;; c -> column
;;
;;    1
;;    1 1
;;    1 2 1
;;    1 3 3 1
;;    1 4 6 4 1
;;
;; (pascal 0 0) -> 1
;; (pascal 3 2) -> 3

(define (pascal r c)
  (cond ((= r 0) 1)
        ((= c 0) 1)
        ((= r c) 1)
        (else (+ (pascal (- r 1) c)
                 (pascal (- r 1) (- c 1))))))
