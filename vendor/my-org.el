;;;
(defun my-org-mode-init()
  (prelude-require-packages '(writegood-mode))
  (setq org-log-done t
        org-todo-keywords '((sequence "TODO" "NEXT" "WAITING" "DONE" "|" "CANCELED"))
        org-todo-keyword-faces '(("NEXT" . (:foreground "blue" :weight bold))))
  (add-hook 'org-mode-hook
            (lambda ()
              (flyspell-mode)))
  (add-hook 'org-mode-hook
            (lambda ()
              (writegood-mode)))

  (require 'org-habit)
  (add-to-list 'org-modules "org-habit")
  (setq org-habit-preceding-days 7
        org-habit-following-days 1
        org-habit-graph-column 80
        org-habit-show-habits-only-for-today t
        org-habit-show-all-today t)

  (setq org-agenda-show-log t
        org-agenda-todo-ignore-scheduled t
        org-agenda-todo-ignore-deadlines t)
  (setq diary-file "~/Documents/notes/org/diary.org")
  (setq org-agenda-diary-file "~/Documents/notes/org/diary.org")

  (setq org-directory "~/Documents/notes/org")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  ;; custom capture-templates
  (setq org-capture-templates
        '(
          ("d" "Daily Notes" entry
           (file+datetree (concat org-directory "/personal.org"))
           "* TODO %^{Description} %^g\n%?")
          ("w" "Work Journal" entry
           (file+datetree (concat org-directory "/work.org"))
           "* TODO %^{Description} %^g\n%?")
          ("n" "Ramdom Notes" entry
           (file+datetree (concat org-directory "/notes.org"))
           "* %^{Description} %^g\n  %i\n  %?%U")
          ("x" "Clipboard Notes" entry
           (file+datetree (concat org-directory "/notes.org"))
           "* %^{Description} %^g\n  %x\n  %?%U")))

  ;;custom commands for the use of GTD.
  (setq org-agenda-custom-commands
        '(
          ("w" todo "WAITING" nil)
          ("n" todo "NEXT" nil)
          ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))

  (global-set-key "\C-cr" 'org-capture)
  (global-set-key "\C-cc" 'calendar)
  (global-set-key "\C-ca" 'org-agenda))

(my-org-mode-init)

(provide 'my-org)
;;; my-org.el ends here
