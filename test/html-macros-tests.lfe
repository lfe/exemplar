(defmodule html-macros-tests
  (behaviour ltest-unit))

(include-lib "ltest/include/ltest-macros.lfe")
(include-lib "include/html-macros.lfe")

(deftest defelem
  (is-equal "<span>my content</span>" (span "my content")))

(deftest html
  (is-equal "<html />" (html)))

(deftest !doctype
  (is-equal "<!DOCTYPE html>\n" (lists:flatten (!doctype 'html)))
  (is-equal "<!DOCTYPE html>\n" (lists:flatten (!doctype '(html))))
  (is-equal "<!DOCTYPE html PUBLIC \"a\" \"b\">\n"
            (lists:flatten (!doctype '(html public "a" "b"))))
  (is-equal "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">\n"
            (lists:flatten (!doctype '(foo bar
                                       "-//W3C//DTD HTML 4.01//EN"
                                       "http://www.w3.org/TR/html4/strict.dtd")))))

(deftest link
  (is-equal "<link rel=\"stylesheet\" src=\"some-url\">"
            (link '(rel "stylesheet" src "some-url"))))

(deftest script
  (is-equal "<script type=\"text/javascript\" src=\"some-url\"></script>"
            (script '(type "text/javascript" src "some-url")))
  (is-equal "<script >some-script-context.Object.fuinction(thinkg);</script>"
            (script "some-script-context.Object.fuinction(thinkg);")))

(deftest meta
  (is-equal "<meta charset=\"utf-8\">"
            (meta '(charset "utf-8")))
  (is-equal "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            (meta '(name "viewport" content "width=device-width, initial-scale=1"))))
