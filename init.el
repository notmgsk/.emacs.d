;;; init.el
;;;
;;; Wherein we get the party started. I have gone through all the big
;;; names in Emacs configs: spacemacs and doom. Before those, I had a
;;; hand-crafted config file using the pretty neat Borg, and before
;;; that I just had your stanard basic-ass behemoth config with
;;; copious (require ...)s and no concern for efficiency, etc. The big
;;; guns are too big (and generally seem to lead to a crappy, laggy
;;; experience on macOS), so I'm off those for a while. I really
;;; enjoyed the "pinned" versions that borg uses, as it tends to keep
;;; your setup from randomly breaking when a package updates without
;;; you being aware of it. But Borg is also weird, and requires a bit
;;; of manual work, and isn't as descriptive as I would
;;; like. straight.el looks like it should solve those issues: it pins
;;; package versions, and it also can freeze/thaw an emacs config, so
;;; that it is entirely defined by init.el and some other elisp file
;;; that defines whatever packages you use and their particular
;;; version. So it's very easy to install your config on a new machine
;;; and just have it work.
(defvar config-load-start-time (time-to-seconds)
  "The time at which init.el was loaded." )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; straight.el set-up and configuration. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar bootstrap-version nil
  "Something used by straight.el. Not sure.")
;; Thankfully this is all done just the once on a fresh install.
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(use-package no-littering
  :straight t
  :config
  (setq no-littering-etc-directory (expand-file-name "config/" user-emacs-directory)
        no-littering-var-directory (expand-file-name "data/" user-emacs-directory)
        auto-save-file-name-transforms `((".*" ,(no-littering-expand-var-file-name "auto-save/") t))))

(use-package load-relative
  :straight t)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Some global config ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro timed-load (file)
  `(let ((tstart (time-to-seconds)))
     (load-relative ,file)
     (message "    ... Completed in %fs"
          (- (time-to-seconds) tstart))))

(setq tab-width 4
      indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some OS-specific config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (eq system-type 'darwin)
  (setq ring-bell-function 'ignore)
  (setq mac-command-modifier 'meta)
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs))

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some specific config ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;

(timed-load "./lisp/package.el")
(timed-load "./lisp/env.el")
(timed-load "./lisp/kb.el")
(timed-load "./lisp/ui.el")
(timed-load "./lisp/org.el")
(timed-load "./lisp/vc.el")
(timed-load "./lisp/prog.el")
(timed-load "./lisp/nix.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Don't clutter init.el with customizations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(defvar config-load-finish-time (time-to-seconds))
(message "Took %fs to load init.el" 
         (- config-load-finish-time
            config-load-start-time))
