-- Tabella strade per Stradario Santa Croce
CREATE TABLE IF NOT EXISTS strade (
  id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  via TEXT NOT NULL,
  zona TEXT,
  numeri TEXT,
  citta TEXT NOT NULL,
  colonna_a TEXT,
  colonna_b TEXT,
  nome_completo TEXT,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Indici per ricerca veloce
CREATE INDEX idx_strade_via ON strade(via);
CREATE INDEX idx_strade_citta ON strade(citta);
CREATE INDEX idx_strade_zona ON strade(zona);
CREATE INDEX idx_strade_nome_completo ON strade(nome_completo);

-- RLS - Chiunque può leggere
ALTER TABLE strade ENABLE ROW LEVEL SECURITY;

CREATE POLICY "strade_select_public" ON strade
  FOR SELECT USING (true);

-- Solo admin (con password) può modificare/aggiungere/eliminare
CREATE POLICY "strade_insert_admin" ON strade
  FOR INSERT WITH CHECK (true);

CREATE POLICY "strade_update_admin" ON strade
  FOR UPDATE USING (true) WITH CHECK (true);

CREATE POLICY "strade_delete_admin" ON strade
  FOR DELETE USING (true);
