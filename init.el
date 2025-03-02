;; configuração básica do Emacs

; buffer inicial não é carregado no início
(setq inhibit-startup-message t) ; t = true

; removendo elementos gráficos (barras no topo, etc)
(tool-bar-mode -1) ; oculta a barra de ferramentas
(menu-bar-mode -1) ; oculta a barra de menu
(scroll-bar-mode -1) ; oculta a barra de rolagem
(tooltip-mode -1) ; oculta as dicas

(global-display-line-numbers-mode t) ; exibe os numeros
(column-number-mode t) ; exibe coluna atual na modeline
(global-hl-line-mode t) ; exibe destaque de linha


;; funcoes extras
(global-unset-key (kbd "C-z")) ; desabilita o ctrl z
(delete-selection-mode t) ; texto substitui selecao
(global-visual-line-mode t) ; quebra de linha yes!
(set-fringe-mode 10)

;; pacotes
(require 'package)
(setq package-enable-at-startup nil) ; desabilitar inicio de ativação

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

;; se eu quiser depois mudar os icones do neotree
(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :bind (("C-\\" . 'neotree-toggle))) ; atalho pra arvore de arquivo

;; temas
; lindo
(use-package timu-spacegrey-theme
        :ensure t
        :config
        (load-theme 'timu-spacegrey t))

;; coisa do melpa
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company-lsp company lsp-pyright magit all-the-icons auto-complete try timu-spacegrey-theme neotree)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; habilitando o lsp, que torna o editor mais inteligente em questão de programação

; adicionando funcionalidade de suporte as linguagens
(use-package lsp-mode
  :hook ((python-mode java-mode js-mode) . lsp-deferred)
  :commands lsp)

; caso eu precise no futuro, documentação etc
; (use-package lsp-ui
 ; :commands lsp-ui-mode)

; java
(use-package lsp-java
  :after lsp)

; python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . lsp))

