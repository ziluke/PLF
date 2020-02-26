#|
Delete all occurences of an element in a non-linear list
|#

(defun delOcc(L E)
(cond
	((null L) nil)
	((listp (car L))(cons (delOcc (car L) E) (delOcc (cdr L) E)))
	((equal (car L) E) (delOcc (cdr L) E))
    (t (cons (car L) (delOcc (cdr L) E)))
)
)