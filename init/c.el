;; BEGIN COPIED CODE
;; The following has been taken from https://github.com/nicholasbishop/emacs-conf/blob/master/dev.el
(defun make-path-safe-for-c-define (file-name)
  "Upcase the path, use underscores for dots, hyphens, and slashes"
  (replace-regexp-in-string "[-\\.\\\\\/]" "_" (upcase file-name)))

(defun c-header-guard-string (file-name use-dir suffix)
  "Return a C header guard name"
  (if use-dir
      (concat (make-path-safe-for-c-define file-name) suffix)
    (concat (make-path-safe-for-c-define
             (file-name-nondirectory file-name)) suffix)))

;; insert header guards
(defun c-header-guards ()
  (interactive)
  (let ((guard (read-string
                "Guard: "
                ;; Default value
                (concat "__" (c-header-guard-string (buffer-file-name) nil "")))))
    ;; Insert test and define before point
    (insert (concat "#ifndef " guard "\n#define " guard "\n\n"))
    ;; Insert endif after point
    (let ((pos (point)))
      (insert (concat "\n\n#endif /* #ifndef " guard " */\n"))
      (goto-char pos))))

;; END COPIED CODE

(eval-after-load 'cc-mode
  '(define-key c-mode-map (kbd "C-c h") 'c-header-guards))

;; Use tabs that are 4 chars wide
(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode t)

