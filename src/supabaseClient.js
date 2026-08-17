import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  console.warn(
    "Supabase n'est pas configuré : ajoute VITE_SUPABASE_URL et VITE_SUPABASE_ANON_KEY dans un fichier .env (voir README)."
  );
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);
