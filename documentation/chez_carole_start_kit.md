# 🚀 Caromancie.be — Start Kit Chez Carole

**Situation:** Le PC de Carole est allumé, on est assis devant.

---

## ÉTAPE 1 — Vérifier Git

Ouvrir le terminal (Windows: PowerShell ou CMD).

```bash
git --version
```

- ✅ Si tu vois une version → Git est installé, go à **ÉTAPE 2**
- ❌ Si "commande introuvable" → Télécharger Git depuis https://git-scm.com/download/win, installer (tout par défaut), relancer le terminal

---

## ÉTAPE 2 — Installer VS Code

1. Télécharger depuis https://code.visualstudio.com/
2. Installer (tout par défaut)
3. Ouvrir VS Code

---

## ÉTAPE 3 — Cloner le Repo

Ouvrir un terminal dans VS Code:
- Menu → Terminal → New Terminal (ou Ctrl+`)

Copier-coller:

```bash
git clone https://github.com/bobume/caromancie.git
cd caromancie
```

Attendre que ça finisse (~10 sec).

---

## ÉTAPE 4 — Ouvrir le Projet

```bash
code .
```

(ou: File → Open Folder → sélectionner le dossier caromancie)

---

## ÉTAPE 5 — (Optionnel) Connecter GitHub Copilot

1. VS Code → Extensions (Ctrl+Shift+X)
2. Chercher "GitHub Copilot"
3. Installer
4. Cliquer "Sign in with GitHub"
5. Un browser s'ouvre → se logger avec ton compte GitHub
6. Autoriser → c'est fait ✅

---

## ÉTAPE 6 — Commencer à Travailler

Tu vois le projet ouvert avec tous les fichiers à gauche.

**Pour éditer:**
- `projets/caromancie/public/index.html` → la homepage
- `projets/caromancie/public/images/` → images

**Pour envoyer tes modifs:**

Terminal (Ctrl+`) → copier-coller:

```bash
./envoyer_en_ligne.sh
```

Le script demande confirmation, puis ton message de commit. C'est envoyé! ✅

---

## TIPS

**Claude (moi):**
- Ouvrir https://claude.ai dans le browser
- Te logger avec ton compte
- Je suis dispo pour refactorer, expliquer, brainstorm

**Problème Git?**
- `git status` → voir ce qui a changé
- `git log --oneline -5` → voir les commits récents

**Besoin de pull les modifs de quelqu'un d'autre?**
```bash
git pull
```

---

**Ça va? Bon travail! 💙**
