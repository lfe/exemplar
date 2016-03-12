# Introduction

[![][juggernaut-logo]][juggernaut-logo-large]

[juggernaut-logo]: images/juggernaut-tiny.png
[juggernaut-logo-large]: images/juggernaut-large.png

*Markup Language Expressions for LFE: creating HTML with S-expressions on the Erlang VM.*


## Supported Tags

[![][html5_logo]][html5_logo]

[html5_logo]: images/HTML5_Logo_tiny.png

Right now, only HTML5 is supported. Feel free to submit pull requests to support
older/different tags/elements.

The list of tags was obtained from [Mozilla's HTML 5 documentation][mz]

[mz]: https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/HTML5_element_list

Note that XML namespacing hasn't been explored yet, but *should* be possible.


## Current Status

As you can see in the example usage below, you can use exemplar to build HTML
strings using LFE S-expressions. However, do note that the project has *just*
started and there are lots of unexplored HTML edge-cases that simply won't work
right now.

If you come across anything, feel free to submit a bug in the github issue
tracker, or even send us a pull request :-)


## Dependencies

This project assumes that you have [rebar3](https://github.com/erlang/rebar3)
installed somwhere in your ``$PATH``.


## Installation

> Just add it to your ``rebar.config`` deps:

```erlang
{deps, [
    ...
    {exemplar, ".*", {git, "git@github.com:lfex/exemplar.git", {tag, "x.y.z"}}
  ]}.
```

> And then do the usual:

```bash
$ rebar3 compile
```

Exemplar is like any other Erlang/LFE project -- to use it in your project, simply add it to your ``rebar.config`` file. Note that only rebar3 is supported now.


## The Name

Naming and cache invalidation, right?

The first thought was to name the project ML-expr: ML for HTML, replacing the
"s" of "s-expression". MLEXPR isn't all that pronouncable, so another "e" and
an "a" were added for "exemplar". That's all there is to it.

Also: "Do you know who I *am*?!"


## Conventions

We use styled call-outs to provide immediate visual cues about the nature of
the information being shared.

These are as follows:

<aside class="info">
This style indicates useful information, background, or other insights.
</aside>

<aside class="success">
This style indicates a best practice, good usage, and other tips for success.
</aside>

<aside class="caution">
This style indicates one should use caution or that behaviour may not be as
expected
</aside>

<aside class="danger">
This style indicates information that could cause errors if ignored.
</aside>
