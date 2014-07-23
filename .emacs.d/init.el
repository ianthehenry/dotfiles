;; Cask!
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(defvar dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(load (concat dotfiles-dir "init-packages.el"))

(load-library "better-defaults")
(load-library "init-packages")

(set-keyboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(windmove-default-keybindings)
(fset 'yes-or-no-p 'y-or-n-p)
