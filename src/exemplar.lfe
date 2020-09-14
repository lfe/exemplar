(defmodule exemplar
  (export all))

(include-lib "include/xml-macros.lfe")

(defun space () " ")

(defun slash () "/")

(defun opening-bracket () "<")

(defun closing-bracket () ">")

(defun self-closing-bracket ()
  (++ (space)
      (slash)
      (closing-bracket)))

(defun -opening-tag (tag bracket)
  (++ (opening-bracket)
      tag
      bracket))

(defun -opening-tag (tag attrs bracket)
  (++ (opening-bracket)
      tag
      (space)
      (lutil-text:strip (xmplr-util:attrs->str attrs))
      bracket))

(defun opening-tag (tag)
  (-opening-tag tag (closing-bracket)))

(defun opening-tag (tag attrs)
  (-opening-tag tag attrs (closing-bracket)))

(defun closing-tag (tag)
  (++ (opening-bracket)
      (slash)
      tag
      (closing-bracket)))

(defun self-closing-tag (tag)
  (-opening-tag tag (self-closing-bracket)))

(defun self-closing-tag (tag attrs)
  (-opening-tag tag attrs (self-closing-bracket)))

(defun non-closing-tag (tag)
  (-opening-tag tag (closing-bracket)))

(defun non-closing-tag (tag attrs)
  (-opening-tag tag attrs (closing-bracket)))

;;; Backwards-compatible aliases

(defun attr-to-string (name value)
  "Deprecated; use attr->str instead."
  (xmplr-util:attr->str name value))

(defun attrs-to-string (attrs)
  "Deprecated; use attrs->str instead."
  (xmplr-util:attrs->str attrs))
