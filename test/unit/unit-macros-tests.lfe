(defmodule unit-macros-tests
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")
(include-lib "exampler/include/macros.lfe")

(defelem special)

(deftest defelem
  (is-equal '"<special />" (special))
  (is-equal '"<special>my content</special>" (special '"my content")))
