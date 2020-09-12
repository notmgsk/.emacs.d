(use-package python
  :straight t)

(use-package pyvenv
  :straight t
  :commands pyvenv-activate)

(use-package python-black
  :straight t
  :after python)

(use-package poetry
  :straight t
  :after python)
