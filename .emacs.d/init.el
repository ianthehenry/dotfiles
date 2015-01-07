(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(defvar dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(load (concat dotfiles-dir "init-packages.el"))

(load-library "better-defaults")
(load-library "init-packages")

(evil-mode)
(evil-surround-mode)
(evil-set-initial-state 'haskell-interactive 'insert)

(set-keyboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(windmove-default-keybindings)
(fset 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
