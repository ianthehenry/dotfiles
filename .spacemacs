;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
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
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers '(
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     auto-completion
     emacs-lisp
     git
     haskell
     html
     ivy
     janet
     javascript
     markdown
     neotree
     nginx
     ;ocaml
     org
     purescript
     python
     ruby
     rust
     version-control
     yaml
   )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
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
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
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
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-night
                         spacemacs-dark
                         solarized-light)

   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Menlo"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1
                               )

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
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
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
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
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

;(evil-define-command ian/insert-char (count char)
;  (interactive "<c><C>")
;  (setq count (or count 1))
;  (save-excursion
;    (insert (make-string count char))
;    ))
;
;(evil-define-command ian/change-to-one-char (char)
;  (interactive "<C>")
;  (call-interactively 'evil-delete)
;  (save-excursion
;    (insert (make-string 1 char))))

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

(defun ian/get-janet-project-root (dir)
  (cond
   ((string-equal dir "/") nil)
   ((file-exists-p (file-name-concat dir "project.janet")) dir)
   ((ian/get-janet-project-root (file-name-directory (directory-file-name dir))))))

(defvar ian/selected-janet-test-marker nil)

(defun ian/selected-test-filename ()
  (if (null ian/selected-janet-test-marker)
    buffer-file-name
    (with-current-buffer (marker-buffer ian/selected-janet-test-marker)
      buffer-file-name)))

(defun ian/selected-test-selector ()
  (if (null ian/selected-janet-test-marker)
    buffer-file-name
    (let ((marker ian/selected-janet-test-marker))
      (with-current-buffer (marker-buffer marker)
        (let ((pos (marker-position marker)))
          (save-excursion
            (goto-char pos)
            (format "%s:%d:%d"
                    buffer-file-name
                    (line-number-at-pos)
                    (+ (current-column) 1) ; judge expects both lines and cols to be 1-indexed
                    )))))))

(defun ian/janet-test-clear-selection ()
  (interactive)
  (setq ian/selected-janet-test-marker nil)
  (message "cleared test selection"))

(defun ian/janet-test-select ()
  (interactive)
  (setq ian/selected-janet-test-marker (point-marker))
  (message "selected test: %s"
           (file-relative-name
            (ian/selected-test-selector)
            (ian/get-janet-project-root
             (directory-file-name (ian/selected-test-filename))))))

(defun ian/escape-shell-command (&rest args)
  (string-join (--map (shell-quote-argument it) args) " "))

(defun ian/make-process-sentinel (on-exit)
  (lambda (process event)
     (when (memq (process-status process) '(exit signal))
      (funcall on-exit (process-exit-status process))
      ; (shell-command-sentinel process signal)
      )))

(defun ian/run-judge (filename test-selectors on-exit &rest args)
  (let*
      ((project-dir (ian/get-janet-project-root (file-name-directory filename)))
       (selector-args (--map (file-relative-name it project-dir) test-selectors))
       (args (cons (file-name-concat project-dir "jpm_tree/bin/judge") (append selector-args args))))
    (let ((output-buffer (get-buffer-create "*Verdict*")))
      (if-let ((existing-proc (get-buffer-process output-buffer)))
          (kill-process existing-proc))
      (with-current-buffer output-buffer
        (erase-buffer)
        ; beginning-of-buffer doesn't work if the first chars are invisible,
        ; or something. so we make sure there's some text at the beginning
        ; that we can definitely select
        (insert "\n")
        (shell-mode))
      (display-buffer output-buffer)
      (let ((process (apply #'start-process "judge" output-buffer args))
            (sentinel (ian/make-process-sentinel (apply-partially on-exit output-buffer filename))))
        (set-process-filter process 'comint-output-filter)
        (when (process-live-p process)
          (set-process-sentinel process sentinel))))))

(defun ian/janet-accept (test-filename)
  (let ((corrected-filename (concat test-filename ".tested")))
    (if (file-exists-p corrected-filename)
        (progn
          (message "rename %s" buffer-file-name)
          (rename-file corrected-filename test-filename t)
          (when (string= buffer-file-name test-filename)
            (ian/revert-with-highlight)))
      (message "%s not found" corrected-filename))))

(defun ian/janet-test-accept ()
  (interactive)
  (ian/janet-accept (ian/selected-test-filename)))

(defun ian/diff-or-whatever (output-buffer filename exit-status)
  (with-current-buffer output-buffer
    (cond
      ((= exit-status 0) (insert "all tests passed"))
      ((= exit-status 1)
       (erase-buffer)
       (diff-no-select filename (concat filename ".tested") nil t (current-buffer)))
      ((= exit-status 2) nil))
    (whitespace-mode 0)
    (setq buffer-read-only nil)
    (dolist (window (get-buffer-window-list))
      (fit-window-to-buffer window 10))))

(defun ian/janet-accept-or-report (output-buffer filename exit-status)
  (when (= exit-status 1) (ian/janet-accept filename))
  (with-current-buffer output-buffer
    (display-buffer (current-buffer))
    (dolist (window (get-buffer-window-list))
      (fit-window-to-buffer window 10))
    (beginning-of-buffer)
    (evil-normal-state)))

(defface ian/judge-flash-face
  '((((class color)) (:background "slate blue"))
    (t (:inverse-video t)))
  "Face for highlighting revert differences."
  :group 'ian/judge)

(defun ian/flash (bounds)
  (let ((overlay (make-overlay (car bounds) (cadr bounds))))
    (overlay-put overlay 'face 'ian/judge-flash-face)
    (run-with-timer 0.5 nil (lambda () (delete-overlay overlay)))))

(defun ian/revert-with-highlight ()
  (let ((before (buffer-string))
        (actual-buffer (current-buffer)))
    (revert-buffer t t t)
    (with-temp-buffer
      (let ((before-buffer (current-buffer)))
        (insert before)
        (with-current-buffer actual-buffer
          (save-excursion
            (highlight-compare-buffers actual-buffer before-buffer)
            (let ((changed-regions
                   (--map
                    (list (overlay-start it) (overlay-end it))
                    (--filter (overlay-get it 'hilit-chg)
                              (overlays-in (point-min) (point-max))))))
              (highlight-changes-mode 0)
              (dolist (region changed-regions)
                (ian/flash region))))
          )))))

(defun ian/janet-test-run-and-diff ()
  (interactive)
  (if (buffer-modified-p) (call-interactively 'save-buffer))
  (ian/run-judge
   (ian/selected-test-filename)
   (list (ian/selected-test-selector))
   #'ian/diff-or-whatever))

(defun ian/janet-test-run-and-accept ()
  (interactive)
  (if (buffer-modified-p) (call-interactively 'save-buffer))
  (ian/run-judge
    (ian/selected-test-filename)
    (list (ian/selected-test-selector))
    #'ian/janet-accept-or-report))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq auto-completion-private-snippets-directory "~/local/snippets")
  (setq evil-search-module 'evil-search))

(defmacro comment (&rest _) nil)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq delete-by-moving-to-trash nil)

  (setq powerline-default-separator nil)
  (setq spaceline-responsive nil)
  ;; this is required after changing properties of powerline
  (spaceline-compile)

  (setq flycheck-indication-mode 'right-fringe)
  (setq flycheck-display-errors-delay 0.05)

  ;; make evil better
  (setq evil-move-cursor-back nil)
  (setq evil-move-beyond-eol t)
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

  (add-hook 'after-revert-hook
            (lambda ()
              (when (bound-and-true-p iimage-mode)
                (iimage-mode 0)
                (iimage-mode 1))))

  (dolist (hook '(text-mode-hook prog-mode-hook))
    (add-hook hook 'spacemacs/toggle-truncate-lines-on))
  (add-hook 'text-mode-hook 'turn-on-auto-fill)

  (add-hook 'prog-mode-hook
            (lambda ()
              (setq-local comment-auto-fill-only-comments t)
              (turn-on-auto-fill)))

  (add-hook 'smartparens-mode-hook
            (lambda ()
              (sp-local-pair 'janet-mode "'" nil :actions nil)))

  ;; (add-hook 'janet-mode-hook
  ;;           (lambda ()
  ;;             (setq-local indent-line-function #'indent-relative)
  ;;             ;(setq-local lisp-indent-function nil)
  ;;           ))

  (spacemacs/set-leader-keys-for-major-mode 'janet-mode "ts" 'ian/janet-test-select)
  (spacemacs/set-leader-keys-for-major-mode 'janet-mode "tc" 'ian/janet-test-clear-selection)
  (spacemacs/set-leader-keys-for-major-mode 'janet-mode "tr" 'ian/janet-test-run-and-diff)
  (spacemacs/set-leader-keys-for-major-mode 'janet-mode "ta" 'ian/janet-test-accept)
  (spacemacs/set-leader-keys-for-major-mode 'janet-mode "tt" 'ian/janet-test-run-and-accept)

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

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

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
