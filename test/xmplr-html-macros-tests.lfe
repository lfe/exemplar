(defmodule xmplr-html-macros-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")
(include-lib "exemplar/include/xmplr-html.lfe")

(deftest make-data-with-lists
  (is-equal '(#(tag ul)
              #(attrs ())
              #(content ((#(tag li) #(attrs ()) #(content "a"))
                         (#(tag li) #(attrs ()) #(content "b"))
                         (#(tag li) #(attrs ()) #(content "c")))))
            (ul (list (li "a") (li "b") (li "c")))))
