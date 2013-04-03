;; Configuration options specific to Windows

(require 'cl)
(defun font-candidate (&rest fonts)
  "Return existing font which first match."
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(set-face-attribute 'default nil :font (font-candidate "Consolas-10:weight=normal" "Lucida Console-11:weight=normal"))

(provide 'windows-config)
