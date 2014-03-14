(defvar *go-helper-ws-base-path* "/Users/gslopsema/vagrant/llnw/go")
(defvar *go-helper-current-ws* nil)

(defun go-helper-ws-base-as-dir ()
  (file-name-as-directory *go-helper-ws-base-path*))

(defun go-helper-goto-workspace (ws)
  "Opens a dired directory in the given workspace."
  (interactive "sWorkspace name (without '-ws'): ")
  (let* ((base-dir (go-helper-ws-base-as-dir))
        (ws-dir (concat base-dir ws "-ws")))
    (setq *go-helper-current-ws* (concat ws "-ws"))
    (find-file ws-dir)))

(defun go-helper-goto-repo (repo)
  "Opens a dired directory in the given repo. This requires
*go-helper-current-ws* to be set; call go-helper-goto-workspace
to set this variable."
  (interactive "sRepo name (without '.git'): ")
  (if (null *go-helper-current-ws*)
      (message "No workspace set. Call go-helper-goto-workspace.")
    (let* ((path-list `(,*go-helper-ws-base-path* ,*go-helper-current-ws* "src" "git.llnw.com" "lama"))
           (base-dir (concat
                      (mapconcat 'file-name-as-directory path-list "")))
           (repo-name (concat repo ".git"))
           (repo-dir (mapconcat #'file-name-as-directory `(,base-dir ,repo-name) "")))
      (find-file repo-dir))))

(defun go-helper-make-keymap ()
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c r") 'go-helper-goto-repo)
    (define-key map (kbd "C-c w") 'go-helper-goto-workspace)
    map))

(define-minor-mode go-helper-mode
  "Helper for go interactions"
  :lighter " GoHelper"
  :keymap (go-helper-make-keymap))

(define-globalized-minor-mode go-helper-global-mode
  go-helper-mode
  go-helper-on)

(defun go-helper-on ()
  (go-helper-mode 1))

(provide 'go-helper-mode)
