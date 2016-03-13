(defmodule xmplr-util-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")
(include-lib "clj/include/predicates.lfe")

(deftest attrs?
  (is (xmplr-util:attrs? '(class "css")))
  (is (xmplr-util:attrs? '(class "css" id "asdf-1")))
  (is-not (xmplr-util:attrs? '()))
  (is-not (xmplr-util:attrs? '(class "css" "id" "asdf-1")))
  (is-not (xmplr-util:attrs? '(1 2 3 4))))

(deftest attr->str
  (is-equal "href=\"http://url\" "
            (xmplr-util:attr->str 'href "http://url")))

(deftest attrs->str
  (is-equal "a=\"1\" b=\"2\" "
            (xmplr-util:attrs->str '(a "1" b "2"))))
