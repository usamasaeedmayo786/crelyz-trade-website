-- Seed Categories from crelyztradeinc.com
INSERT INTO categories (name, slug) VALUES
  ('Furniture', 'furniture'),
  ('Home Appliances', 'home-appliances'),
  ('Tools', 'tools'),
  ('Fitness', 'fitness'),
  ('Wellness', 'wellness'),
  ('Kitchen', 'kitchen'),
  ('Office', 'office')
ON CONFLICT (slug) DO NOTHING;

-- Seed Products from crelyztradeinc.com
-- Note: Images are placeholder URLs - replace with actual product images
INSERT INTO products (name, slug, short_description, description, sku, price, status, category_id, images) 
SELECT 
  p.name,
  p.slug,
  p.short_description,
  p.description,
  p.sku,
  p.price,
  'active',
  c.id,
  p.images
FROM (VALUES
  ('4 Pieces Rustic Dining Table Set', '4-pieces-rustic-dining-table-set', 'Beautiful rustic dining set perfect for your home', 'This 4-piece rustic dining table set includes a dining table and matching chairs. Made from high-quality materials, this set combines style and durability. Perfect for family gatherings and dinner parties.', 'CT-FURN-001', 149.99, ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800']::TEXT[], 'furniture'),
  ('19 Piece Silicone Kitchenware Utensil Set', '19-piece-silicone-kitchenware-utensil-set', 'Heat resistant non-stick cooking tool set with wooden handles', 'Complete 19-piece silicone kitchenware utensil set. Heat resistant and non-stick, these cooking tools feature wooden handles for comfortable grip. Perfect for all your cooking needs.', 'CT-KIT-001', 105.00, ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[], 'kitchen'),
  ('Techwood Indoor Grill Smokeless Grill', 'techwood-indoor-grill-smokeless-grill', '1500W Indoor Korean BBQ Electric Tabletop Grill with Tempered Glass Lid', 'Techwood Indoor Grill - 1500W smokeless grill perfect for indoor Korean BBQ. Features removable grill and griddle plates with drip tray. Includes tempered glass lid. Gray finish.', 'CT-KIT-002', 160.00, ARRAY['https://images.unsplash.com/photo-1556911220-bff31c812dba?w=800']::TEXT[], 'kitchen'),
  ('7-PC Patio Wicker Sectional Dining Set - Gray', '7-pc-patio-wicker-sectional-dining-set-gray', 'Spacious 7-piece patio sectional dining set in elegant gray', 'Beautiful 7-piece patio wicker sectional dining set in gray. Perfect for outdoor entertaining. Weather-resistant materials ensure durability and long-lasting beauty.', 'CT-FURN-002', 777.77, ARRAY['https://images.unsplash.com/photo-1538688525198-9b88f6f53126?w=800']::TEXT[], 'furniture'),
  ('7PCS Modern Rubber wood Dining Set - Grey', '7pcs-modern-rubber-wood-dining-set-grey', 'Modern 7-piece rubber wood dining set in grey finish', 'Stylish 7-piece modern rubber wood dining set in grey. Contemporary design meets functionality. Perfect for modern homes and dining spaces.', 'CT-FURN-003', 777.77, ARRAY['https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800']::TEXT[], 'furniture'),
  ('Two Tone Finish TV Stand 60-Inch', 'two-tone-finish-tv-stand-60-inch', 'Distressed Wood/Espresso finish TV stand', 'Elegant two-tone finish TV stand in 60-inch width. Features distressed wood and espresso finish. Perfect for your entertainment center.', 'CT-FURN-004', 0.00, ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800']::TEXT[], 'furniture'),
  ('3-Seater Corduroy Sofa - Beige', '3-seater-corduroy-sofa-beige', 'Comfortable 3-seater corduroy sofa in beige', 'Luxurious 3-seater corduroy sofa in elegant beige. Comfortable and stylish, perfect for your living room. High-quality materials ensure durability and comfort.', 'CT-FURN-005', 399.00, ARRAY['https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800']::TEXT[], 'furniture'),
  ('Grey Fabric Reversible Sofabed Sectional', 'grey-fabric-reversible-sofabed-sectional', 'Large lift up storage sectional sofabed in grey fabric', 'Spacious grey fabric reversible sofabed sectional with large lift-up storage. Perfect for small spaces. Converts from sofa to bed easily. Includes storage compartment.', 'CT-FURN-006', 999.99, ARRAY['https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800']::TEXT[], 'furniture'),
  ('Set of 2 Nightstand with Drawer', 'set-of-2-nightstand-with-drawer', 'Pair of nightstands with drawers', 'Set of 2 matching nightstands with drawers. Perfect for bedroom furniture. Functional and stylish design complements any bedroom decor.', 'CT-FURN-007', 99.99, ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800']::TEXT[], 'furniture')
) AS p(name, slug, short_description, description, sku, price, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
ON CONFLICT (slug) DO NOTHING;

