;;; lisp.el Configuration for common lisp mode

(use-package sly
  :straight t
  :init
  (setq inferior-lisp-program "sbcl")
  :commands sly)

(use-package lispy
  :straight t
  :init
  ;; No idea why lispy thinks it's useful to insert a space before
  ;; colons?
  (setq lispy-colon-p nil)
  ;; Copied from doom
  :hook ((lisp-mode . lispy-mode)
         (emacs-lisp-mode . lispy-mode)
         (scheme-mode . lispy-mode)
         (racket-mode . lispy-mode)
         (hy-mode . lispy-mode)
         (lfe-mode . lispy-mode)
         (dune-mode . lispy-mode)
         (clojure-mode . lispy-mode)))

(use-package lisp-mode
  ;; TODO Not sure the below hook is working as desired, in that it
  ;; does not appear to be buffer-local.
  :hook ((lisp-mode . (lambda ()
                        ;; Clean-up buffers on save (or just before). Weirdly before-save-hook isn't
                        ;; buffer-local by default, meaning it will add stuff to the global
                        ;; hook. Sometimes that's what you want, sometimes not. The 'local here is
                        ;; just a non-nil value that forces the hook to be treated as buffer-local.
                        (add-hook 'before-save-hook 'delete-trailing-whitespace nil 'local)
                        (add-hook 'before-save-hook (lambda ()
                                                      (let ((current-prefix-arg t))
                                                        (call-interactively 'untabify)))
                                  'local)))))

