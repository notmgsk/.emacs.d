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

(timed-load "./lang/lang.el")


