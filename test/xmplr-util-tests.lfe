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

(deftest elements?
  (is-equal 'true (xmplr-util:elements?
                    '((#(tag 1) #(attrs 2) #(content 3))
                      (#(tag 1) #(attrs 2) #(content 3))
                      (#(tag 1) #(attrs 2) #(content 3)))))
  (is-equal 'false (xmplr-util:elements?
                     '((#(tag 1) #(attrs 2) #(content 3))
                       (#(tag 1) #(attrs 2) #(content 3))
                       (#(ntag 1) #(attrs 2) #(content 3))))))

(deftest element?
  (is-equal 'false (xmplr-util:element? '(#(a 1) #(b 2) #(c 3))))
  (is-equal 'true (xmplr-util:element? '(#(tag 1) #(attrs 2) #(content 3)))))

(deftest has-element-names?
  (is-equal 'false (xmplr-util:has-element-names? '(#(a 1) #(b 2) #(c 3))))
  (is-equal 'true (xmplr-util:has-element-names? '(#(tag 1) #(attrs 2) #(content 3)))))

(deftest all-2-tuples?
  (is-equal 'true (xmplr-util:all-2-tuples? '(#(a 1))))
  (is-equal 'true (xmplr-util:all-2-tuples? '(#(a 1) #(b 2))))
  (is-equal 'false (xmplr-util:all-2-tuples? '(#(a 1) #(2 3))))
  (is-equal 'false (xmplr-util:all-2-tuples? '(#(a 1) #(b 2) '(3 4))))
  (is-equal 'false (xmplr-util:all-2-tuples? '())))

(deftest 2-tuple?
  (is-equal 'true (xmplr-util:2-tuple? #(a 1)))
  (is-equal 'false (xmplr-util:2-tuple? #(a 1 2)))
  (is-equal 'false (xmplr-util:2-tuple? #(a)))
  (is-equal 'false (xmplr-util:2-tuple? '(a 1)))
  (is-equal 'false (xmplr-util:2-tuple? #(2 1)))
  (is-equal 'false (xmplr-util:2-tuple? '())))
