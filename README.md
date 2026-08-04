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
