(scroll-bar-mode -1)
(setq prelude-whitespace nil)
(setq echo-keystrokes 0.1) ; I like immediate responses...
(setq default-tab-width 4)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq column-number-mode t)
(add-to-list 'backup-directory-alist '(".*" . "~/Conf/Emacs/Backup"))
(require 'server)
(if (not (server-running-p))
    (server-start))
