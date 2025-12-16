-- Quick Fix: Ensure we have products with images
-- This migration ensures at least some products exist with proper images

-- First, let's make sure categories exist
INSERT INTO categories (name, slug) VALUES
  ('Fitness', 'fitness'),
  ('Furniture', 'furniture'),
  ('Kitchen', 'kitchen'),
  ('Home Appliances', 'home-appliances'),
  ('Office', 'office'),
  ('Tools', 'tools'),
  ('Wellness', 'wellness')
ON CONFLICT (slug) DO NOTHING;

-- Add a few essential products with guaranteed images
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  '4 Pieces Rustic Dining Table Set',
  '4-pieces-rustic-dining-table-set',
  'Beautiful rustic dining set perfect for your home',
  'This 4-piece rustic dining table set includes a dining table and matching chairs. Made from high-quality materials, this set combines style and durability. Perfect for family gatherings and dinner parties.',
  'CT-FURN-001',
  249.99,
  25,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  '19 Piece Silicone Kitchenware Utensil Set',
  '19-piece-silicone-kitchenware-utensil-set',
  'Heat resistant non-stick cooking tool set with wooden handles',
  'Complete 19-piece silicone kitchenware utensil set. Heat resistant and non-stick, these cooking tools feature wooden handles for comfortable grip. Perfect for all your cooking needs.',
  'CT-KIT-001',
  205.00,
  70,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Techwood Indoor Grill Smokeless Grill',
  'techwood-indoor-grill-smokeless-grill',
  '1500W Indoor Korean BBQ Electric Tabletop Grill',
  'Techwood Indoor Grill - 1500W smokeless grill perfect for indoor Korean BBQ. Features removable grill and griddle plates with drip tray. Includes tempered glass lid.',
  'CT-KIT-002',
  260.00,
  40,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556911220-bff31c812dba?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity;

-- Verify products exist
SELECT COUNT(*) as total_products FROM products WHERE status = 'active';
SELECT name, slug, array_length(images, 1) as image_count FROM products WHERE status = 'active' LIMIT 5;

