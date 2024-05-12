;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))

;; Enable signature check
;;(setq package-check-signature nil)

;; Start Emacs as a server
;;(when (system-is-linux)
;;    (require 'server)
;;    (unless (server-running-p)
;;        (server-start))) ;; запустить Emacs как сервер, если ОС - GNU/Linux

;; My name and e-mail adress for a e-mail client
;;(setq user-full-name   "%user-name%")
;;(setq user-mail-adress "%user-mail%")

;; Imenu - navigate to code a file
(require 'imenu)
(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f6>") 'imenu) ;; вызов Imenu на F6

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")

;; Org-mode settings
(require 'org) ;; Вызвать org-mode
(global-set-key "\C-ca" 'org-agenda) ;; поределение клавиатурных комбинаций для внутренних
(global-set-key "\C-cb" 'org-iswitchb) ;; подрежимов org-mode
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . Org-mode)) ;; ассоциируем *.org файлы с org-mode

;; Inhibit startup/splash screen
;;(setq inhibit-splash-screen   t)
;;(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()


;; Electric-modes settings
;;(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
;;(electric-indent-mode -1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

;; Coding-system settings
(set-language-environment 'UTF-8)
(if (system-is-linux) ;; для GNU/Linux кодировка utf-8
    (progn
        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default coding-system-for-read    'utf-8)
        (setq file-name-coding-system           'utf-8)
        (set-selection-coding-system            'utf-8)
        (set-keyboard-coding-system        'utf-8-unix)
        (set-terminal-coding-system             'utf-8)
        (prefer-coding-system                   'utf-8)))

;; Linum plugin
(require 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк

;; Fringe settings
(fringe-mode '(8 . 0)) ;; органичиталь текста только слева
(setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
(setq-default indicate-buffer-boundaries 'left) ;; индикация только слева

;; Display file size/time in mode-line
;;(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
;;(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode t) ;; размер файла в %-ах

;; Line wrapping
(setq word-wrap          t) ;; переносить по словам
(global-visual-line-mode t)

;; Color themes
;;M-x load-theme RET zenburn
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'misterioso t)

;; Margin window(left)
;;(set-window-margins nil 2 0)
;; Margin text-mode left
(setq-default left-margin-width 4)

;; Indent settings
(setq-default indent-tabs-mode t) ;; nil отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)

;; Clipboard settings - общий с ОС буфер
(setq x-select-enable-clipboard t)

;; Auto-complete
(require 'popup)
(add-to-list 'load-path "/home/happy/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(ac-config-default)

;; Включение поддержки Python
(require 'python)
(setq python-indent-offset 4)
(setq python-shell-interpreter "python3")

;; Автодополнение и подсветка синтаксиса
(require 'auto-complete)
;;(require 'python-mode)
;;(add-hook 'python-mode-hook 'auto-complete-mode)
;;(add-hook 'python-mode-hook 'flycheck-mode)

;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(custom-safe-themes
   ;;'("f079ef5189f9738cf5a2b4507bcaf83138ad22d9c9e32a537d61c9aae25502ef" default))
;; '(package-selected-packages '(python ## gnu-elpa-keyring-update)))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; )
