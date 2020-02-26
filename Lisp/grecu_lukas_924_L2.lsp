;12)Determine the list of nodes in preorder in a tree of type (2)

#|
left_subtree(l1..ln)={nil, n-0
                      nil, !list(l1..ln)
                      l2, otherwise
|#
(defun left-subtree(tree)
    (cond 
         ((null tree) NIL)
         ((not (listp tree)) NIL)
         (t (car (cdr tree)))
    )
)

#|
right_subtree(l1..ln) = {nil, n=0
                         nil, !list(l1...ln)
                         l3, otherwise

|#
(defun right-subtree(tree)
    (cond 
         ((null tree) NIL)
         ((not (listp tree)) NIL)
         (t (car (cdr (cdr tree))))
    )
)

#|
preorder(l1..ln)={nil, n=0
                  l1 U preorder(left_subtree(l1..ln)) U preorder(right_subtree(l1...ln)), otherwise
|#
(defun preorder(tree)
    (if 
        (null tree) NIL
           (cons (car tree) (append (preorder (left-subtree tree))(preorder (right-subtree tree))))
    )
)
