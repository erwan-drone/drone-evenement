-- À exécuter une fois dans Supabase : Dashboard > SQL Editor > New query

create table if not exists tournoi_state (
  id text primary key,
  data jsonb not null,
  updated_at timestamptz default now()
);

alter table tournoi_state enable row level security;

-- Autorise l'app (clé publique "anon") à lire et écrire cette table.
-- Comme le contenu (équipes, scores) n'est pas sensible, une politique ouverte
-- est raisonnable ici. Si tu veux la restreindre davantage, on peut ajouter
-- une authentification plus tard.
create policy "Lecture publique" on tournoi_state
  for select using (true);

create policy "Écriture publique" on tournoi_state
  for insert with check (true);

create policy "Mise à jour publique" on tournoi_state
  for update using (true);

-- Historique des sauvegardes nommées (onglet "Historique des sauvegardes")
-- Contrairement à tournoi_state (une seule ligne "main" auto-sauvegardée),
-- cette table garde une ligne par sauvegarde nommée par l'utilisateur.
create table if not exists tournoi_history (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  data jsonb not null,
  created_at timestamptz default now()
);

alter table tournoi_history enable row level security;

create policy "Lecture publique historique" on tournoi_history
  for select using (true);

create policy "Écriture publique historique" on tournoi_history
  for insert with check (true);

create policy "Suppression publique historique" on tournoi_history
  for delete using (true);
