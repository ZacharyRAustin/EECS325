(in-package :cs325-user)

(defclass sphere (surface)
  ((radius :accessor sp-radius
           :initform 0
           :initarg radius)
   (center :accessor sp-center
           :initarg center
           :initform (make-instance point 'x 0 'y 0 'z 0))))

(defclass point ()
  ((x :accessor px
      :initform 0
      :initarg x)
   (y :accessor py
      :initform 0
      :initarg y)
   (z :accessor pz
      :initform 0
      :initarg z)))

(defclass surface ()
  ((color :accessor s-color
          :initarg color)))

(defun defsphere (x y z r c)
  (let ((s (make-instance 'sphere 
                          'radius r 
                          'color c
                          'center (make-instance 'point 'x x 'y y 'z z))))
    (push s *world*)
    s))

(defmethod intersect ((s sphere) (pnt point) xr yr zr)
  (let* ((c (sp-center s))
         (n (minroot (+ (sq xr) (sq yr) (sq zr))
                     (* 2 (+ (* (- (px pnt) (px c)) xr)
                             (* (- (py pnt) (py c)) yr)
                             (* (- (pz pnt) (pz c)) zr)))
                     (+ (sq (- (px pnt) (px c)))
                        (sq (- (py pnt) (py c)))
                        (sq (- (pz pnt) (pz c)))
                        (- (sq (sp-radius s)))))))
    (when n
        (make-instance 'point 
                       'x (+ (px pnt) (* n xr))
                       'y (+ (py pnt) (* n yr))
                       'z (+ (pz pnt) (* n zr))))))

(defmethod normal ((s sphere) (pnt point))
  (let ((c (sp-center s)))
    (unit-vector (- (px c) (px pnt))
                 (- (py c) (py pnt))
                 (- (pz c) (pz pnt)))))


(defun sq (x)
  (* x x))

(defun mag (x y z)
  (sqrt (+ (sq x) (sq y) (sq z))))

(defun unit-vector (x y z)
  (let ((d (mag x y z)))
    (values (/ x d) (/ y d) (/ z d))))

(defun minroot (a b c)
  (if (zerop a)
      (/ (- c) b)
    (let ((disc (- (sq b) (* 4 a c))))
      (unless (minusp disc)
        (let ((discrt (sqrt disc)))
          (min (/ (+ (- b) discrt) (* 2 a))
               (/ (- (- b) discrt) (* 2 a))))))))