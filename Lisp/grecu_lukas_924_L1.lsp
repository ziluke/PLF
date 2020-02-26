;a) Write a function that inserts in a linear list a given atom A after the 2nd, 4th, 6th, ... element.
#|
	addA(l1...ln, A, pos) = {nil, n=0
								l1 U A U addA(l2...ln, A, pos+1), pc%2=0
								l1 U addA(l2...ln, A, pos+1), otherwise
|#
(defun addA (l A pos)
(cond
((null l) nil)
((equal 0 (mod pos 2)) (cons (car l) (cons A (addA (cdr l) A (+ pos 1)))))
(t (cons (car l) (addA (cdr l) A (+ pos 1))))
)
)

(defun main(l A)
(addA l A 1)
)

;b) Write a function to get from a given list the list of all atoms, on any level, but reverse order. 
;Example:(((A B) C) (D E)) ==> (E D C B A)
#|
	concat(l1...ln, r1...rm) = {r, n=0
								l1 U concat(l2..ln, r1..rm), otherwise
								
	revAtom(l1...ln) = {nil, n=0
						concat(revAtom(l2...ln) revAtom(l1)), list(l1)
						concat(revAtom(l2...ln), list(l1)), otherwise
|#
(defun concat (l1 l2)
    (if (null l1) 
        l2
        (cons (car l1) (concat (cdr l1) l2))
    )
)

(defun revAtom (l)
    (cond
        ((null l) nil)
        ((listp (car l)) (concat (revAtom (cdr l)) (revAtom (car l))))
        (T (concat (revAtom (cdr l)) (list (car l))))
    )
)
;c) Write a function that returns the greatest common divisor of all numbers in a nonlinear list.
#|
gcd1(a, b) = {b, a=0
				gcd1(b%a a), otherwise
				
getGCD(l1...ln) ={nil, n=0
					gcd1(getGCD(l1), getGCD(l2...ln)), list(l1)
					gcd1(l1, getGCD(l2..ln)), otherwise
|#
(defun gcd1 (a b)
(cond
	((= a 0) b)
	(t (gcd1 (mod b a) a))
)
)


(defun getGCD (li)
(cond
	((null li) 0)
	((listp (car li)) (gcd1 (getGCD (car li)) (getGCD (cdr li))))
	(t (gcd1 (car li) (getGCD (cdr li))))
)
)

;d) Write a function that determines the number of occurrences of a given atom in a nonlinear list.
#|
nrOcc(l1...ln, e) = {nil, n=0
					nrOcc(l1,e)+nrOcc(l2..ln, e), list(l1)
					1+nrOcc(l2..ln,e), l1==e
					nrOcc(l2..ln, e)
|#

(defun nrOcc (l e)
(cond
	((null l) 0)
	((listp (car l)) (+ (nrOcc (car l) e) (nrOcc (cdr l) e)))
	((equal (car l) e) (+ 1 (nrOcc (cdr l) e)))
	(t (nrOcc (cdr l) e))
)
)