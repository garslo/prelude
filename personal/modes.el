
;;; flycheck-tip
(require 'flycheck-tip)
(setq flycheck-tip-avoid-show-func nil
      flycheck-display-errors-function
      'flycheck-tip-display-current-line-error-message)

;;; electric-pair-mode
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook (lambda ()
                            (local-set-key (kbd "RET")
                                           'electrify-return-if-match)))
