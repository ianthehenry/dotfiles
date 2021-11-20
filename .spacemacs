;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(purescript
     haskell
     git
     ivy
     python
     ruby
     javascript
     php
     html
     yaml
     auto-completion
     emacs-lisp
     neotree
     markdown
     rust
     ocaml
     org
     nginx
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     version-control
   )

   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(dash dash-functional)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   ;;
   ;; Ian's overrides:
   ;;
   ;; paradox depends on a package called spinner, which is not in melpa, even
   ;; though paradox itself is in melpa. spinner is only published to gnu elpa.
   ;;
   ;; https://github.com/Malabarba/paradox/issues/134
   ;;
   ;; evil-escape because I don't use it, and there's a bug where if you press
   ;; escape after typing the first character in the sequence, emacs errors out.
   dotspacemacs-excluded-packages
   '(paradox adaptive-wrap
             evil-escape
             ac-ispell ;; this just doesn't seem to exit
             helm
             )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa t

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style '(vim :variables
                                    vim-style-visual-feedback t
                                    vim-style-remap-Y-to-y$ t
                                    vim-style-retain-visual-state-on-shift t
                                    vim-style-visual-line-move-text t
                                    vim-style-ex-substitute-global nil
                                    )

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-night
                         spacemacs-dark
                         solarized-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Menlo"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1
                               )

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (setq auto-completion-private-snippets-directory "~/local/snippets")
  (setq evil-search-module 'evil-search)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun ian/fit-other-window (dir)
  (let ((other-window (windmove-find-other-window dir)))
    (cond ((null other-window)
           (error "No window %s from selected window" dir))
          ((and (window-minibuffer-p other-window)
                (not (minibuffer-window-active-p other-window)))
           (error "Minibuffer is inactive"))
          (t (fit-window-to-buffer other-window)))))

(defun ian/fit-window-left ()
  (interactive)
  (ian/fit-other-window 'left))

(defun ian/fit-window-right ()
  (interactive)
  (ian/fit-other-window 'right))

(defun ian/fit-window-up ()
  (interactive)
  (ian/fit-other-window 'up))

(defun ian/fit-window-down ()
  (interactive)
  (ian/fit-other-window 'down))

(defun ian/fit-window-by-number (i)
  (let* ((window (winum-get-window-by-number i)))
    (if window
        (fit-window-to-buffer window)
      (error "No window numbered %s" i))))

(dotimes (i 10)
  (eval `(defun ,(intern (format "ian/fit-window-%s" i)) ()
           ,(format "Select the window with number %i." i)
           (interactive)
           (ian/fit-window-by-number ,i))))

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

;; these evil-define functions are not actually available yet...
(comment
;; For some reason, you have to use evil-define-motion. defun doesn't work.
(evil-define-motion ian/evil-visual-line ()
  (interactive)
  (cond
   ((eq (evil-visual-type) 'line) (call-interactively #'evil-next-line))
   (t (call-interactively #'evil-visual-line))
   ))

(evil-define-command ian/insert-char (count char)
  (interactive "<c><C>")
  (setq count (or count 1))
  (save-excursion
    (insert (make-string count char))
    ))

(evil-define-command ian/change-to-one-char (char)
  (interactive "<C>")
  (call-interactively 'evil-delete)
  (save-excursion
    (insert (make-string 1 char)))))

(defun ian/fix-evil-stuff ()
  ;; there's probably some evil-define macro thing that I could do that
  ;; would do this for me
  (move-marker evil-visual-point (point))
  (move-marker evil-visual-mark (mark))
  )

(defun ian/resolve-visual-line ()
  (interactive)
  (when (eq (evil-visual-type) 'line)
    (let ((swap (eq evil-visual-direction -1)))
      (when swap (exchange-point-and-mark))

      (evil-visual-char)
      (when (not (eq (point) (point-max)))
        (previous-line 1)
        (evil-end-of-line)
        ;; because my end of line goes past the end...
        (evil-backward-char))

      (exchange-point-and-mark)
      (evil-first-non-blank)

      (when (not swap) (exchange-point-and-mark))
      (ian/fix-evil-stuff)
      )))

(defun ian/surround-with (open-string close-string)
  (ian/resolve-visual-line)
  (let* ((begin (min evil-visual-point evil-visual-mark))
         (end (max evil-visual-point evil-visual-mark))
         (backwards (< evil-visual-point evil-visual-mark)))
    (goto-char (+ end 1))
    (insert close-string)
    (goto-char begin)
    (insert open-string)
    (evil-visual-make-selection begin (+ end (length open-string) (length close-string)))
    (exchange-point-and-mark)
    (ian/fix-evil-stuff)
    ))

(defmacro ian/surrounder (open close)
  `(lambda ()
     (interactive)
     (ian/surround-with ,open ,close)))

;; this doesn't work right when operating on the last line in a file with no
;; newline at the end. oh well.
(defun ian/unsurround ()
  (interactive)
  (ian/resolve-visual-line)
  (let* ((begin (min evil-visual-point evil-visual-mark))
         (end (max evil-visual-point evil-visual-mark))
         (backwards (< evil-visual-point evil-visual-mark)))
    (goto-char end)
    (delete-char 1)
    (goto-char begin)
    (delete-char 1)
    (evil-visual-make-selection begin (- end 2))
    (when backwards (exchange-point-and-mark))
    (ian/fix-evil-stuff)
    ))

(defun ian/surround-prompt ()
  (interactive)
  (let* ((pair (evil-surround-pair (read-char)))
         (open (car pair))
         (close (cdr pair)))
    (ian/surround-with open close)))

(defun ian/normalize-selection-direction ()
  ;; When you enter visual character selection, the selection direction is
  ;; always forwards: the mark is before the character and the point is
  ;; after.
  ;;
  ;; But in the case that we enter selection, then immediately go backwards,
  ;; we want to keep the character our point was on selected -- it's very
  ;; annoying otherwise. So we detect the single-character selection case
  ;; and swap directions.
  (when (and (mark) (eq (point) (1+ (mark))))
    (exchange-point-and-mark)))

(defun ian/forward-word (arg)
  "Like forward-word, but behaves consistently with
forward-symbol when you have a visual selection."
  (interactive "^p")
  (if (natnump arg)
      (re-search-forward "\\sw+" nil 'move arg)
    (progn
      (ian/normalize-selection-direction)
      (while (< arg 0)
        (if (re-search-backward "\\sw+" nil 'move)
            (skip-syntax-backward "w"))
        (setq arg (1+ arg))))))

(defun ian/forward-symbol (arg)
  (interactive "^p")
  (if (natnump arg)
      (re-search-forward "\\(\\sw\\|\\s_\\)+" nil 'move arg)
    (progn
      (ian/normalize-selection-direction)
      (while (< arg 0)
        (if (re-search-backward "\\(\\sw\\|\\s_\\)+" nil 'move)
            (skip-syntax-backward "w_"))
        (setq arg (1+ arg))))))

(defun ian/backward-word ()
  (interactive)
  (let ((current-prefix-arg '(-1))) (call-interactively #'ian/forward-word)))

(defun ian/backward-symbol ()
  (interactive)
  (let ((current-prefix-arg '(-1))) (call-interactively #'ian/forward-symbol)))

(defun ian/point-is-in-initial-whitespace ()
  (and (or
        (eq (following-char) ?\n)
        (eq (char-syntax (following-char)) ?\s))
       (save-excursion
         (skip-chars-backward " \t")
         (= (current-column) 0)
         )))

(defun ian/seek-line-with-non-whitespace-at-column (dir col target)
  (let ((start (point)))
    (forward-line dir)
    (move-to-column col)
    (let ((point-in-whitespace (and
                                (not (eq (point) start))
                                (or (< (current-column) col)
                                    (ian/point-is-in-initial-whitespace)
                                    (eq (point) (point-at-eol))
                                    ))))

      (if (or (equal target -1) (not (equal target point-in-whitespace)))
          (ian/seek-line-with-non-whitespace-at-column dir col (not point-in-whitespace))
        (when target (goto-char start)))
      )))

(defun ian/vertical-search-up ()
  (interactive)
  (ian/seek-line-with-non-whitespace-at-column -1 (current-column) -1))

(defun ian/vertical-search-down ()
  (interactive)
  (ian/seek-line-with-non-whitespace-at-column 1 (current-column) -1))

;; Make it predictable in different modes.
;;
;; Also, this is kind of screwed up with mark-inside-quotes and ocaml comments.
;; It seem that "*)" is recognized as a "quote" character, and then it tries to
;; search backwards to find the starting "*)", which doesn't exist.
(defun ian/expand-region ()
  (interactive)
  (setq er/try-expand-list '(er/mark-word
                             er/mark-symbol
                             er/mark-comment
                             er/mark-inside-quotes
                             er/mark-outside-quotes
                             er/mark-inside-pairs
                             er/mark-outside-pairs
                             ))
  (call-interactively #'er/expand-region))

(defun ian/move-end-of-line ()
  (interactive)
  (skip-chars-forward "^\n"))

(defun ian/move-beginning-of-line ()
  (interactive)
  (ian/normalize-selection-direction)
  (let ((start (point)))
    (back-to-indentation)
    (when (eq start (point))
      (beginning-of-line))))

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (setq delete-by-moving-to-trash nil)

  (setq powerline-default-separator nil)
  (setq spaceline-responsive nil)
  ;; this is required after changing properties of powerline
  (spaceline-compile)

  (setq flycheck-indication-mode 'right-fringe)
  (setq flycheck-display-errors-delay 0.05)

  ;; make evil better
  (setq evil-move-cursor-back nil)
  (setq evil-want-fine-undo t)

  (setq swiper-goto-start-of-match t)

  ;; without this, the message "omitted 2 lines" constantly
  ;; takes over the minibuffer
  (setq dired-omit-verbose nil)

  ;; Without changing EDITOR, emacs tries to actually run vim inside itself.
  (setenv "EDITOR" "emacsclient")

  ;; this is too slow, so I disable it and use helm when I need autocomplete.
  (setq company-idle-delay nil)

  ;; make ivy usable
  (setq ivy-on-del-error-function #'ignore)
  (setq ivy-use-virtual-buffers nil)
  (setq ivy-re-builders-alist
        '((spacemacs/counsel-search . spacemacs/ivy--regex-plus)
          (swiper . identity)
          (t . ivy--regex-ignore-order)))
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "")

  ;; theoretically prevents emacs from opening new windows on me without asking
  (setq split-height-threshold nil)
  (setq split-width-threshold nil)

  (dolist (hook '(text-mode-hook prog-mode-hook))
    (add-hook hook 'spacemacs/toggle-truncate-lines-on))
  (add-hook 'text-mode-hook 'turn-on-auto-fill)

  (add-hook 'prog-mode-hook
            (lambda ()
              (setq-local comment-auto-fill-only-comments t)
              (turn-on-auto-fill)))

  ;; this prevents emacs from prompting me every time I edit my .spacemacs file
  (setq vc-follow-symlinks nil)
  (setq vc-handled-backends nil)

  ;; It's not extremely dramatic, but I think these behave better than the
  ;; standard evil motions
  (evil-global-set-key 'motion "e" 'ian/forward-word)
  (evil-global-set-key 'motion "b" 'ian/backward-word)
  (evil-global-set-key 'motion "E" 'ian/forward-symbol)
  (evil-global-set-key 'motion "B" 'ian/backward-symbol)

  ;; don't select the trailing newline
  (evil-global-set-key 'visual "$" 'ian/move-end-of-line)
  ;; toggle between hard and soft bol
  (evil-global-set-key 'motion "^" 'ian/move-beginning-of-line)

  ;; use swiper for incremental search -- need to figure out a more elegant
  ;; resume than this
  (define-key evil-normal-state-map "/" 'swiper)
  (define-key evil-normal-state-map "?" 'ivy-resume)
  (evil-global-set-key 'visual "/"
                       #'(lambda ()
                           (interactive)
                           (let ((input
                                  (buffer-substring-no-properties
                                   (region-beginning) (region-end))))
                             (evil-exit-visual-state)
                             (swiper input))))

  (define-key evil-normal-state-map "U" 'undo-tree-redo)
  (evil-global-set-key 'normal "gw" 'fill-paragraph)
  (evil-global-set-key 'insert (kbd "M-SPC") 'hippie-expand)

  (define-key ivy-minibuffer-map (kbd "C-r") 'ivy-previous-line)
  (define-key ivy-minibuffer-map (kbd "C-h") 'ivy-next-line)

  (comment
   (let ((keys '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o"
                 "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "[" "]" "$"
                 "%" "^" "(" ")")))
     (dolist (key (append keys (-map #'upcase keys)))
       (evil-global-set-key 'normal (kbd key) nil)
       (evil-global-set-key 'motion (kbd key) nil)
       (evil-global-set-key 'visual (kbd key) nil)
       (evil-global-set-key 'operator (kbd key) nil)
       (evil-define-key 'operator evil-surround-mode-map (kbd key) nil)
       (evil-define-key 'visual evil-surround-mode-map (kbd key) nil)
       ))

   (evil-global-set-key 'insert (kbd "M-SPC") 'hippie-expand)

   (evil-global-set-key 'normal [(return)] 'evil-open-below)
   (evil-global-set-key 'normal [(shift return)] 'evil-open-above)

   ;; Insertion commands
   (evil-global-set-key 'normal "e" 'evil-insert)
   (evil-global-set-key 'normal "E" 'ian/insert-char)
   (evil-global-set-key 'visual "e" 'evil-change)
   (evil-global-set-key 'visual "E" 'ian/change-to-one-char)
   (evil-global-set-key 'normal "u" 'spacemacs/paste-transient-state/evil-paste-before)
   ;; shift-paste = duplicate current line? or maybe there should be two
   ;; paste-buffers? hmm.
   (setq evil-kill-on-visual-paste nil)

   ;; Selection commands
   (evil-global-set-key 'normal "n" 'evil-visual-char)
   (evil-global-set-key 'normal "N" 'evil-visual-line)
   (evil-global-set-key 'visual "n" 'ian/expand-region)
   (evil-global-set-key 'visual "N" 'ian/evil-visual-line)
   (evil-global-set-key 'normal "y" 'ian/yank-line)
   (evil-global-set-key 'visual "y" 'evil-yank)
   (setq evil)

   ;; Deletion commands
   ;; TODO: should shift cause this to not cut? or to delete a single character?
   (evil-global-set-key 'normal "o" 'evil-delete-whole-line)
   (evil-global-set-key 'visual "o" 'evil-delete)

   ;; Meta commands
   (evil-global-set-key 'normal "i" 'undo-tree-undo)
   (evil-global-set-key 'normal "I" 'undo-tree-redo)

   (evil-global-set-key 'motion "r" 'evil-previous-visual-line)
   (evil-global-set-key 'motion "h" 'evil-next-visual-line)
   (evil-global-set-key 'motion "s" 'evil-backward-char)
   (evil-global-set-key 'motion "t" 'evil-forward-char)

   (evil-global-set-key 'motion "R" 'ian/vertical-search-up)
   (evil-global-set-key 'motion "H" 'ian/vertical-search-down)
   (evil-global-set-key 'motion "S" 'evil-find-char-backward)
   (evil-global-set-key 'motion "T" 'evil-find-char)
   (evil-global-set-key 'visual "S" 'evil-find-char-to-backward)
   (evil-global-set-key 'visual "T" 'evil-find-char-to)

   (evil-global-set-key 'motion "a" 'ian/move-beginning-of-line)
   (evil-global-set-key 'motion "A" 'evil-goto-first-line)
   (evil-global-set-key 'motion "g" 'ian/move-end-of-line)
   (evil-global-set-key 'motion "G" 'end-of-buffer)
   (evil-global-set-key 'motion "w" 'ian/forward-word)
   (evil-global-set-key 'motion "W" 'ian/forward-symbol)
   (evil-global-set-key 'motion "d" 'ian/backward-word)
   (evil-global-set-key 'motion "D" 'ian/backward-symbol)

   (evil-global-set-key 'motion "c" 'exchange-point-and-mark)

   (evil-global-set-key 'visual "(" 'ian/unsurround)
   (evil-global-set-key 'visual ")" (ian/surrounder "(" ")"))
   ;; (evil-global-set-key 'visual "'" (ian/surrounder "'" "'"))
   (evil-global-set-key 'visual "\"" (ian/surrounder "\"" "\""))
   ;; We have to unset this in order to use my custom visual mapping -- otherwise
   ;; it takes precedence.
   (evil-define-key 'visual evil-surround-mode-map "s" nil)
   (evil-global-set-key 'visual "'" 'ian/surround-prompt)

   ;; this makes my "call expand region in visual mode" not conflict with any
   ;; other bindings
   (setq expand-region-fast-keys-enabled nil)
   )

  (evil-global-set-key 'visual "(" 'ian/unsurround)
  (evil-global-set-key 'visual ")" (ian/surrounder "(" ")"))
  (evil-global-set-key 'visual "'" (ian/surrounder "'" "'"))
  (evil-global-set-key 'visual "\"" (ian/surrounder "\"" "\""))
  ;; We have to unset this in order to use my custom visual mapping -- otherwise
  ;; it takes precedence.
  (evil-define-key 'visual evil-surround-mode-map "s" nil)
  (evil-global-set-key 'visual "s" 'ian/surround-prompt)

  ;; A temporary import. something about using the prefix SPC v makes this
  ;; behave differently than a single keybinding. Dunno why.
  (evil-global-set-key 'visual "n" 'ian/expand-region)
  (setq expand-region-fast-keys-enabled nil)

  ;; in non-evil buffers, this closes all windows except the active one
  (global-unset-key [?\e ?\e ?\e])

  ;; these commands are super useful for dealing with omake status windows

  (spacemacs/declare-prefix "of" "fit")
  (spacemacs/set-leader-keys "off" 'fit-window-to-buffer)
  (spacemacs/set-leader-keys "ofk" 'ian/fit-window-up)
  (spacemacs/set-leader-keys "ofj" 'ian/fit-window-down)
  (spacemacs/set-leader-keys "ofh" 'ian/fit-window-left)
  (spacemacs/set-leader-keys "ofl" 'ian/fit-window-right)
  (dotimes (i 10)
    (eval `(spacemacs/set-leader-keys ,(format "of%i" i)
             (quote ,(intern (format "ian/fit-window-%i" i))))))

  (spacemacs/set-leader-keys "kU" 'evil-lisp-state-undo-tree-redo)
  (spacemacs/set-leader-keys "kK" 'evil-lisp-state-sp-backward-up-sexp)

  (setq truncate-partial-width-windows nil)
  (set-default 'truncate-lines t)

  (setq enable-recursive-minibuffers t)
  (setq markdown-hide-urls nil)

  ;; This actually does almost what we want now -- it automatically selects the
  ;; projectile root, not the file's directory. However it seems to be a
  ;; nightmare when editing a file outside of a projectile project, or when
  ;; opening an info buffer like customize or something. So... we still have to
  ;; disable it.
  (setq neo-autorefresh nil)

  ;; make neotree usable
  (setq neo-theme 'ascii)
  (setq neo-show-hidden-files nil)
  (let* ((exts (list "a" "cmi" "cmt" "cmti" "cmx" "cmxa" "deps" "o" "libdeps"
                     "ml-gen" "d" "out" "stub.names" "modules" "pack-order"
                     "moduledeps" "objdeps" "build_info.sexp" "hg_version.c"
                     "cmo" "cmo.js" "bc.js" "cma" "cma.js" "jsdeps"
                     "runtime.js"))
         (regexps (--map (concat "\\." (regexp-quote it) "$") exts)))
    (setq neo-hidden-regexp-list (cons "^\\." regexps))))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
