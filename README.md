# kpurdon/.emacs.d

My personal emacs configuration. This configuration is built to work with [Emacs for MacOSX](http://emacsformacosx.com/) and is last tested on:

```
$ emacs --version
GNU Emacs 26.2
```

Custom configuration is included for the following development modes:

* Golang
    * Automated struct tags (via [emacs-go-add-tags](https://github.com/syohex/emacs-go-add-tags))
    * ElDoc support (via [emacs-go-eldoc](https://github.com/syohex/emacs-go-eldoc))
	* [golangci-lint integration](https://github.com/weijiangan/flycheck-golangci-lint)
    * golint integration
    * guru (formerly oracle) integration
* Python
    * autopep8 integration
* Markdown
* JSON
    * via [json-mode](https://github.com/joshwnj/json-mode)
* Web
    * html w/ modified default settings (via [web-mode](http://web-mode.org/)

### Quickstart

1. Install [Emacs for MacOSX](http://emacsformacosx.com/)
2. Run `cd $HOME && rm -rf ./.emacs.d && git clone git@github.com:kpurdon/.emacs.d.git`
3. Install the following dependencies:

#### Golang (see development/_golang.el for config)

Run `./scripts/setup_go.sh`

#### Python (see development/_python.el for config)

Run `./scripts/setup_python.sh`
