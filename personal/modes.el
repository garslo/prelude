
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
                                        ; -- paredit enhancement from EmacsWiki -- ;
(defvar electrify-return-match
  "[\]}\)\"]"
  "If this regexp matches the text after the cursor, do an \"electric\"
return.")

(defun electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
open and indent an empty line between the cursor and the text. Move the
cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
        (save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))
