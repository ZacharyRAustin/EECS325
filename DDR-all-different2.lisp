(in-package :ddr-tests)

(defparameter *all-different-kb*
  '(
    (-> (different ?x ?y) (different ?y ?x))
    (-> (all-different (cons ?x (cons ?y nil))) (different ?x ?y))
    (-> (all-different (cons ?x (cons ?y ?l))) (different ?x ?y)
                                               (all-different ?x ?l)
                                               (all-different ?y ?l))))
