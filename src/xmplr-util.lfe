(defmodule xmplr-util
  (export all))

(include-lib "clj/include/predicates.lfe")

(defun get-exemplar-version ()
  (lutil:get-app-src-version "src/exemplar.app.src"))

(defun get-versions ()
  (++ (lutil:get-version)
      `(#(exemplar ,(get-exemplar-version)))))

(defun attrs? (data)
  "a list of attr/value key pairs has to have an even number of elements. The
  first element also has to be an atom. In fact, all even-indexed (zero-based
  counting) elements have to be atoms.

  If these criteria are not met, the list is not an attr collection."
  (let* ((len (length data))
         (`#(,names ,values) (lutil-type:partition-list data))
         (evens-atoms? (== (length names) (length values))))
    (and (list? data) (and (> len 0) (and (even? len) evens-atoms?)))))

(defun attr->str (name value)
  (++ (atom_to_list name)
      "=\""
      value
      "\" "))

(defun attrs->str (attrs)
  (let ((`#(,names ,values) (lutil-type:partition-list attrs)))
    (lists:concat
      (lists:zipwith #'attr->str/2 names values))))
