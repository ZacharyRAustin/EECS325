(in-package :ddr-tests)

(defparameter *all-different-kb*
  '(
    (-> (different ?x ?y) (different ?y ?x))
    (-> (ad (cons ?x (cons ?y nil))) (different ?x ?y))
    (-> (ad (cons ?x (cons ?y ?l))) (different ?x ?y) 
                                               (ad ?x ?l) 
                                               (ad ?y ?l))))
