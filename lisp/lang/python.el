(use-package python
  :straight t
  :hook ((python-mode . company-mode)
         (python-mode . electric-pair-mode)
         (python-mode . indent-guide-mode)))

(use-package pyvenv
  :straight t
  :commands pyvenv-activate)

(use-package python-black
  :straight t
  :after python)

(use-package poetry
  :straight t
  :after python)
