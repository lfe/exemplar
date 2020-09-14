(defmodule macros-tests
  (behaviour ltest-unit))

(include-lib "ltest/include/ltest-macros.lfe")
(include-lib "include/xml-macros.lfe")

(defelem special)

(deftest defelem
  (is-equal "<special />" (special))
  (is-equal "<special>my content</special>" (special "my content")))
