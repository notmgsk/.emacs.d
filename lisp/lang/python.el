(use-package python
  :straight t
  :hook ((python-mode . company-mode)
         (python-mode . electric-pair-mode)
         (python-mode . indent-guide-mode)
         (python-mode . yas-minor-mode)
         (eglot-managed-mode-hook . (lambda () (add-hook 'before-save-hook 'eglot-format-buffer nil t)))))

(use-package pyvenv
  :straight t
  :commands pyvenv-activate)

(use-package python-black
  :straight t
  :after python)

(use-package poetry
  :straight t
  :after python)

(use-package pytest
  :straight t
  :commands (pytest-one pytest-all)
  :init
  (add-to-sl-keymap
   ;; TODO Testing is common enough that I should have a key that is
   ;; language-dependent, and will do the right thing. e.g. in
   ;; python-mode, pop up pytest-one, pytest-all, etc
   ;;
   ;; TODO Use (magit) transient mode to present a pop up of available
   ;; options. Fork https://github.com/ionrock/pytest-el?
   '(("t o" pytest-one)
     ("t a" pytest-all))))

(use-package python-docstring
  :straight t
  :hook (python-mode . python-docstring-mode))
