;; Setup our load path and load our custom init stuff
(add-to-list 'load-path "~/.emacs.d/init/")
(load-library "my-packages")
(load "c")

;; Enable cmake-mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))

;; Highlight matching parens
(show-paren-mode t)
;; Show line numbers in margin
(global-linum-mode t)
;; Show column numbers in mode line
(column-number-mode t)
;; Set theme
(load-theme 'tango-dark t)
;; Allow 'a' in dired mode to open directory in same buffer - i.e. reuse buffers
(put 'dired-find-alternate-file 'disabled nil)
;; Allow upper casing a region
(put 'upcase-region 'disabled nil)

;; Turn paredit on for lisp modes
(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook          (lambda () (paredit-mode +1)))
(add-hook 'nrepl-mode-hook            (lambda () (paredit-mode +1)))

;; OS specific config
(cond ((eq system-type 'darwin) (load-library "mac-config"))
      ((eq system-type 'windows-nt) (load-library "windows-config")))

;; Put backup/autosave files in the system's temp directory
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

(custom-set-variables '(inhibit-startup-screen t))
