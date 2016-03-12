# Interactive Usage

## HTML

> Start the REPL:

```bash
$ make shell
```

> Then, from a clone of exemplar:

```lisp
> (slurp "src/exemplar-html.lfe")
#(ok exemplar-html)
```

> Now create some tags:

```lisp
> (html (body (div (p "Here is some content")))))
```

Which will give the following output

```html
"<html><body><div><p>Here is some content</p></div></body></html>"
```

Generating HTML with Exemplar is very simple: all the HTML 5 tags have been defined to provide an HTML DSL in LFE. This lets you create HTML (and XML) in LFE without having to provide quoted HTML strings or binaries.


## Custom Elements

> Define your own module and include the Exemplar XML macros:

```lisp
(defmodule my-project
  (export all))

(include-lib "exemplar/include/xml-macros.lfe")

(defelem custom-elem)
```

> Then, you can ``make shell``, ``slurp`` that file, and use your new element:

```lisp
> (slurp "src/my-project.lfe")
#(ok my-project)
> (custom-elem (custom-elem "much wow"))
```

> Which will give the following output

```html
"<custom-elem><custom-elem>much wow</custom-elem></custom-elem>"
```

In addition to regular HTML 5, you can create your own custom elements. In your project that has exemplar set up as a dependency, create a module and ``include-lib`` the XML macros file so that you can create your own elements.


## Current Limitations

> We can see these three aritiies in action by slurping ``src/exemplar-html.lfe``
and calling these functions:

```lisp
> (slurp "src/exemplar-html.lfe")
#(ok exemplar-html)
> (div)
"<div />"
> (div "some content")
"<div>some content</div>"
> (div '(class "some-css") "some content")
"<div class=\"some-css\">some content</div>"
```

> What this means is that (for now) you cannot do something like this:

```lisp
> (div (p "paragraph 1") (p "paragraph 2") (p "paragraph 3"))
exception error: #(unbound_func #(div 3))
```

> Since there is no ``#'div/3``. Instead, you will have to do this:

```lisp
> (div '((p "paragraph 1") (p "paragraph 2") (p "paragraph 3")))
"<div><p>paragraph 1</p><p>paragraph 2</p><p>paragraph 3</p></div>"
```

> Another common use case:

```lisp
> (ul '((li "a") (li "b") (li "c")))
"<ul><li>a</li><li>b</li><li>c</li></ul>"
```

> Here's ``#'div/1`` with attributes and no content:

```lisp
> (div '(id "div-1" class "big"))
"<div id=\"div-1\" class=\"big\" />"
```

> Here's an example using a variable in the attributes:

```lisp
> (set class "bigger")
"bigger"
> (div `(id "div-1" class ,class))
"<div id=\"div-1\" class=\"bigger\" />"
> (div (list 'id "div-1" 'class class))
"<div id=\"div-1\" class=\"bigger\" />"
```

Right now, the ``defelem`` macro which generates all the HTML functions only
generates functions with three different arities. For instance,
``include/html-macros.lfe`` defines the ``div`` element ``(defelem div)``.

The ``defelem`` macro in ``include/xml-macros.lfe`` generates three functions with
this definition:

* ``div/0``
* ``div/1``
* ``div/2``

In order to nest S-expression tags, you will need to proivde the nested HTML-to-be to ensure one of the above arities is called on your element.

Note that the 1-arity generated functions have some smarts: in addition to being
able to handle lists of elements, they can also handle lists of attributes and
string content.


# Exemplar with YAWS

> A simple YAWS project project configuration:

```
logdir = logs
ebin_dir = deps/yaws/var/yaws/ebin
ebin_dir = ebin
log_resolve_hostname = false
fail_on_bind_err = true

<server localhost>
        port = 5099
        listen = 0.0.0.0
        appmods = </, my-project>
        docroot = www
</server>
```

> The ``my-project`` module referenced in the ``appmods`` directive:

```lisp
(defmodule my-project
  (export all))

(include-lib "deps/exemplar/include/html-macros.lfe")

(defun out (arg-data)
  "This function is executed by YAWS. It is the YAWS entry point for our app."
  (let ((path-info (string:tokens
                      (parse-path arg-data)
                      "/")))
    (routes path-info arg-data)))

(defun routes
  "Routes for our app."
  ;; /content/:id
  (((list "content" item-id) arg-data)
   (content-api item-id arg-data))
  ;; potentially many other routes
  ...
  ;; When nothing matches, do this
  ((path method arg)
    (io:format
      "Unmatched route!~n Path-info: ~p~n arg-data: ~p~n~n"
      (list path arg))
    (make-error-response "Unmatched route.")))

(defun make-html-response (html)
  (tuple 'content
         "text/html"
         html))

(defun content-api (id request-data)
  ;; pull content from a data store
  (let ((fetched-title "Queried Title")
        (fetched-content "Some super-great queried lorem ipsum."))
    ({{PROJECT}}-util:make-200-result
      (html
        (list
            (head
              (title fetched-title))
            (body
              (main
                (div '(class "dynamic content")
                  (list
                    (h1 fetched-title)
                    (h2 (++ "Item " item-id))
                    (div (p fetched-content)))))))))))
```

If you are running a YAWS-based project, you can easily include exemplar in it.
Any function that is returning content to YAWS can simply use the exemplar HTML
macros.

Note that, due to the current limitation of the generated HTML element function
arities, we have to wrap sibling calls (e.g., ``(head ...) (body ...)`` in a
``list``.

Needless to say, one could also create custom templates via functions that
generate partial HTML and have parameters/variables for addition HTML to be
passed.

For more information on using LFE with YAWS, be sure to check out the
[LFE REST example app](https://github.com/lfex/yaws-rest-starter).

