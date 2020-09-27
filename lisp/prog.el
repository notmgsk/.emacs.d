;;; prog.el

(use-package company
  :straight t
  :config
  (defun tab-dwim ()
    (interactive)
    (cond
     ((zerop (current-column))
      (indent-according-to-mode))
     ((save-excursion
    (backward-char)
    (not (looking-at " ")))
      (company-complete))
     (t
      (indent-according-to-mode))))
  (company-mode))


(use-package yasnippet
  :straight t
  :defer t)

(use-package yasnippet-snippets
  :straight t
  :after yasnippet)

(timed-load "./lang/lang.el")


