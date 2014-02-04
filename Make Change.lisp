(in-package :cs325-user)

(defun make-change (x &optional (lst '(25 10 5 1)))
  (cond ((null x) (values 0 0 0 0))
        (t (values-list (choose-coins x lst)))))

(defun choose-coins (x lst)
  (cond ((null x) nil)
        ((null lst) nil)
        (t (multiple-value-bind (amnt remain)
               (floor x (car lst))
             (cons amnt (choose-coins remain (cdr lst)))))))