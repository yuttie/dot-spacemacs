;; -*- mode: emacs-lisp -*-
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
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; Checkers
     spell-checking
     syntax-checking
     ;; Completion
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t)
     helm
     ;; Emacs
     better-defaults
     org
     typography
     ;; Programming and markup languages
     asciidoc
     bibtex
     c-c++
     csv
     d
     emacs-lisp
     ess
     graphviz
     haskell
     html
     ipython-notebook
     javascript
     latex
     markdown
     nim
     ocaml
     php
     python
     (ruby :variables
           ruby-enable-enh-ruby-mode t)
     (rust :variables
           rust-enable-racer t)
     shell-scripts
     sql
     typescript
     vimscript
     yaml
     ;; Source control
     git
     (version-control :variables
                      version-control-diff-tool 'git-gutter+
                      version-control-global-margin t)
     ;; Spacemacs distribution layers
     (spacemacs-layouts :variables
                        spacemacs-layouts-directory "./")
     ;; Tags
     gtags
     ;; Tools
     deft
     nginx
     ;; Private layers
     hlinum
     hydrangea-theme
     auto-completion+
     highlight-symbol
     htmlize
     rainbow-mode
     ddskk
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     (evil-adjust :location (recipe :fetcher github :repo "troyp/evil-adjust"))
     (inertial-scroll :location (recipe :fetcher github :repo "kiwanami/emacs-inertial-scroll"))
     ;; theme
     twilight-bright-theme
     material-theme
     flatui-theme
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
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
   dotspacemacs-editing-style 'vim
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
   dotspacemacs-themes '(twilight-bright
                         material-light
                         flatui
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Midway"
                               :size 8.5
                               :weight normal
                               :width normal
                               :powerline-scale 1.25)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
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
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-maximized-at-startup nil
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
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'origami
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

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; Ignore a warning about PATH and MANPATH from exec-path-from-shell.el
  (setq exec-path-from-shell-check-startup-files nil)
  ;; Indentation for CC Mode
  (setq c-default-style
        '((java-mode . "java")
          (awk-mode  . "awk")
          (other     . "bsd")))
  (setq-default c-basic-offset 4)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Add fallback fonts to the default fontset.
  ;; The second argument NAME must be `t' so that these fallback fonts are used
  ;; not only in the initial frame but also in subsequent frames.
  ;; (set-fontset-font t 'unicode "octicons" nil 'prepend)
  ;; (set-fontset-font t 'unicode "FontAwesome" nil 'prepend)
  ;; (set-fontset-font t 'unicode "icomoon" nil 'prepend)
  ;; (set-fontset-font t 'unicode "seti" nil 'prepend)
  ;; (set-fontset-font t 'unicode "PowerlineSymbols" nil 'prepend)
  ;; (set-fontset-font t 'unicode "Midway Nerd Font" nil 'prepend)
  ;; (set-fontset-font t 'unicode "Source Han Code JP" nil 'prepend)
  (set-fontset-font t 'unicode "M+ 1m" nil 'prepend)
  ;; Adjust the relative size of the Japanese font to the default font
  (add-to-list 'face-font-rescale-alist (cons (rx "M+ 1m") 1.2))
  ;; C-h
  (define-key key-translation-map (kbd "C-h") (kbd "DEL"))
  ;; Escape
  (setq-default evil-escape-key-sequence "wj")
  ;; Swap C-x and C-t
  (defun swap-C-x-and-C-t (frame)
    (with-selected-frame frame
      (keyboard-translate ?\C-t ?\C-x)
      (keyboard-translate ?\C-x ?\C-t)))
  (swap-C-x-and-C-t (selected-frame))
  (add-hook 'after-make-frame-functions #'swap-C-x-and-C-t)
  ;; Scroll
  (setq scroll-margin 3)
  ;; Evil
  (setq evil-want-fine-undo nil)
  (define-key evil-insert-state-map (kbd "C-a") #'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-e") #'move-end-of-line)
  (define-key evil-motion-state-map   (kbd "<remap> <evil-next-line>")     #'evil-next-visual-line)
  (define-key evil-motion-state-map   (kbd "<remap> <evil-previous-line>") #'evil-previous-visual-line)
  (define-key evil-operator-state-map (kbd "<remap> <evil-next-line>")     #'evil-next-line)
  (define-key evil-operator-state-map (kbd "<remap> <evil-previous-line>") #'evil-previous-line)
  ;; company-mode
  (setq company-tooltip-align-annotations t)
  (define-key company-active-map (kbd "C-n") #'company-simple-complete-next)
  (define-key company-active-map (kbd "C-p") #'company-simple-complete-previous)
  ;; Helm
  ;; Break ties by lexicographic order
  (defun my-helm-generic-sort-fn (s1 s2)
    "Sort predicate function for helm candidates.
Args S1 and S2 can be single or \(display . real\) candidates,
that is sorting is done against real value of candidate."
    (let* ((qpattern (regexp-quote helm-pattern))
           (reg1  (concat "\\_<" qpattern "\\_>"))
           (reg2  (concat "\\_<" qpattern))
           (reg3  helm-pattern)
           (split (split-string helm-pattern))
           (str1  (if (consp s1) (cdr s1) s1))
           (str2  (if (consp s2) (cdr s2) s2))
           (score (lambda (str r1 r2 r3 lst)
                    (+ (if (string-match (concat "\\`" qpattern) str) 1 0)
                       (cond ((string-match r1 str) 5)
                             ((and (string-match " " qpattern)
                                   (string-match
                                    (concat "\\_<" (regexp-quote (car lst))) str)
                                   (cl-loop for r in (cdr lst)
                                            always (string-match r str))) 4)
                             ((and (string-match " " qpattern)
                                   (cl-loop for r in lst
                                            always (string-match r str))) 3)
                             ((string-match r2 str) 2)
                             ((string-match r3 str) 1)
                             (t 0)))))
           (sc1 (funcall score str1 reg1 reg2 reg3 split))
           (sc2 (funcall score str2 reg1 reg2 reg3 split)))
      (cond ((or (zerop (string-width qpattern))
                 (and (zerop sc1) (zerop sc2)))
             (string-lessp str1 str2))
            ((= sc1 sc2)
             (string-lessp str1 str2))
            (t (> sc1 sc2)))))
  (defun my-helm-fuzzy-matching-default-sort-fn (candidates _source &optional use-real)
    "The transformer for sorting candidates in fuzzy matching.
It sorts on the display part by default.

Sorts CANDIDATES by their scores as calculated by
`helm-score-candidate-for-pattern'. Ties in scores are sorted by
length of the candidates. Set USE-REAL to non-`nil' to sort on the
real part."
    (if (string= helm-pattern "")
        candidates
      (let ((table-scr (make-hash-table :test 'equal)))
        (sort candidates
              (lambda (s1 s2)
                ;; Score and measure the length on real or display part of candidate
                ;; according to `use-real'.
                (let* ((real-or-disp-fn (if use-real #'cdr #'car))
                       (cand1 (if (consp s1)
                                  (funcall real-or-disp-fn s1)
                                s1))
                       (cand2 (if (consp s2)
                                  (funcall real-or-disp-fn s2)
                                s2))
                       (data1 (or (gethash cand1 table-scr)
                                  (puthash cand1
                                           (list (helm-score-candidate-for-pattern
                                                  cand1 helm-pattern)
                                                 (length (helm-stringify cand1)))
                                           table-scr)))
                       (data2 (or (gethash cand2 table-scr)
                                  (puthash cand2
                                           (list (helm-score-candidate-for-pattern
                                                  cand2 helm-pattern)
                                                 (length (helm-stringify cand2)))
                                           table-scr)))
                       (str1 (if (stringp s1) s1 (car s1)))
                       (str2 (if (stringp s2) s2 (car s2)))
                       (scr1 (car data1))
                       (scr2 (car data2)))
                  (cond ((= scr1 scr2)
                         (string-lessp str1 str2))
                        ((> scr1 scr2)))))))))
  (advice-add 'helm-generic-sort-fn :override #'my-helm-generic-sort-fn)
  (advice-add 'helm-fuzzy-matching-default-sort-fn :override #'my-helm-fuzzy-matching-default-sort-fn)
  ;; disable flycheck-pos-tip-mode temporarily during completion
  (defvar-local company-flycheck-pos-tip-mode-on-p nil)
  (defun company-turn-off-flycheck-pos-tip (&rest ignore)
    (when (boundp 'flycheck-pos-tip-mode)
      (setq company-flycheck-pos-tip-mode-on-p flycheck-pos-tip-mode)
      (when flycheck-pos-tip-mode (flycheck-pos-tip-mode -1))))
  (defun company-maybe-turn-on-flycheck-pos-tip (&rest ignore)
    (when company-flycheck-pos-tip-mode-on-p (flycheck-pos-tip-mode 1)))
  (add-hook 'company-completion-started-hook 'company-turn-off-flycheck-pos-tip)
  (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-flycheck-pos-tip)
  (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-flycheck-pos-tip)
  ;; indent-guide
  (setq indent-guide-delay 0.1)
  (setq indent-guide-recursive t)
  (add-hook 'prog-mode-hook #'indent-guide-mode)
  ;; git-gutter+
  (setq git-gutter+-diff-options '("--compaction-heuristic"))
  (setq git-gutter-fr+-side 'left-fringe)
  ;; Tramp
  (setq tramp-shell-prompt-pattern "\\(?:^\\|\\)[^]#$%>\n]*#?[]#$%>] *\\(\\[[0-9;]*[a-zA-Z] *\\)*")
  ;; inertial-scroll
  (use-package inertial-scroll
    :config
    (setq inertias-initial-velocity 60)
    (setq inertias-initial-velocity-wheel 30)
    (setq inertias-update-time (/ 1000.0 60))
    (setq inertias-rest-coef 0)
    (setq inertias-rebound-flash nil)
    (setq inertias-global-minor-mode-map
          (inertias-define-keymap
           '(("<next>"  . inertias-up)
             ("<prior>" . inertias-down)
             ("<wheel-up>"   . inertias-down-wheel)
             ("<wheel-down>" . inertias-up-wheel)
             ("<mouse-4>"    . inertias-down-wheel)
             ("<mouse-5>"    . inertias-up-wheel))
           inertias-prefix-key))
    (inertias-global-minor-mode)  ; if comes before map, mapping doesn't work
                                        ;(global-set-key (vector mouse-wheel-down-event) #'inertias-down)
                                        ;(global-set-key (vector mouse-wheel-up-event)   #'inertias-up)

    (with-eval-after-load 'evil
      (evil-declare-not-repeat #'inertias-up)
      (evil-declare-not-repeat #'inertias-down)
      (define-key evil-normal-state-map (kbd "C-f") #'inertias-up)
      (define-key evil-normal-state-map (kbd "C-b") #'inertias-down)))
  (use-package evil-adjust
    :config
    (evil-adjust))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mmm-default-submode-face ((t (:background "gray97")))))
