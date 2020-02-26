(defun minL(L)
(cond
    ((and (null (cdr L)) (not(numberp (car L)))) 32000)
    ((numberp (car L)) (min (car L) (minL (cdr L))))
    (t (minL (cdr L)))
)
)

(defun maxL(L)
(cond
    ((and (null (cdr L)) (not(numberp (car L))))-1)
    ((numberp (car L)) (max (car L) (maxL (cdr L))))
    (t (maxL (cdr L)))
)
)

(defun foo (l k)
(cond
	((atom l) nil)
	((oddp k) (cons (minL l) (mapcan #'(lambda(x)(foo x (+ k 1))) l)))
	((evenp k) (cons (maxL l) (mapcan #'(lambda(x)(foo x (+ k 1))) l)))
	;(t (mapcar #'(lambda(x)(foo x (+ 1 k))) l))
)
)

;(A B 12 (5 D (A F (10 B) D (5 F) 1)) C 9 (F 4 (D) 9 (F (H 7) K) (P 4)))