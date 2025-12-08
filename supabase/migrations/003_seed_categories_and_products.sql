-- Seed Categories (upsert by slug to avoid duplicates)
INSERT INTO categories (id, name, slug) VALUES
  (gen_random_uuid(), 'Furniture', 'furniture'),
  (gen_random_uuid(), 'Home Appliances', 'home-appliances'),
  (gen_random_uuid(), 'Tools', 'tools'),
  (gen_random_uuid(), 'Fitness', 'fitness'),
  (gen_random_uuid(), 'Wellness', 'wellness'),
  (gen_random_uuid(), 'Kitchen', 'kitchen'),
  (gen_random_uuid(), 'Office', 'office')
ON CONFLICT (slug) DO NOTHING;

-- Seed Products with proper category linking
-- Using upsert by slug to allow safe re-runs
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  p.name,
  p.slug,
  p.short_description,
  p.description,
  p.sku,
  p.price,
  p.stock_quantity,
  'active',
  c.id,
  p.images
FROM (VALUES
  (
    '4 Pieces Rustic Dining Table Set',
    '4-pieces-rustic-dining-table-set',
    'Compact rustic dining table set with 4 matching chairs, perfect for cozy dining spaces.',
    'This elegant 4-piece rustic dining table set features a sturdy wooden table and four matching chairs. Crafted from high-quality materials, the set combines rustic charm with modern durability. The table surface is finished to resist stains and scratches, making it ideal for daily family meals and entertaining guests. The matching chairs feature comfortable seating with supportive backs, ensuring comfort during extended dining sessions. Perfect for apartments, condos, or small dining rooms where space efficiency matters.',
    'CRZ-FUR-RTABLE-4PC',
    149.99,
    25,
    ARRAY['https://via.placeholder.com/800x800?text=4+Pieces+Rustic+Dining+Table+Set']::TEXT[],
    'furniture'
  ),
  (
    '19 Piece Silicone Kitchenware Utensil Set',
    '19-piece-silicone-kitchenware-utensil-set',
    'Complete heat-resistant silicone utensil collection with ergonomic wooden handles for modern kitchens.',
    'This comprehensive 19-piece silicone kitchenware set includes everything you need for cooking and baking. Each utensil features heat-resistant silicone heads that won''t scratch non-stick cookware, paired with comfortable wooden handles for a secure grip. The set includes various spoons, spatulas, whisks, and serving tools. All pieces are dishwasher safe and designed to withstand high temperatures, making them perfect for everyday cooking. The silicone material is BPA-free and food-safe, ensuring your family''s health and safety.',
    'CRZ-KIT-SILICON-19',
    105.00,
    80,
    ARRAY['https://via.placeholder.com/800x800?text=19+Piece+Silicone+Kitchenware+Set']::TEXT[],
    'kitchen'
  ),
  (
    'Techwood Smokeless Indoor Grill 1500W',
    'techwood-smokeless-indoor-grill-1500w',
    'Powerful 1500W electric tabletop grill with smokeless technology and removable cooking plates.',
    'Experience restaurant-quality grilling indoors with the Techwood Smokeless Indoor Grill. This 1500W electric grill features advanced smokeless technology that eliminates smoke and odors, making it perfect for apartment living or year-round grilling. The unit includes both grill and griddle plates that are easily removable for cleaning. A tempered glass lid helps trap heat and moisture for perfectly cooked meals. The drip tray collects excess grease, keeping your cooking area clean. Ideal for Korean BBQ, steaks, vegetables, and more. Compact design fits easily on any countertop or table.',
    'CRZ-APP-GRILL-1500',
    160.00,
    40,
    ARRAY['https://via.placeholder.com/800x800?text=Techwood+Smokeless+Indoor+Grill']::TEXT[],
    'home-appliances'
  ),
  (
    '7-PC Patio Wicker Sectional Dining Set - Gray',
    '7pc-patio-wicker-sectional-dining-set-gray',
    'Spacious outdoor wicker dining set with sectional seating in elegant gray, perfect for patios and backyards.',
    'Transform your outdoor space with this stunning 7-piece patio wicker sectional dining set. The set features a weather-resistant wicker frame in a sophisticated gray finish that complements any outdoor decor. The sectional design includes comfortable seating with plush cushions that are both water-resistant and fade-resistant. The dining table provides ample space for entertaining, while the modular sectional pieces can be arranged to fit your space perfectly. Built to withstand Canadian weather conditions, this set combines style with durability. Perfect for summer barbecues, outdoor dining, or simply relaxing in your backyard.',
    'CRZ-FUR-PATIO-7PC',
    777.77,
    10,
    ARRAY['https://via.placeholder.com/800x800?text=7-PC+Patio+Wicker+Sectional+Set']::TEXT[],
    'furniture'
  ),
  (
    '3-Seater Corduroy Sofa - Beige',
    '3-seater-corduroy-sofa-beige',
    'Comfortable three-seater sofa in soft beige corduroy fabric, perfect for modern living rooms.',
    'Add timeless elegance to your living room with this 3-seater corduroy sofa in a warm beige hue. The sofa features a classic design with deep, comfortable seating and supportive cushions. The corduroy fabric provides a soft, textured feel while being durable enough for everyday use. The neutral beige color complements a wide range of interior styles, from modern minimalist to cozy traditional. The sturdy frame ensures long-lasting comfort and support. Perfect for family rooms, living areas, or as a statement piece in your home. Easy to maintain and designed for years of comfortable use.',
    'CRZ-FUR-SOFA-3CORD',
    399.00,
    15,
    ARRAY['https://via.placeholder.com/800x800?text=3-Seater+Corduroy+Sofa']::TEXT[],
    'furniture'
  )
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  sku = EXCLUDED.sku,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images,
  category_id = EXCLUDED.category_id,
  status = 'active',
  updated_at = NOW();

