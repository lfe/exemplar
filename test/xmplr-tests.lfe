(defmodule xmplr-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest make-data
  (is-equal '(#(tag br) #(attrs ()) #(content ()))
            (xmplr:make-data 'br)))

(deftest make-data-with-content
  (is-equal '(#(tag pre) #(attrs ()) #(content "some code"))
            (xmplr:make-data 'pre "some code")))

(deftest make-data-with-attrs
  (is-equal '(#(tag img) #(attrs (src "http://url")) #(content ""))
            (xmplr:make-data 'img '(src "http://url"))))

(deftest make-data-with-attrs-and-content
  (is-equal '(#(tag pre) #(attrs (class "lisp")) #(content "some code"))
            (xmplr:make-data 'pre '(class "lisp") "some code")))
