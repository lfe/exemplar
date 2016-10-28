(defmodule xmplr-html-tests
  (behaviour ltest-unit))

(include-lib "ltest/include/ltest-macros.lfe")
(include-lib "exemplar/include/xmplr-html.lfe")

(deftest data->str
  (is-equal "<br />"
            (xmplr-html:data->str (br))))

(deftest data->str-with-content
  (is-equal "<pre>some code</pre>"
            (xmplr-html:data->str (pre "some code"))))

(deftest data->str-with-attrs
  (is-equal "<img src=\"http://url\" />"
            (xmplr-html:data->str (img '(src "http://url")))))

(deftest data->str-with-attrs-and-content
  (is-equal "<pre class=\"lisp\">some code</pre>"
            (xmplr-html:data->str (pre '(class "lisp") "some code"))))

(deftest data->str-opening-tag-with-attrs
  (is-equal "<a href=\"url\" />"
            (xmplr-html:data->str (a '(href "url"))))
  (is-equal "<a class=\"link\" href=\"url\" />"
            (xmplr-html:data->str (a '(class "link" href "url"))))
  (is-equal "<a class=\"link\" custom=\"data\" href=\"url\" />"
            (xmplr-html:data->str (a '(class "link" custom "data" href "url")))))

(deftest data->str-nested
  (is-equal "<ul><li>a</li><li>b</li><li>c</li></ul>"
            (xmplr-html:data->str (ul (list (li "a") (li "b") (li "c"))))))

(deftest data->str-raw
  (is-equal "<pre class=\"lisp\">some code</pre>"
            (xmplr-html:data->str '(#(tag pre) #(attr (class "lisp")) #(content "some code")))))
