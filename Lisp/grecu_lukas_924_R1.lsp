#|
R1: Să se șteargă dintr-o listă neliniară toate sublistele (liniare) care au număr par de elemente.
|#

#|
check(l1..ln)={nil, n=0
				true, list(l1)
				check(l2..ln), otherwise

|#
(defun check(L)
(cond
	((null L) nil)
	((listp (car L)) t)
	(t (check (cdr L)))
)
)


#|
sterg(l1..ln)={nil, n=0
				l1 U sterg(l2..ln), atom(l1)
				sterg(l2..ln), list(l1) and length(l1)%2==0 and !check(l1)
				sterg(l1) U sterg(l2..ln), otherwise
|#
(defun sterg (L)
(cond 
	((null L) nil)
	((atom (car L)) (cons (car L) (sterg (cdr L))))
	((listp (car L)) (if (and (evenp (length (car L))) (not (check(car L)))) (sterg (cdr L)) (cons (sterg (car L)) (sterg (cdr L)))))
)
)

;(șterg '((2 3 4) (6 (7 8) ((7 9) 8)) (6 8) 9))