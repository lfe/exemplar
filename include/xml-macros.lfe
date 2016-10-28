(defmacro defelem arg
  (let ((tag (car arg)))
    `(progn
       (defun ,tag ()
         (exemplar-xml:make-xml (atom_to_list ',tag)))
       (defun ,tag (content)
         (exemplar-xml:make-xml (atom_to_list ',tag) content))
       (defun ,tag (attrs content)
         (exemplar-xml:make-xml (atom_to_list ',tag) attrs content)))))

(defun loaded-xml-macros ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).

  This function needs to be the last one in this include."
  'ok)

