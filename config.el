;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Paco Ávila"
      user-mail-address "pacoavila@ymail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq doom-font (font-spec :family "monospace" :size 14)
      doom-variable-pitch-font (font-spec :family "sans"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Dropbox/2020/gtd/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


;; GTD
;;
;; Las configuraciones de doom para org-mode pisan a las configuradas aquí.
;; Para que tengan efecto habrá que cargarlas después de que org se cargue.
;; https://github.com/hlissner/doom-emacs/issues/1391


 (after! org
  (setq org-agenda-files
        '("~/Dropbox/2020/gtd/inbox.org"
          "~/Dropbox/2020/gtd/gtd.org"
          "~/Dropbox/2020/gtd/tickler.org"))
  (setq org-capture-templates
        '(("t" "Todo [inbox]" entry
           (file+headline "~/Dropbox/2020/inbox.org" "Tasks")
           "* TODO %i%?")
          ("T" "Tickler" entry
           (file+headline "~/Dropbox/2020/gtd/tickler.org" "Tickler")
           "* %i%? \n %U")))
  (setq org-refile-targets
        '(("~/Dropbox/2020/gtd/gtd.org" :maxlevel . 3)
          ("~/Dropbox/2020/gtd/someday.org" :level . 1)
          ("~/Dropbox/2020/gtd/tickler.org" :maxlevel . 2)))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "Esperando(e)" "En curso(m)"
                    "|" "DONE(d)" "Cancelado(c)")))

  (add-hook 'calendar-load-hook
            (lambda ()
              (calendar-set-date-style 'iso f)))

  (setq calendar-week-start-day 1
        calendar-day-name-array ["domingo" "lunes" "martes" "miércoles"
                                 "jueves" "viernes" "sábado"]
        calendar-month-name-array ["enero" "febrero" "marzo" "abril" "mayo"
                                   "junio" "julio" "agosto" "septiembre"
                                   "octubre" "noviembre" "diciembre"])
  )

;; projectile
;;
(setq
 projectile-project-search-path `("~/Dropbox/Apuntes/")
 )
