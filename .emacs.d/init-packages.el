(require 'use-package)

(setq-default
 use-package-idle-interval 1
 use-package-verbose t)

(use-package haskell-mode
  :commands haskell-mode
  :config (progn
            (setq-default haskell-program-name "/usr/local/bin/cabal repl")
            (add-hook 'haskell-mode-hook '(lambda ()
                                            (interactive-haskell-mode)
                                            (flycheck-mode)
                                            (flycheck-haskell-setup)
                                            (turn-on-haskell-indentation)
                                            (custom-set-variables
                                             '(haskell-process-type 'cabal-repl))
                                            ))))

(use-package popwin
  :commands popwin-mode
  :idle (popwin-mode t))

(use-package midnight)

(use-package smex
  :commands smex
  :bind ("M-x" . smex))
