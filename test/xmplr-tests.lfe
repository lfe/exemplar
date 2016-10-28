(defmodule xmplr-tests
  (behaviour ltest-unit))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest make-data
  (is-equal '(#(tag br) #(attr ()) #(content ()))
            (xmplr:make-data 'br)))

(deftest make-data-with-content
  (is-equal '(#(tag pre) #(attr ()) #(content "some code"))
            (xmplr:make-data 'pre "some code")))

(deftest make-data-with-attrs
  (is-equal '(#(tag img) #(attr (src "http://url")) #(content ""))
            (xmplr:make-data 'img '(src "http://url"))))

(deftest make-data-with-attrs-and-content
  (is-equal '(#(tag pre) #(attr (class "lisp")) #(content "some code"))
            (xmplr:make-data 'pre '(class "lisp") "some code")))
