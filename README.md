# Générateur de Tournoi — Drone Soccer

## Déploiement gratuit sur Vercel — étapes

1. Installe Node.js si ce n'est pas déjà fait : https://nodejs.org (version 18 ou plus, prends la version "LTS").

2. Dézippe ce dossier, ouvre un terminal dedans, puis installe les dépendances :
   ```
   npm install
   ```

3. Teste en local pour vérifier que tout fonctionne :
   ```
   npm run dev
   ```
   Ouvre l'adresse affichée (généralement http://localhost:5173).

4. Installe l'outil en ligne de commande Vercel :
   ```
   npm install -g vercel
   ```

5. Lance le déploiement depuis le dossier du projet :
   ```
   vercel
   ```
   - La première fois, ça te demande de te connecter (ça ouvre une page web, connexion gratuite avec email ou GitHub).
   - Ensuite, réponds aux quelques questions (accepte les valeurs par défaut en appuyant sur Entrée).
   - Au bout de 30 secondes, Vercel te donne une adresse du type `tournoi-app-xxxx.vercel.app` — ton site est en ligne.

6. Pour republier après une modification du code, relance simplement :
   ```
   vercel --prod
   ```

---

## Sauvegarde des données (Supabase)

L'app sauvegarde désormais automatiquement l'état du tournoi (équipes, poules, scores, phase finale...) dans une base Supabase, et le recharge à l'ouverture. Ça évite de tout perdre en cas de fermeture d'onglet, de rechargement de page ou de crash.

### 1. Créer le projet Supabase (gratuit)

1. Va sur https://supabase.com et crée un compte / connecte-toi.
2. Crée un nouveau projet (choisis une région proche, ex. Europe).
3. Une fois le projet créé, va dans **Project Settings > API** : note l'**URL** du projet et la clé **anon public**.

### 2. Créer la table de sauvegarde

1. Dans le dashboard Supabase, ouvre **SQL Editor > New query**.
2. Copie-colle le contenu du fichier `supabase_setup.sql` (fourni dans ce dossier) et exécute-le.

### 3. Configurer les clés en local

1. Duplique le fichier `.env.example` en `.env` :
   ```
   cp .env.example .env
   ```
2. Remplace les valeurs par l'URL et la clé anon récupérées à l'étape 1.
3. Relance `npm run dev` — l'app charge et sauvegarde désormais automatiquement.

### 4. Configurer les clés sur Vercel (pour le site en ligne)

1. Sur le dashboard Vercel, ouvre ton projet > **Settings > Environment Variables**.
2. Ajoute :
   - `VITE_SUPABASE_URL` → l'URL de ton projet Supabase
   - `VITE_SUPABASE_ANON_KEY` → la clé anon public
3. Redéploie (`vercel --prod`) pour que les nouvelles variables soient prises en compte.

### Notes

- La sauvegarde se déclenche automatiquement 1,5 seconde après chaque changement (pas besoin de bouton "Enregistrer").
- Une seule ligne est utilisée dans la table (`id = 'main'`) : c'est une sauvegarde globale de l'état courant du tournoi, pas un historique de tournois multiples. Si tu veux garder l'historique de chaque tournoi séparément, on peut adapter facilement (un id par tournoi/date).
- La clé "anon" Supabase est publique par nature (elle est visible dans le code du site) — c'est normal et sans risque ici puisque les données (équipes, scores) ne sont pas sensibles.
