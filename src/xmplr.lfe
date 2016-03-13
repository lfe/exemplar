(defmodule xmplr
  (export all))

(defun make-data (tag)
  (make-data tag '() ""))

(defun make-data (tag content-or-attrs)
  (cond
    ;; if attrs
    ((xmplr-util:attrs? content-or-attrs)
      (make-data tag content-or-attrs ""))
    ;; if content
    ('true
      (make-data tag '() content-or-attrs))))

(defun make-data (tag attrs content)
  `(#(tag ,tag)
    ;; xmerl uses attr so we do; it really should be attrs, though ...
    #(attr ,attrs)
    #(content ,content)))

(defun data->str
  ((elements)
    (data->str elements #(format html))))

(defun data->str
  ((elements #(format html))
    (xmplr-html:data->str elements))
  ((elements options)
    `#(error "Unknown options" ,options)))
