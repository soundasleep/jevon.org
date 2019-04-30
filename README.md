jevon.org
=========

Source code for https://jevon.org in [Jekyll](https://jekyllrb.com/).

* Using [Minima theme](https://github.com/jekyll/minima)
* [Jekyll layout cheat sheet](https://devhints.io/jekyll)

## Running locally

```
bundle install
bundle exec jekyll serve --livereload
```

And then visit http://localhost:4000.

## Developing

If hosted on GitHub pages, you can't import anything from `node_modules`, so there's no point in having
a `package.json` (unless you compile `bundle.{js,css}` first on travis-ci etc).

## Tests

There are a few specs to check that content has been correctly tagged, URLed, etc. They can be run with
`bundle exec rspec`.
