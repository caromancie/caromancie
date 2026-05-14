# 🎴 Caromancie.be — Mode d'emploi (pour Carole & toi!)

Salut Carole ! 👋 Ce guide te montre comment modifier et mettre à jour ton site caromancie.be de façon simple. Pas de panique, c'est plus facile que ça en a l'air !

---

## 📚 La big picture (ce qu'il faut savoir)

Ton site vit en 3 endroits :

1. **Sur ton ordi** (Visual Studio Code) → tu modifies les fichiers
2. **Sur GitHub** (internet) → tu envoies tes modifications
3. **Cloudflare Pages** (internet) → déploie automatiquement ton site en live

Quand tu changes un fichier et que tu le "pousse" sur GitHub, Cloudflare voit ça et **met à jour caromancie.be tout seul en 30-60 secondes**. Magic! ✨

---

## 🚀 Workflow pour mettre à jour le site

### Étape 1 : Ouvrir le projet

```bash
# Dans le terminal, va dans le dossier du projet
cd /Users/arnaudchretien/chatbotdev/MURMUR/Murmure_LIT_fev26/projets/caromancie

#enfin, ça c'est pour tonton, Carole tu dois faire ça dans ton répertoire de travail

# Ouvre VSCode
code .
```

Voilà ! Tu vois maintenant ton projet. Le dossier `public/` c'est où vivent tes fichiers HTML/CSS/JS.

### Étape 2 : Modifier tes fichiers

- **index.html** → la structure de ta page (le contenu)
- **styles inline** → les couleurs et le design (dans le `<style>` du HTML)
- **scripts inline** → les interactions et animations (dans le `<script>` du HTML)

Ouvre `public/index.html`, modifie ce que tu veux, et **sauvegarde** (Cmd+S sur Mac ou Ctrl+S sur Windows).

**Exemple** : Tu veux changer la couleur d'or (doré) en argent ?
Demande à ton LLM préféré (Claude, moi, ou un autre) de te trouver le code couleur de l'argent, puis :
- Trouve `#d4af37` (c'est le code couleur de l'or)
- Remplace par `#c0c0c0` (argent)
- Sauvegarde !

### Étape 3 : Vérifier localement (optionnel mais cool)

Avant d'envoyer sur internet, tu peux checker comment ça ressemble sur ton ordi :

```bash
# Dans VSCode, fais clic-droit sur index.html
# → "Open with Live Server" 
# Ça ouvre une préview dans ton navigateur
```

Ou plus simple : ouvre le fichier dans le navigateur (File → Open File).

**Important** : Si tu changes le CSS ou le JS, tu peux avoir besoin de rafraîchir la page (Cmd+R sur Mac ou Ctrl+R sur Windows) pour voir les changements.

### Étape 4 : "Commiter" tes changements (Git speak pour "sauvegarder sur GitHub")

```bash
# 1. Vérifier qu'on a bien modifié les bons fichiers
git status

# 2. Ajouter tes changements au "panier"
git add public/index.html

# 3. Créer un "snapshot" avec une description
git commit -m "Description courte de ce que tu as changé"

# Exemple de bons messages :
# git commit -m "Change couleur or en argent"
# git commit -m "Ajoute section testimonials"
# git commit -m "Fix responsive design sur mobile"
```

**Conseil** : Le message du commit, c'est pour toi (et Arnaud) dans 6 mois. Sois claire ! 😉

### Étape 5 : Envoyer sur GitHub

```bash
# C'est parti ! Envoie tous tes commits sur GitHub
git push origin main
```

Si ça te dit :
```
To https://github.com/bobume/caromancie.git
   abc1234..def5678  main -> main
```

✅ **C'est good!** Tes changements sont sur GitHub.

### Étape 6 : Vérifier que c'est en live sur caromancie.be

Attends 30-60 secondes, puis :

```bash
# Ouvre caromancie.be dans le navigateur (ou rafraîchis si c'était déjà ouvert)
```

Voilà ! Ton changement est en live ! 🎉

---

## 🛠️ Commandes Git à connaître

### Vérifier l'état du projet
```bash
git status
```
**Ça dit** : Quels fichiers ont changé? Qu'est-ce qui est "staged" (prêt à commiter)?

### Voir l'historique (tes commits passés)
```bash
git log --oneline
```
**Ça montre** : Tous tes commits, du plus récent au plus ancien.

### Annuler un changement (AVANT le commit)
```bash
# Si tu t'es trompée et que tu veux revenir à la version précédente :
git restore public/index.html
```
⚠️ **Attention** : Ça supprime tes changements non-commités! Utilise que si tu es sûre.

### Annuler le dernier commit (si tu t'es super trompée)
```bash
git reset HEAD~1
```
Tes changements reviennent, mais le commit est annulé. Tu peux recommencer.

---

## 📝 Bon à savoir

### Structure des fichiers

```
projets/caromancie/
├── public/
│   └── index.html          ← TON FICHIER À MODIFIER
├── objectifs_actuels.md    ← Notes/idées
└── .git/                   ← Git stuff (ne touche pas)
```

### Types de fichiers

- **`.html`** = la structure et le contenu (texte, sections, etc.)
- **`.css`** = le design (couleurs, polices, spacing)
- **`.js`** = les trucs qui bougent (animations, clics, etc.)

### Règles simples pour caromancie.be

1. **Tout est dans un seul fichier** (`index.html`)
2. **Pas de build process** = tu modifies → tu sauvegardes → tu pushs
3. **Aucun accent bizarre en JS** = pas de `'` ou `—`, utilise `'` et `-` normaux
4. **ASCII only** = sinon ça peut péter sur certains navigateurs

---

## 💡 Scénarios courants

### Je veux changer le titre de la page
```html
<title>Caromancie — Lectures de Tarot & Divination</title>
```
Change le texte entre les `<title>` tags. C'est ce qui s'affiche dans l'onglet du navigateur.

### Je veux ajouter une nouvelle section
Cherche `<section>` dans le HTML, fais un copier-coller, modifie le contenu. Facile !

### Je veux changer une couleur
Cherche le code couleur (`#d4af37`, `#0f0f1e`, etc.) et remplace-le par un autre. 
(Google "color picker" si tu sais pas le code couleur que tu veux)

### Je veux ajouter une image
```html
<img src="chemin/vers/image.jpg" alt="Description">
```
Ajoute l'image dans le dossier `public/`, puis utilise le chemin ci-dessus.

### Le site à l'air cassé après mes changements
1. **Rafraîchis le navigateur** (Cmd+R) → souvent ça suffit
2. **Vérife la syntaxe** → as-tu fermé tous tes tags HTML? (`</div>`, etc.)
3. **Regarde la console** (F12 → Console) → y a des erreurs JS?

---

## 🆘 Problèmes courants

### "Git dit que je peux pas pusher"
```
error: failed to push some refs to 'https://github.com/bobume/caromancie'
```

**Solution** :
```bash
git pull origin main    # Récupère les changements de GitHub
git push origin main    # Renvoi tes changements
```

### "Mon changement est pushé mais caromancie.be n'a pas changé"
- Attends 2-3 minutes (Cloudflare peut être lent)
- Rafraîchis la page (Cmd+R) ou vide le cache (Cmd+Shift+R)
- Vérife que le changement est bien sur GitHub : https://github.com/bobume/caromancie/blob/main/public/index.html

### "Je me suis trompée et j'ai commité quelque chose d'horrible"
Pas de panique ! On peut revenir en arrière :
```bash
git revert HEAD        # Crée un nouveau commit qui annule le précédent
git push origin main   # Envoie sur GitHub
```

---

## ✨ Bon plan : Committer souvent

Au lieu de faire 50 changements et un seul commit, fais des petits commits réguliers :
- Changement couleur → commit
- Ajoute section → commit
- Fix typo → commit

**Pourquoi?** Si tu te trompes, tu peux revenir juste avant le changement problématique. C'est une sauvegarde progressive ! 💾

---

## 📞 Besoin d'aide?

Si ça pète complètement et que tu sais pas quoi faire, **copie le message d'erreur entier** et montre-le à Arnaud (ou Claude). C'est souvent une piste claire pour fixer.

---

## 🎯 Checklist avant de dormir (ou avant un événement)

- [ ] J'ai modifié mon fichier dans VSCode
- [ ] J'ai sauvegardé (Cmd+S)
- [ ] J'ai testé localement (optionnel)
- [ ] J'ai commité (`git commit -m "..."`)
- [ ] J'ai pushé (`git push origin main`)
- [ ] J'ai rafraîchi caromancie.be et j'ai vérifié que le changement est là
- [ ] Je suis fière de mon site 🎉

---

**Made with ❤️ — bon courage Carole, ton site va être dingue!** ✨
