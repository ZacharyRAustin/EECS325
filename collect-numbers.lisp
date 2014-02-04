(in-package :cs325-user)

(defun collect-numbers (lst)
  (cond ((numberp lst) (list lst))
        ((consp lst) (mapcan 'collect-numbers lst))
        (t nil)))
