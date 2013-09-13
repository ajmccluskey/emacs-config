;; 2 space indent for HTML
(add-hook 'html-mode-hook
		  (lambda ()
			(setq sgml-basic-offset 2)
			(setq indent-tabs-mode nil)))
