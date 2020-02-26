;2.) Write a function that returns the sum of numeric atoms in a list, at any level.
; sum(l)={l, l=nr
		; 0, l=atom
		; Sigma,i=1,k,(sum(li)), otherwise

(defun sum(L)
(cond
	((numberp L) L)
	((atom L) 0)
	(T (apply #'+ (mapcar #'sum L)))
)
)