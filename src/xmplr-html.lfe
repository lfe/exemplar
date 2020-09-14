(defmodule xmplr-html
  (export all))

(include-lib "include/xmplr-html.lfe")

(defun data->str
  ((`(#(tag ,tag) #(attr ()) #(content ())))
    (exemplar-html:make-html (atom_to_list tag)))
  ((`(#(tag ,tag) #(attr ,attrs) #(content ())))
    (exemplar-html:make-html (atom_to_list tag) attrs))
  ((`(#(tag ,tag) #(attr ()) #(content ,content)))
    (exemplar-html:make-html
      (atom_to_list tag)
      (content->str content)))
  ((`(#(tag ,tag) #(attr ,attrs) #(content ,content)))
    (exemplar-html:make-html
      (atom_to_list tag)
      attrs
      (content->str content)))
  ((elements)
    `#(error "Could not parse elements" ,elements)))

(defun content->str (content)
  (cond
    ((clj:string? content)
      content)
    ((xmplr-util:attrs? content)
      content)
    ((xmplr-util:element? content)
      (data->str content))
    ((xmplr-util:elements? content)
      (lists:map #'data->str/1 content))
    ('true
      `#(error "Could not convert content to string" ,content))))
