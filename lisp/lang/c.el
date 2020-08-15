;;; c.el Configuration for C/C++

(use-package cc-mode
  :init
  (defun cc-mode-defaults ()
    (interactive)
    (c-set-style "stroustrup"))
  :hook (c-mode-common . cc-mode-defaults))

                
