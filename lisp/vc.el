;;; vc.el
;;;
;;; Wherein we configure our favourite version control libraries
;;; (i.e. magit, and only magit).

(use-package magit
  :straight t
  :defer t
  :init
  (add-to-sl-keymap
   '(("s" magit)))
  :bind (:map magit-log-mode-map
         :map magit-mode-map
         ;; Checkout the commit-like thing at point, e.g. a git hash.
         ("@" . (lambda ()
                  (interactive)
                  (magit-checkout (magit-branch-or-commit-at-point)))))
  :commands magit)

