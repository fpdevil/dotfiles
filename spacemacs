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
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     osx
     go
     (javascript :variables
                 tern-command '("node" "/usr/local/bin/tern")
                 javascript-disable-tern-port-files nil)
     html
     clojure
     (c-c++ :variables
            c-c++-enable-clang-support t
            c-c++-default-mode-for-headers 'c++-mode)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     vimscript
     ;vim-powerline
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-complete-mode t)
     better-defaults
     emacs-lisp
     git
     markdown
     (org :variables
          org-enable-reveal-js-support t
          org-enable-github-support t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     (colors :variables
             colors-enable-rainbow-identifiers t)
     erlang
     elixir
     (haskell :variables
              haskell-enable-company-mode t
              haskell-enable-ghc-mod-support t
              haskell-completion-backend 'company-ghc
              haskell-process-type 'ghci
              haskell-enable-hindent-style "johan-tibell")
     (python :variables
             python-enable-yapf-format-on-save t
             python-sort-imports-on-save t)
     (geolocation :variables
                  geolocation-enable-location-service t
                  geolocation-enable-weather-forecast t)
     version-control
     scala
     themes-megapack
     imenu-list
     command-log
     plantuml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     dired+
     shm
     ycmd
     company-ycmd
     flycheck-ycmd
     edts
     tern
     tern-auto-complete
     company-tern
    )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

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
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         majapahit-dark
                         spacemacs-light
                         material-light
                         zonokai-blue
                         sanityinc-solarized-light
                         zenburn
                         sanityinc-tomorrow-day
                         spacemacs-dark
                         majapahit-light
                         spolsky
                         farmhouse-light
                         monokai
                         cherry-blossom
                         cyberpunk
                         material
                         molokai
                         grandshell
                       )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco for Powerline"
                               :size 12
                               :weight extra-light
                               :width normal
                               :powerline-scale 1.1)
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
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
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
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; tool bar and menu bar
  (tool-bar-mode 1)
  (menu-bar-mode 1)
  ;; environment
  (setq exec-path-from-shell-arguments '("-l"))
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  ;; custom settings
  ;; write custom settings to a separate file instead of this
  (setq custom-file (expand-file-name ".custom-settings.el" (concat user-emacs-directory "/tmp")))
  (when (file-exists-p custom-file)
    (load custom-file))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; for erlang                                                            ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq erlang-root-dir "/usr/local/opt/erlang/lib/erlang")
  (setq exec-path-from-shell-check-startup-files nil)
  (set 'erlang-bin (concat erlang-root-dir "/bin/"))
  (set 'erlang-lib (concat erlang-root-dir "/lib/"))

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; if company mode is needed un-coment this
  (global-company-mode)

  ;; for Powerline separator
  (setq powerline-default-separator 'arrow)

  ;; org clock mode line support
  (setq spaceline-org-clock-p t)

  ;; javascript settings
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)

  ;; Erlang
  (add-to-list 'exec-path (cons erlang-bin exec-path))
  (add-hook 'after-init-hook 'my-after-init-hook)
  (defun my-after-init-hook ()
    (require 'edts-start))
  ;; handle the xemacs warnings
  (defconst erlang-xemacs-p (string-match "Lucid\\|XEmacs" emacs-version)
    "Non-nil when running under XEmacs or Lucid Emacs.")

  (defvar erlang-xemacs-popup-menu '("Erlang Mode Commands" . nil)
    "Common popup menu for all buffers in Erlang mode. This variable is
  destructively modified every time the Erlang menu is modified. The
  effect is that all changes take effect in all buffers in Erlang mode,
  just like under GNU Emacs. Never EVER set this variable!")

  ;; Wrangler Erlang refactorer
  (add-to-list 'load-path "/usr/local/lib/erlang/lib/wrangler-1.2.0/elisp")
  (require 'wrangler)

  (spacemacs/declare-prefix-for-mode 'erlang-mode "w" "wrangler-prefix")
  (spacemacs/set-leader-keys-for-major-mode 'erlang-mode "wt" 'toggle-erlang-wrangler)
  (spacemacs/declare-prefix-for-mode 'erlang-mode "r" "refactor-prefix")
  (spacemacs/set-leader-keys-for-major-mode 'erlang-mode "rrm" 'erl-refactor-rename-mod)
  (spacemacs/set-leader-keys-for-major-mode 'erlang-mode "rrf" 'erl-refactor-rename-fun)
  (spacemacs/set-leader-keys-for-major-mode 'erlang-mode "rrv" 'erl-refactor-rename-var)
  (spacemacs/set-leader-keys-for-major-mode 'erlang-mode "rn" 'erl-refactor-inline-variable)
  (spacemacs/set-leader-keys-for-major-mode 'erlang-mode "rv" 'erl-refactor-new-variable)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; for haskell                                                           ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-to-list 'exec-path "~/Library/Haskell/bin/")
  (add-hook 'haskell-mode-hook 'structured-haskell-mode)
  (add-hook 'haskell-mode-hook 'inf-haskell-mode)
  (setq haskell-enable-shm-support t
        company-ghc-turn-on-autoscan t
        shm-use-presentation-mode t
        haskell-tags-on-save nil
        flycheck-disabled-checkers 'haskell-ghc
        flycheck-haskell-hlint-executable "~/Library/Haskell/bin/hlint"
        flycheck-checker 'haskell-hlint)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; sunshine geo location settings
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq sunshine-appid "e8ec8a2a343baa242eae803d07568d46"
        sunshine-units 'metric
        sunshine-show-icons t
        sunshine-location "Hyderabad, India")


  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Python & YouCompleteMe configuration setup                            ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (add-hook 'python-mode-hook 'py-yapf-enable-on-save)
  (setq python-shell-interpreter "/usr/local/bin/ipython3")
  (setq python-check-command "/usr/local/bin/pyflakes")



  (let ((ycmd-dir (expand-file-name "private/.ycmd/" user-emacs-directory)))
    (if (not (file-exists-p ycmd-dir))
        (progn
          (message "Cloning and building YCMD...")
          (setenv "EXTRA_CMAKE_ARGS"
                  "-DEXTERNAL_LIBCLANG_PATH=/opt/software/clang+llvm-3.9.0-x86_64-apple-darwin/lib/libclang.dylib")
          (shell-command (concat "git clone --recursive "
                                 "https://github.com/Valloric/ycmd.git "
                                 ycmd-dir
                                 " && cd "
                                 ycmd-dir
                                 " && python3 build.py "
                                 "--clang-completer "
                                 "--system-libclang "
                                 "--gocode-completer "
                                 "--tern-complete"))
          (message "ycmd build/compile done..."))
      (message "YCMD already exists; not cloning"))
    (set-variable 'ycmd-server-command
                  (list "python3" (concat ycmd-dir "ycmd/"))))
  (set-variable 'ycmd-extra-conf-whitelist '("~/sw/programming/python/*"))
  (set-variable 'ycmd-global-modes 'all)
  (set-variable 'ycmd-parse-conditions
                '(save new-line mode-enabled idle-change buffer-focus))
  (set-variable 'ycmd-global-config "/Users/sampathsingamsetty/sw/programming/python/YouCompleteMe/.ycm_extra_conf.py")
  (set-variable 'ycmd-python-binary-path "/usr/local/bin/python3")
  (setq ycmd-extra-conf-handler 'load)
  (add-hook 'ycmd-mode-hook 'company-ycmd-setup)
  (add-hook 'ycmd-mode-hook 'flycheck-ycmd-setup)
  (add-hook 'after-init-hook 'global-ycmd-mode)
  (company-ycmd-setup)

  (add-hook 'python-mode-hook
            (lambda () (add-to-list 'flycheck-disabled-checkers 'ycmd)))


  ;; ***** old ycmd setup start *****
  ;; (add-hook 'ycmd-mode-hook 'company-ycmd-setup)
  ;; (add-hook 'ycmd-mode-hook 'flycheck-ycmd-setup)
  ;; ;(global-ycmd-mode)
  ;; (company-ycmd-setup)

  ;; (set-variable 'ycmd-global-config "")
  ;; (set-variable
  ;;  'ycmd-server-command
  ;;  '("python3" "/Users/sampathsingamsetty/sw/programming/python/YouCompleteMe/third_party/ycmd/ycmd"))
  ;; (set-variable 'ycmd-extra-conf-whitelist
  ;;               '("/Users/sampathsingamsetty/sw/programming/*"))
  ;; (set-variable 'ycmd-global-modes 'all)
  ;; (set-variable 'ycmd-parse-conditions
  ;;               '(save new-line mode-enabled idle-change buffer-focus))

  ;; (set-variable 'ycmd-global-config "/Users/sampathsingamsetty/sw/programming/python/YouCompleteMe/.ycm_extra_conf.py")
  ;; (set-variable 'ycmd-python-binary-path "/usr/local/bin/python3")

  ;; (global-flycheck-mode)

  ;; (add-hook 'python-mode-hook
  ;;           (lambda () (add-to-list 'flycheck-disabled-checkers 'ycmd)))
  ;; ***** old ycmd end *****


  ;;---------------------------------------------------------------------
  ;; org-mode settings
  ;;---------------------------------------------------------------------
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  (setq org-hide-emphasis-markers t)
  (add-hook 'org-mode-hook #'adaptive-wrap-prefix-mode)
  (add-hook 'org-mode-hook #'visual-line-mode)

  ;;---------------------------------------------------------------------
  ;; org-babel settings
  ;;---------------------------------------------------------------------
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((clojure    . t)
     (sh         . t)
     (emacs-lisp . t)
     (python     . t)
     (java       . t)
     (js         . t)
     (C          . t)
     (ditaa      . t)
     (plantuml   . t)
     (dot        . t)))

  ;; make dot work as graphviz-dot
  (add-to-list 'org-src-lang-modes '("dot" . graphviz-dot))

  ;; ob-plantuml settings
  (setq org-plantuml-jar-path
        (expand-file-name "/usr/local/Cellar/plantuml/1.2017.14/libexec/plantuml.jar"))

  ;; Location where homebrew installed the ditaa
  (setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.10/libexec/ditaa0_10.jar")

  ;;---------------------------------------------------------------------
  ;; tern for js
  ;;---------------------------------------------------------------------
  (add-hook 'js-mode-hook (lambda () (tern-mode t)))
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-tern))

  ;; for auto-complete mode
  ;;(eval-after-load 'tern
  ;;  '(progn
  ;;     (require 'tern-auto-complete)
  ;;     (tern-ac-setup)))

  ;;---------------------------------------------------------------------
  ;; dired+
  ;;---------------------------------------------------------------------
  ;(setq dired-listing-switches "-lhgoBF --group-directories-first")
  (setq dired-listing-switches "-lhgoBF")
  (setq diredp-toggle-find-file-reuse-dir t)
  (eval-after-load "dired" '(progn
                              (define-key dired-mode-map (kbd "q") 'kill-this-buffer)
                              (define-key dired-mode-map (kbd "h") 'dired-up-directory)
                              (define-key dired-mode-map (kbd "l") 'dired-find-alternate-file)
                              (define-key dired-mode-map (kbd "o") 'dired-sort-toggle-or-edit)
                              (define-key dired-mode-map (kbd "v") 'dired-toggle-marks)
                              (define-key dired-mode-map (kbd "m") 'dired-mark)
                              (define-key dired-mode-map (kbd "u") 'dired-unmark)
                              (define-key dired-mode-map (kbd "U") 'dired-unmark-all-marks)
                              (define-key dired-mode-map (kbd "c") 'dired-create-directory)
                              ))

  (defadvice dired-advertised-find-file (around dired-subst-directory activate)
    "Replace current buffer if file is a directory."
    (interactive)
    (let ((orig (current-buffer))
          (filename (dired-get-filename)))
      ad-do-it
      (when (and (file-directory-p filename)
                 (not (eq (current-buffer) orig)))
        (kill-buffer orig))))

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
