-- Add Outdoor and Seasonal categories
INSERT INTO categories (name, slug) VALUES
  ('Outdoor', 'outdoor'),
  ('Seasonal', 'seasonal')
ON CONFLICT (slug) DO NOTHING;

