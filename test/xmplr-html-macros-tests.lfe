(defmodule xmplr-html-macros-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")
(include-lib "exemplar/include/xmplr-html.lfe")

(deftest make-data-with-lists
  (is-equal '(#(tag ul)
              #(attr ())
              #(content ((#(tag li) #(attr ()) #(content "a"))
                         (#(tag li) #(attr ()) #(content "b"))
                         (#(tag li) #(attr ()) #(content "c")))))
            (ul (list (li "a") (li "b") (li "c")))))
