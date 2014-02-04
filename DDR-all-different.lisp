(in-package :ddr-tests)

(defparameter *all-different-kb* 
  '( (-> (different ?x ?y) (different ?y ?x)) 
     (-> (all-different (cons ?x ?l)) (differ ?x ?l)) 
     (-> (differ ?x (cons ?a ?l)) (different ?x ?a) 
                                  (all-different (cons ?x ?l)) 
                                  (all-different (cons ?a ?l)))

))