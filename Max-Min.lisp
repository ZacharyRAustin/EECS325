(in-package :cs325-user)

;(defun max-min (x &key (start 0) (end (length x)) (max nil) (min nil))
;  (cond ((= start end) (values max min))
;        ((and (null max) (null min)) (max-min x :start (1+ start) :end end :max (aref x start) :min (aref x start)))
;        ((> (aref x start) max) (max-min x :start (1+ start) :end end :max (aref x start) :min min))
;        ((< (aref x start) min) (max-min x :start (1+ start) :end end :max max :min (aref x start)))
;        (t (max-min x :start (1+ start) :end end :max max :min min))))

;(defun max-min (x &key (start 0) (end (length x)) (max nil) (min nil))
;  (cond ((= start end) (values max min))
;        (t (let ((val (aref x start))
;                 (pos (1+ start)))
;             (cond ((and (null max) (null min)) (max-min x :start pos :end end :max val :min val))
;                   ((> val max) (max-min x :start pos :end end :max val :min min))
;                   ((< val min) (max-min x :start pos :end end :max max :min val))
;                   (t (max-min x :start pos :end end :max max :min min)))))))


(defun max-min (x &key (start 0) (end (length x)))
  (cond ((>= start end) (values nil nil))
        (t (get-max-min x start end (aref x start) (aref x start)))))


(defun get-max-min (x start end maxv minv)
  (cond ((= start end) (values maxv minv))
        (t (let ((val (aref x start))
                 (pos (1+ start)))
             (get-max-min x pos end (max maxv val) (min minv val))))))
