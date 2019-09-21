#|
 This file is a part of Alloy
 (c) 2019 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.alloy.renderers.simple.presentations)

;; TODO: Pallettes

(defclass default-look-and-feel (renderer)
  ())

(define-style (default-look-and-feel renderable)
  (:background
   :fill-color (simple:color 0.15 0.15 0.15))
  (:border
   :fill-color (case (alloy:focus)
                 ((:weak :strong) (simple:color 0.9 0.9 0.9))
                 (T (simple:color 0 0 0 0)))
   :z-index -1)
  (:label
   :fill-color (case (alloy:focus)
                 ((:weak :strong) (simple:color 0 0 0))
                 (T (simple:color 1 1 1)))))

(define-realisation (default-look-and-feel alloy:label)
  ((:label text)
   :text (alloy:data alloy:renderable)
   :extent (alloy:margins)))

(define-realisation (default-look-and-feel alloy:button)
  ((:background filled-box)
   :extent (alloy:margins))
  ((:border outlined-box)
   :extent (alloy:margins :l -3 :u -3 :r -3 :b -3))
  ((:icon icon :when (typep (alloy:data alloy:renderable) 'simple:image))
   :image (simple:request-image alloy:renderer (alloy:data alloy:renderable))
   :extent (alloy:margins :l 1 :u 1 :r 1 :b 1)
   :halign :middle)
  ((:label text :when (typep (alloy:data alloy:renderable) 'string))
   :text (alloy:data alloy:renderable)
   :extent (alloy:margins :l 1 :u 1 :r 1 :b 1)
   :halign :middle))

(define-style (default-look-and-feel alloy:button)
  (:background
   :fill-color (case (alloy:focus)
                 (:strong (simple:color 0.9 0.9 0.9))
                 (:weak (simple:color 0.7 0.7 0.7))
                 (T (simple:color 0.25 0.2 0.8)))))

(define-realisation (default-look-and-feel alloy:switch)
  ((:background filled-box)
   :extent (alloy:margins))
  ((:border outlined-box)
   :extent (alloy:margins :l -3 :u -3 :r -3 :b -3))
  ((:switch filled-box)
   ;; FIXME: This is not good.
   :extent (alloy:extent 0 0 20 25)))

(define-style (default-look-and-feel alloy:switch)
  (:switch
   :offset (alloy:point (if (alloy:value alloy:renderable)
                            (- (alloy:extent-w (alloy:bounds)) 20)
                            0))
   :fill-color (case (alloy:focus)
                 (:strong (simple:color 1 1 1))
                 (T (simple:color 0.25 0.2 0.8)))))

(define-realisation (default-look-and-feel alloy:input-line)
  ((:background filled-box)
   :extent (alloy:margins))
  ((:border outlined-box)
   :extent (alloy:margins :l -3 :u -3 :r -3 :b -3))
  ((:label text)
   :text (alloy:value alloy:renderable)
   :extent (alloy:margins :l 1 :u 1 :r 1 :b 1))
  ((:cursor filled-box)
   :extent (alloy:extent 0 0 1 25)))

(define-style (default-look-and-feel alloy:input-line)
  (:background
   :fill-color (case (alloy:focus)
                 (:strong (simple:color 0.9 0.9 0.9))
                 (:weak (simple:color 0.7 0.7 0.7))
                 (T (simple:color 0.15 0.15 0.15))))
  (:cursor
   :fill-color (case (alloy:focus)
                 (:strong (simple:color 0 0 0))
                 (T (simple:color 0 0 0 0)))))

(define-realisation (default-look-and-feel alloy:slider)
  ((:background filled-box)
   :extent (alloy:margins))
  ((:border outlined-box)
   :extent (alloy:margins :l -3 :u -3 :r -3 :b -3))
  ((:handle filled-box)
   :extent (alloy:extent 0 0 10 25)))

(define-style (default-look-and-feel alloy:slider)
  (:handle
   :offset (alloy:point (- (* (alloy:extent-w (alloy:bounds))
                              (/ (- (alloy:value alloy:renderable) (alloy:minimum alloy:renderable))
                                 (- (alloy:maximum alloy:renderable) (alloy:minimum alloy:renderable))))
                           5))
   :fill-color (case (alloy:focus)
                 (:strong (simple:color 1 1 1))
                 (T (simple:color 0.25 0.2 0.8)))))
