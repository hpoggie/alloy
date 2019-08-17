#|
 This file is a part of Alloy
 (c) 2019 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(defpackage #:org.shirakumo.alloy.renderers.opengl
  (:use #:cl)
  (:local-nicknames
   (#:alloy #:org.shirakumo.alloy)
   (#:simple #:org.shirakumo.alloy.renderers.simple)
   (#:font-discovery #:org.shirakumo.font-discovery))
  ;; protocol.lisp
  (:export
   #:bind
   #:gl-name
   #:make-shader
   #:uniform
   #:make-vertex-buffer
   #:update-vertex-buffer
   #:make-vertex-array
   #:draw-vertex-array)
  ;; renderer.lisp
  (:export
   #:renderer
   #:resource))