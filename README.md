# kpurdon/.emacs.d

My personal emacs configuration. This configuration is built to work with [Emacs for MacOSX](http://emacsformacosx.com/) and is last tested on:

```
$ emacs --version
    GNU Emacs 26.3
```

Custom configuration is included for the following development modes:

* Golang
    * Editor basics via [gopls](https://github.com/golang/tools/blob/master/gopls/README.md)
    * Automated struct tags (via [emacs-go-add-tags](https://github.com/syohex/emacs-go-add-tags))
	* Linting/Style via [golangci-lint](https://github.com/weijiangan/flycheck-golangci-lint)
* Python
    * Editor basics via [elpy](https://elpy.readthedocs.io/en/latest/)
    * Style checking via flake8/isort/autopep8
* Markdown
    * Editor basics via [markdown-mode](https://jblevins.org/projects/markdown-mode/)
* JSON
    * Editor basics via [json-mode](https://github.com/joshwnj/json-mode)
* Web
    * Editor basics via [web-mode](http://web-mode.org/)
* JS
    * Editor basics via [js2-mode](https://github.com/mooz/js2-mode)

### Quickstart

1. Install [Emacs for MacOSX](http://emacsformacosx.com/)
2. Run `cd $HOME && rm -rf ./.emacs.d && git clone git@github.com:kpurdon/.emacs.d.git`
3. Run the following scripts (or look at them for required tools):
   - `./scripts/install_go_tools.sh`
   - `./scripts/install_py_tools.sh`
