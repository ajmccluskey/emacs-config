;; Enable auto-wrapped text for various modes

(add-hook 'markdown-mode-hook
		  (lambda ()
			(set-fill-column 110)
			(auto-fill-mode)))
