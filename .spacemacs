;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; echo "" | g++ -v -x c++ -E -
;;
;; ----------------------------------------------------------------
;; TASKS
;; ----------------------------------------------------------------
;;
;; 5. how to select rectangle
;; 6. How to fold code
;;
;;
;; ----------------------------------------------------------------
;; TIPS
;; ----------------------------------------------------------------
;;
;; 1. Add snippet for coding
;;    - DONE (configured automatically)
;; 2. Add autocomplete for header
;;    - DONE by configuration
;; 3. Add autocomplete for invoking
;;    - DONE by configuring ycmd
;;	| modify : -> ycmd-server-command '("python" "/Users/kevinzhong/git/ycmd/ycmd")
;; 4. Add code navigation
;;    - Generate TAGS in the root directory of your project
;;	| find . -name "*.cc" -or -name "*.c" -or -name "*.hh" -or -name "*.h"  | xargs etags --members --language=c++
;;    - Set TAGS for emacs
;;	| M-x visit-tags-table
;;      |  OR configure the tagfile in the configuration
;;         (setq tags-file-name "~/git/leveldb/TAGS")
;;    - Jump code
;;	| M-. ->
;;	| M-* <-
;;      | C-] ->
;;      | C-t <-
;;
;;    - GDB
;;      | M-x gdb
;; 7. Search in your project
;;    - SPC p f
;; 8. Restart Emacs
;;    - SPC q r
;; 9. Switch between hh and cc
;;    - SPC m g a
;; 10.Cscope
;;    - cscope -Rbkq
;;
;; ----------------------------------------------------------------
;; How to mark the area?
;; Ctrl-Shit-Space == mark set
;; M-w == settle mark
;;
;;
;; How to comment code?
;; SPACE-c l
;;
;;
;; How to show indent guide line
;; SPACE t i
;;
;; How to fold code?
;; zr za zm



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
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; LANGUAGE
     ;; ----------------------------------------------------------------
     ;;
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     cscope
     python
     java
     javascript
     html
     rust
     sql
     ;; eclim
     (chinese :variables
              chinese-enable-youdao-dict t)
     ;;
     ;; ----------------------------------------------------------------
     ;; TOOL
     ;; ----------------------------------------------------------------
     ;;
     helm
     osx
     ;;ivy
     ranger
     tmux
     dash
     games
     ;;spacemacs-helm
     semantic
     better-defaults
     emacs-lisp
     gtags
     fasd
     ;;eyebrowse
     deft
     ;;emoji
     spell-checking
     syntax-checking
     elfeed
     ;;
     ;; ----------------------------------------------------------------
     ;; VERSION CONTROL
     ;; ----------------------------------------------------------------
     ;;
     version-control
     git
     ;;
     ;; ----------------------------------------------------------------
     ;; DOCUMENT
     ;; ----------------------------------------------------------------
     ;;
     org
     markdown
     ;;
     ;; ----------------------------------------------------------------
     ;; VARIABLE
     ;; ----------------------------------------------------------------
     ;;
     ;; cat
     (colors :variables
             colors-enable-nyan-cat-progress-bar t
     )
     ;;
     ;; snippets
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      ;;auto-completion-enable-sort-by-usage t
     )
     ;; ycmd
     ;; (ycmd :variables
     ;;        ycmd-server-command '("python" "/Users/kevinzhong/git/ycmd/ycmd/")
     ;;        ycmd-extra-conf-whitelist '("/Users/kevinzhong/codes/qt/qtfirst/*")
     ;;        ycmd-global-config '("/path/to/global_config.py")
     ;;     ycmd-extra-conf-whitelist '("/Users/kevinzhong/git/leveldb/*")
     ;; )
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
   )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that will not be install and loaded.
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
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 10
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerlkne-scale 1.1)
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
   dotspacemacs-remap-Y-to-y$ nil
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
   dotspacemacs-fullscreen-at-startup t
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
   dotspacemacs-line-numbers nil
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
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;;(setq exec-path-from-shell-check-startup-files nil)

  (setq-default rust-enable-racer t)

  (setq racer-cmd "/Users/kevinzhong/.cargo/bin/racer")
  (setq racer-rust-src-path "/Users/kevinzhong/codes/rust/rustc-1.7.0/src")

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."



        ;; ----------------------------------------------------------------
        ;; GLOBAL
        ;; ----------------------------------------------------------------
        ;; indent-line
        ;;(setq-default indent-line ti)
        ;; (setq-default evil-escape-key-sequence "jj")
        ;; folding code
        ;;
        ;; no backup file
        (setq-default make-backup-files nil)
        ;; Disable auto save file
        (setq-default auto-save-default nil)
        ;; enable hungry-delete
        (global-hungry-delete-mode t)

        (evilified-state-evilify-map occur-mode-map :mode occur-mode)

        ;; company
        (global-company-mode t)

        ;;(set-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-propt))

        ;;(diminish 'global-whitespace-mode)

        ;;(setq ycmd-request-message-levedl -1)
        ;; SPC s p
        (setq helm-ag-insert-at-point 'symbol)

        (setq company-backends-c-mode-common '((company-c-headers
                                                ;;company-ycmd
                                                company-dabbrev-code
                                                company-dabbrev :with company-yasnippet
                                               ) company-files
                                              )
        )


        ;; display time
        (display-time)


        ;; neotree
        (global-set-key [f8] 'neotree-toggle)

        ;; line number
        (global-linum-mode t)

        ;; indent
        (setq inden-tabs-mode nil)
        (setq default-tab-width 8)
        (setq tab-width 8)
        (setq tab-stop-list())

        ;; imenu
        (setq imenu-sort-function 'imenu--sort-by-name)

        ;; Bind clang-format-region to C-M-tab in all modes:
        (global-set-key [C-M-tab] 'clang-format-region)
        ;; Bind clang-format-buffer to tab on the c++-mode only:
        (add-hook 'c++-mode-hook 'clang-format-bindings)
        (defun clang-format-bindings ()
          (define-key c++-mode-map [tab] 'clang-format-buffer))

        ;; define function
        (add-hook 'c-mode-hook 'linux-c-mode)
        (add-hook 'c++-mode-hook 'linux-c-mode)

        (defun linux-c-mode()
          (define-key c-mode-map [return] 'newline-and-indent)
          (interactive)
          (c-set-style "K&R")
          (c-toggle-hungry-state)
          (setq c-basic-offset 8)
          (setq c++-basic-offset 8)
          (imenu-add-menubar-index)
          (which-function-mode)
        )

        ;;(global-semantic-tag-folding-mode 1)
        ;; yasnippet
        (require 'yasnippet)
        (yas-global-mode 1)

        (require 'projectile)
        (projectile-global-mode)
        ;;(setq projectile-enable-caching t)

        (setq elfeed-feeds '(
                             "https://news.ycombinator.com/rss"
                             ;;"http://rss.cnbeta.com/rss"
                             )
        )
        ;; cedet
        (require 'cedet)
        (global-ede-mode t)
        ;; Enable EDE for a pre-existing C++ project
        ;; (ede-cpp-root-project "leveldb"
        ;;                      :file "/Users/kevinzhong/git/leveldb/README.md"
        ;;                      :include-path '(
        ;;                                      "/Users/kevinzhong/git/leveldb/include/"
        ;;                                      )
        ;;                      :system-include-path '(
        ;;                                             "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/"
        ;;                                             )
        ;; )


        (setq company-clang-arguments '(
                                        "-I/Users/kevinzhong/codes/qt/qtfirst/qtfirst"
                                        "-I /Users/kevinzhong/codes/qt/qtfirst/qtfirst/includes"
                                        )
        )
        (ede-cpp-root-project "qt"
                              :file "/Users/kevinzhong/codes/qt/qtfirst/README.md"
                              :include-path '(
                                              "/Users/kevinzhong/Qt5.6.0/5.6/"
                                              "/Users/kevinzhong/Qt5.6.0/5.6/src"
                                              "/Users/kevinzhong/Qt5.6.0/5.6/clang_64/lib"
                                              )
                              :system-include-path '(
                                                     "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/"
                                                     "/Users/kevinzhong/Qt5.6.0/5.6/clang_64/lib"
                                                     )
        )

        ;; (ede-cpp-root-project "sapc"
        ;;                       :file "~/SAPC/csapc/Epc_SA/main_page.hpp"
        ;;                       :include-path '("~/SAPC/csapc/Epc_SA")
        ;;                       :system-include-path '("/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include/"))

        ;; set TAGS file
        (setq tags-file-name "/Users/kevinzhong/codes/qt/qtfirst/GTAGS")
        ;; (setq tags-file-name "/Users/kevinzhong/SAPC/csapc/Epc_SA/GTAGS")
        ;; (setq tags-file-name "/Users/kevinzhong/git/leveldb/db/GTAGS")

        (set-face-attribute 'font-lock-function-name-face nil :weight 'bold)
        (set-face-attribute 'font-lock-type-face nil :weight 'semi-bold :slant 'italic)
        ;; (set-face-attribute 'font-lock-string-face nil :weight 'ultra-light :slant 'oblique :foreground '"medium sea green")
        ;; (set-face-attribute 'font-lock-string-face nil :weight 'ultra-light :slant 'oblique :foreground '"dark orange")
        (set-face-attribute 'font-lock-string-face nil :slant 'oblique :foreground '"medium sea green")
        ;; (set-face-attribute 'font-lock-reference-face nil :weight 'bold :slant 'italic)
        ;; (set-face-attribute 'font-lock-constant-face nil :weight 'bold :slant 'italic)
        ;; (set-face-attribute 'font-lock-variable-name-face nil :weight 'bold :slant 'italic)


        ;; Utility functions
        (defun bb/define-key (keymap &rest bindings)
          (declare (indent 1))
          (while bindings
            (define-key keymap (pop bindings) (pop bindings))))
        (bb/define-key evil-normal-state-map
                       "+" 'spacemacs/evil-numbers-increase
                       "_" 'spacemacs/evil-numbers-decrease
                       "\\" 'evil-repeat-find-char-reverse
                       "[s" (lambda (n) (interactive "p") (dotimes (c n nil) (insert " ")))
                       "]s" (lambda (n) (interactive "p")
                              (forward-char) (dotimes (c n nil) (insert " ")) (backward-char (1+ n))))

        (bb/define-key company-active-map
                       (kbd "C-w") 'evil-delete-backward-word)

        ;; http://emacsredux.com/blog/2014/04/05/which-function-mode/
        ;; when editing js file, this feature is very useful
        ;; (setq-default header-line-format
        ;;               '((which-func-mode ("" which-func-format " "))))

        (add-hook 'find-file-hook 'spacemacs/check-large-file)
        (spacemacs/toggle-automatic-symbol-highlight-on)

        ;; Don't move back the cursor one position when exiting insert mode
        (setq evil-move-cursor-back nil)

        (define-fringe-bitmap 'right-curly-arrow
          [#b00000000
           #b00000000
           #b00000000
           #b00000000
           #b01110000
           #b00010000
           #b00010000
           #b00000000])
        (define-fringe-bitmap 'left-curly-arrow
          [#b00000000
           #b00001000
           #b00001000
           #b00001110
           #b00000000
           #b00000000
           #b00000000
           #b00000000])










        ;; powerline
        (setq powerline-default-separator 'arrow)

        ;; Eclipse and eclim
        (setq eclim-eclipse-dirs "/Applications/Eclipse.app/Contents/Eclipse/"
              eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")








  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
