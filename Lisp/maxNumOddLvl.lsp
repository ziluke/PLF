
(defun checkSub (L Lvl M)
(cond
	((null L)
		(if (and (oddp Lvl) (oddp M))
			0
		1
		)
	)
	((numberp (car L)) 
		(if (> (car L) M)
			(checkSub (cdr L) Lvl (car L))
		(checkSub (cdr L) Lvl M)
		)
	)
	((listp (car L)) 
		(if (equal (checkSub (car L) (+ Lvl 1) 1) 0)
			0
		(checkSub (cdr L) Lvl M)
		)
	)
	(t (checkSub (cdr L) Lvl M))
)
)

(defun check (L)
	(if (and (listp L) (equal (checkSub L 1 -1) 1)) (write L))
(cond
	((listp L) (checkSub L 1 -1))
	(t 0)
)
)

(defun nrSub (L)
(cond
	((listp L) (apply #'+(mapcar #'(lambda(a)(+ (check a) (nrSub a))) L)))
	(t 0)
)
)



(write (nrSub '(A (B 2) (2 C 4) (1 (3 F)) (((G) 4 7) 2))))