;; Setup our load path and load our custom init stuff
(add-to-list 'load-path "~/.emacs.d/init/")
(load-library "my-packages")

;; Highlight matching parens
(show-paren-mode t)
;; Show line numbers in margin
(global-linum-mode t)
;; Show column numbers in mode line
(column-number-mode t)
;; Set theme
(load-theme 'tango-dark t)
