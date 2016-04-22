# exemplar [![Build Status][travis-badge]][travis]

[travis]: https://travis-ci.org/lfex/exemplar
[travis-badge]: https://travis-ci.org/lfex/exemplar.png?branch=master

[![][juggernaut-tiny]][juggernaut-large]

[juggernaut-tiny]: priv/images/juggernaut-tiny.png
[juggernaut-large]: priv/images/juggernaut-large.png

*Markup Language Expressions for LFE: creating HTML with S-expressions on the Erlang VM.*

#### Contents

* [Introduction](#introduction-)
  * [Supported Tags](#supported-tags-)
  * [Current Status](#current-status-)
  * [About the Name](#about-the-name-)
* [Dependencies](#dependencies-)
* [Installation](#installation-)
* [Documentation](#documentation-)
* [License](#license-)


## Introduction [&#x219F;](#contents)

### Supported Tags [&#x219F;](#contents)

[![][html5_logo]][html5_logo]

[html5_logo]: priv/images/HTML5_Logo_tiny.png

Right now, only HTML5 is supported. Feel free to submit pull requests to support
older/different tags/elements.

The list of tags was obtained from [Mozilla's HTML 5 documentation][mz]

[mz]: https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5/HTML5_element_list

Note that XML namespacing hasn't been explored yet, but *should* be possible.


### Current Status [&#x219F;](#contents)

As you can see in the example usage below, you can use exemplar to build HTML
strings using LFE S-expressions. However, do note that the project has *just*
started and there are lots of unexplored HTML edge-cases that simply won't work
right now.

If you come across anything, feel free to submit a bug in the github issue
tracker, or even send us a pull request :-)


### About the Name [&#x219F;](#contents)

Naming and cache invalidation, right?

The first thought was to name the project ML-expr: ML for HTML, replacing the
"s" of "s-expression". MLEXPR isn't all that pronouncable, so another "e" and
an "a" were added for "exemplar". That's all there is to it.

Also: "Do you know who I *am*?!"


## Dependencies [&#x219F;](#contents)

This project assumes that you have [rebar3](https://github.com/erlang/rebar3)
installed somwhere in your ``$PATH``.


## Installation [&#x219F;](#contents)

Just add it to your ``rebar.config`` deps:

```erlang
{deps, [
    ...
    {exemplar, ".*", {git, "git@github.com:lfex/exemplar.git", {tag, "x.y.z"}}
  ]}.
```

And then do the usual:

```bash
$ rebar3 compile
```


## Documentation [&#x219F;](#contents)

Documentation for Exemplar is published to the following locations:

* [User Guide](http://lfex.github.io/exemplar/current/user-guide)
* [API Reference](http://lfex.github.io/exemplar/current/api)


## License [&#x219F;](#contents)

```
Copyright © 2014-2016 Duncan McGreggor

Distributed under the Apache License, Version 2.0.
```
