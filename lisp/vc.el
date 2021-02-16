;;; vc.el
;;;
;;; Wherein we configure our favourite version control libraries
;;; (i.e. magit, and only magit).

(use-package magit
  :straight t
  :defer t
  :init
  (add-to-sl-keymap
   '(("s" magit)
     ("b" magit-blame)))
  :custom
  (magit-diff-refine-hunk 'all)
  (magit-diff-refine-ignore-whitespace nil)
  :bind (:map magit-log-mode-map
              :map magit-mode-map
              ;; Checkout the commit-like thing at point, e.g. a git hash.
              ("@" . (lambda ()
                       (interactive)
                       (magit-checkout (magit-branch-or-commit-at-point)))))
  :commands magit)

(use-package magit-todos
  :straight t
  :after magit
  :config
  (magit-todos-mode))

(use-package gist
  :straight t
  :commands (gist-region-or-buffer))

(use-package git-link
  :straight t
  :commands (git-link))
