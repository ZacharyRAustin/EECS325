(in-package :cs325-user)

(defun delete-car (lst)
  (cond ((atom (cdr lst)) (cdr lst))
        (t (setf (first lst) (second lst) (cdr lst) (cddr lst)) lst)))