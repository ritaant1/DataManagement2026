# ============================================================
# Git + GitHub da R/RStudio 
# ============================================================
# Obiettivo:
# 1) dire a Git chi sei (nome + email) -> serve per firmare/attribuire i commit
# 2) verificare che la configurazione sia stata salvata
# 3) creare un GitHub token (PAT) -> serve per autenticarsi su GitHub (push/pull)
# 4) salvare il token in modo sicuro sul computer (così non lo reinserisci ogni volta)
#
# Nota:
# - Esegui queste righe nella Console di RStudio (o in R).
# - Se sei su Windows e Git non è nel PATH, vedi la sezione "Windows users" più sotto.
# ============================================================


# --- 1) Imposta l'email usata da Git per i commit (metti la TUA email) ---
system('git config --global user.email "rita.antonacci@student.univaq.it"')

system('git config --replace-all user.email "rita.antonacci@student.univaq.it"')
# --- 2) Imposta il nome usato da Git per i commit (metti il TUO nome e cognome) ---
system('git config --global user.name "RitaAntonacci"')

# --- 3) Controlla che Git abbia salvato le impostazioni globali ---
# (stampa la lista delle configurazioni globali; cerca user.name e user.email)
system("git config --global --list")
system("git config --local -l")

# ============================================================
# Windows users (solo se i comandi sopra NON funzionano)
# ============================================================
# Problema tipico: R non trova "git" perché Git non è nel PATH di sistema.
# Soluzione: specifichiamo il percorso completo di git.exe e lo usiamo nei comandi.

# Esempio di percorso standard (può variare!):
# git <- '"C:/Program Files/Git/cmd/git.exe"'

# Imposta email:
# system(paste(git, 'config --global user.email "Your@Email.com"'))

# Imposta nome:
# system(paste(git, 'config --global user.name "YourName"'))

# Verifica:
# system(paste(git, "config --global --list"))


# ============================================================
# GitHub Token (PAT) + salvataggio credenziali
# ============================================================
# Per fare push/pull su GitHub NON si usa più la password dell’account.
# Si usa un Personal Access Token (PAT): una “password” generata da GitHub.
# se non funziona installare prima i pacchetti usethis e gitcreds:
# installa i pacchetti necessari (una volta sola)
# install.packages(c("usethis","gitcreds"))
# --- 4) Apri nel browser la pagina di GitHub per creare un token ---
# (ti si apre GitHub: crea un token, copialo subito perché poi non verrà mostrato di nuovo)
usethis::create_github_token()

# --- 5) Salva il token nel credential manager usato da Git sul tuo computer ---
# (quando chiede "Enter password or token:", incolla il token e premi invio)
gitcreds::gitcreds_set()

system("git remote add origin https://github.com/ritaant1/DataManagement2026.git")

system("git remote -v")

system("git remote add upstream https://github.com/micdimu/DataManCons.git")
system("git remote -v")

# --- 9)  Scaricare i contenuti dal repository del docente ---

system("git fetch upstream")

# Questo scarica i commit ma non modifica ancora i file

# --- 10)  Unire i file docente con i propri ---

system("git merge upstream/main")

# Ora i file del corso sono presenti nella cartella locale

# Controllare lo stato del repository

system("git status")  
#per risolvere il problema di unire due repository diverse 
system("git merge upstream/main --allow-unrelated-histories") 


