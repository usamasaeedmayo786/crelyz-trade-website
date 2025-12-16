-- ============================================
-- COMPLETE PRODUCT SEED - All Products with Real Amazon Data
-- ============================================
-- Copy this entire file and run in Supabase SQL Editor
-- This includes all products with actual Amazon product images and details

-- Step 1: Ensure categories exist
INSERT INTO categories (name, slug) VALUES
  ('Fitness', 'fitness'),
  ('Furniture', 'furniture'),
  ('Kitchen', 'kitchen'),
  ('Home Appliances', 'home-appliances'),
  ('Office', 'office'),
  ('Tools', 'tools'),
  ('Wellness', 'wellness')
ON CONFLICT (slug) DO NOTHING;

-- Step 2: Handle SKU conflicts first by updating existing products
-- This prevents SKU conflict errors when inserting products
UPDATE products p
SET slug = CASE 
  WHEN p.sku = 'CT-FIT-001' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'trampoline-fitness-rebounder-adjustable-handlebar' AND sku != 'CT-FIT-001') THEN 'trampoline-fitness-rebounder-adjustable-handlebar'
  WHEN p.sku = 'CT-FIT-002' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'gym-monster-2-smart-home-gym-ai-powered' AND sku != 'CT-FIT-002') THEN 'gym-monster-2-smart-home-gym-ai-powered'
  WHEN p.sku = 'CT-FIT-003' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'soozier-adjustable-strength-training-bench' AND sku != 'CT-FIT-003') THEN 'soozier-adjustable-strength-training-bench'
  WHEN p.sku = 'CT-FIT-004' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'maxiclimber-hydraulic-resistance-lightweight' AND sku != 'CT-FIT-004') THEN 'maxiclimber-hydraulic-resistance-lightweight'
  WHEN p.sku = 'CT-FURN-001' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = '4-pieces-rustic-dining-table-set' AND sku != 'CT-FURN-001') THEN '4-pieces-rustic-dining-table-set'
  WHEN p.sku = 'CT-FURN-002' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'toilet-bathroom-organizer-adjustable-freestanding' AND sku != 'CT-FURN-002') THEN 'toilet-bathroom-organizer-adjustable-freestanding'
  WHEN p.sku = 'CT-FURN-003' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'higdbfe-8-drawer-dresser-hanging-rack-charging-station' AND sku != 'CT-FURN-003') THEN 'higdbfe-8-drawer-dresser-hanging-rack-charging-station'
  WHEN p.sku = 'CT-FURN-004' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'tribesigns-39-4-inch-industrial-geometric-bookshelf' AND sku != 'CT-FURN-004') THEN 'tribesigns-39-4-inch-industrial-geometric-bookshelf'
  WHEN p.sku = 'CT-FURN-005' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'brottar-dresser-dressing-charging-farmhouse' AND sku != 'CT-FURN-005') THEN 'brottar-dresser-dressing-charging-farmhouse'
  WHEN p.sku = 'CT-KIT-001' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = '19-piece-silicone-kitchenware-utensil-set' AND sku != 'CT-KIT-001') THEN '19-piece-silicone-kitchenware-utensil-set'
  WHEN p.sku = 'CT-KIT-002' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'techwood-indoor-grill-smokeless-grill' AND sku != 'CT-KIT-002') THEN 'techwood-indoor-grill-smokeless-grill'
  WHEN p.sku = 'CT-KIT-003' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'hoshanho-16-piece-knife-set-stainless-steel-sharpener' AND sku != 'CT-KIT-003') THEN 'hoshanho-16-piece-knife-set-stainless-steel-sharpener'
  WHEN p.sku = 'CT-KIT-004' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'echo-show-21-smart-display-alexa' AND sku != 'CT-KIT-004') THEN 'echo-show-21-smart-display-alexa'
  WHEN p.sku = 'CT-KIT-005' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'ikkle-storage-shelves-kitchen-microwave-stand' AND sku != 'CT-KIT-005') THEN 'ikkle-storage-shelves-kitchen-microwave-stand'
  WHEN p.sku = 'CT-HA-001' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'techwood-electric-stove-1800w-double-infrared-ceramic' AND sku != 'CT-HA-001') THEN 'techwood-electric-stove-1800w-double-infrared-ceramic'
  WHEN p.sku = 'CT-HA-002' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'ultrean-precision-digital-kitchen-scale' AND sku != 'CT-HA-002') THEN 'ultrean-precision-digital-kitchen-scale'
  WHEN p.sku = 'CT-HA-003' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'food-party-electric-grill-hotpot-multi-function' AND sku != 'CT-HA-003') THEN 'food-party-electric-grill-hotpot-multi-function'
  WHEN p.sku = 'CT-HA-004' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'nutrichef-multi-function-countertop-rotisserie-oven' AND sku != 'CT-HA-004') THEN 'nutrichef-multi-function-countertop-rotisserie-oven'
  WHEN p.sku = 'CT-HA-005' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'vivohome-large-capacity-removable-temperature-commercial' AND sku != 'CT-HA-005') THEN 'vivohome-large-capacity-removable-temperature-commercial'
  WHEN p.sku = 'CT-OFF-001' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'stacking-student-chromed-learning-classroom-desk' AND sku != 'CT-OFF-001') THEN 'stacking-student-chromed-learning-classroom-desk'
  WHEN p.sku = 'CT-OFF-002' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'rolanstar-computer-desk-outlets-drawers-storage' AND sku != 'CT-OFF-002') THEN 'rolanstar-computer-desk-outlets-drawers-storage'
  WHEN p.sku = 'CT-OFF-003' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'wooden-podium-elegant-lectern-conference-stand' AND sku != 'CT-OFF-003') THEN 'wooden-podium-elegant-lectern-conference-stand'
  WHEN p.sku = 'CT-OFF-004' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'yealink-wireless-headset-certified-softphone-noise-cancelling' AND sku != 'CT-OFF-004') THEN 'yealink-wireless-headset-certified-softphone-noise-cancelling'
  WHEN p.sku = 'CT-OFF-005' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'silkydry-cabinet-storage-organizer-printer-stand' AND sku != 'CT-OFF-005') THEN 'silkydry-cabinet-storage-organizer-printer-stand'
  WHEN p.sku = 'CT-OFF-006' AND NOT EXISTS (SELECT 1 FROM products WHERE slug = 'empsign-briefcase-water-repellent-overnight-computer-bag' AND sku != 'CT-OFF-006') THEN 'empsign-briefcase-water-repellent-overnight-computer-bag'
  ELSE p.slug
END
WHERE p.sku IN ('CT-FIT-001', 'CT-FIT-002', 'CT-FIT-003', 'CT-FIT-004', 'CT-FURN-001', 'CT-FURN-002', 'CT-FURN-003', 'CT-FURN-004', 'CT-FURN-005', 'CT-KIT-001', 'CT-KIT-002', 'CT-KIT-003', 'CT-KIT-004', 'CT-KIT-005', 'CT-HA-001', 'CT-HA-002', 'CT-HA-003', 'CT-HA-004', 'CT-HA-005', 'CT-OFF-001', 'CT-OFF-002', 'CT-OFF-003', 'CT-OFF-004', 'CT-OFF-005', 'CT-OFF-006');

-- Step 3: Add all products with actual Amazon images
-- FITNESS PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Trampoline Fitness Rebounder with Adjustable Handlebar',
  'trampoline-fitness-rebounder-adjustable-handlebar',
  'Professional fitness trampoline with adjustable handlebar for home workouts',
  'High-quality fitness trampoline designed for rebounding exercises. Features adjustable handlebar for stability and support during workouts. Perfect for cardio, strength training, and low-impact exercise routines. Durable construction supports up to 300lbs. Easy to assemble and store.',
  'CT-FIT-001',
  329.99,
  50,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/813XaWAXw4L._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'fitness'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = EXCLUDED.sku,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Gym Monster 2 Smart Home Gym AI-Powered Workout Machine',
  'gym-monster-2-smart-home-gym-ai-powered',
  'Upgraded AI-powered home workout machine with multi-functional Smith machine',
  'Gym Monster 2 Smart Home Gym - Upgraded AI-powered home workout machine featuring multi-functional Smith machine. Full body strength training fitness equipment. All-in-one workout station perfect for family use. Includes advanced AI features for personalized workouts.',
  'CT-FIT-002',
  399.99,
  30,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71JC+aGrzUL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'fitness'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Soozier Adjustable Strength Training Bench',
  'soozier-adjustable-strength-training-bench',
  'Professional adjustable bench for strength training exercises',
  'Heavy-duty adjustable bench for strength training. Multiple incline positions for various exercises. Supports up to 800lbs. Perfect for home gym setup. Padded seat and backrest for comfort during workouts.',
  'CT-FIT-003',
  359.99,
  25,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71115-n045L._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'fitness'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'MaxiClimber Hydraulic Resistance Lightweight Mainframe',
  'maxiclimber-hydraulic-resistance-lightweight',
  'Compact hydraulic resistance climber for full-body workouts',
  'Space-efficient hydraulic resistance climber. Provides full-body workout with smooth hydraulic resistance. Lightweight and easy to store. Perfect for small spaces. Adjustable resistance levels for all fitness levels.',
  'CT-FIT-004',
  289.99,
  40,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/61ISdnXUVDL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'fitness'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

-- FURNITURE PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  '4 Pieces Rustic Dining Table Set',
  '4-pieces-rustic-dining-table-set',
  'Beautiful rustic dining set perfect for your home',
  'This 4-piece rustic dining table set includes a dining table and matching chairs. Made from high-quality materials, this set combines style and durability. Perfect for family gatherings and dinner parties. Seats 4 comfortably.',
  'CT-FURN-001',
  349.99,
  25,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71AIpF9ZhWL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Toilet Bathroom Organizer Adjustable Freestanding',
  'toilet-bathroom-organizer-adjustable-freestanding',
  'Space-saving bathroom organizer with adjustable shelves',
  'Modern freestanding bathroom organizer with adjustable shelves. Perfect for organizing toiletries and bathroom essentials. Easy to assemble and clean. Water-resistant design. Multiple storage compartments.',
  'CT-FURN-002',
  249.99,
  60,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71mAY-c1uCL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'HIGDBFE 8-Drawer Dresser with Hanging Rack and Charging Station',
  'higdbfe-8-drawer-dresser-hanging-rack-charging-station',
  'Modern dresser with hanging rack, charging station, LED lights, and shoe rack',
  'HIGDBFE 8-Drawer Dresser with Hanging Rack, Charging Station & LED Lights. Kids dresser with shoe rack for clothes storage. Chest of drawers with wooden top for bedroom. Features built-in USB charging station, LED lighting, and hanging rack. Perfect for bedroom organization.',
  'CT-FURN-003',
  499.99,
  35,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/81QqLQzuF-L._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Tribesigns 39.4-Inch Industrial Geometric Bookshelf',
  'tribesigns-39-4-inch-industrial-geometric-bookshelf',
  'Industrial-style geometric bookshelf with thickened design',
  'Modern industrial geometric bookshelf with thickened shelves. Unique design adds style to any room. Perfect for books, decor, and storage. Sturdy metal frame with wood shelves. Easy assembly required.',
  'CT-FURN-004',
  379.99,
  45,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/81zRzYll-nL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'BROTTAR Dresser Dressing Charging Farmhouse Style',
  'brottar-dresser-dressing-charging-farmhouse',
  'Farmhouse-style dresser with charging station and mirror',
  'Charming farmhouse-style dresser with built-in charging station and mirror. Multiple drawers for organization. Perfect blend of style and functionality. Vintage-inspired design with modern conveniences.',
  'CT-FURN-005',
  549.99,
  30,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71gKEotiqnL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

-- KITCHEN PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  '19 Piece Silicone Kitchenware Utensil Set',
  '19-piece-silicone-kitchenware-utensil-set',
  'Heat resistant non-stick cooking tool set with wooden handles',
  'Complete 19-piece silicone kitchenware utensil set. Heat resistant and non-stick, these cooking tools feature wooden handles for comfortable grip. Perfect for all your cooking needs. Dishwasher safe and easy to clean.',
  'CT-KIT-001',
  305.00,
  70,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71CLBCp28aL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Techwood Indoor Grill Smokeless Grill',
  'techwood-indoor-grill-smokeless-grill',
  '1500W Indoor Korean BBQ Electric Tabletop Grill with Tempered Glass Lid',
  'Techwood Indoor Grill - 1500W smokeless grill perfect for indoor Korean BBQ. Features removable grill and griddle plates with drip tray. Includes tempered glass lid. Gray finish. No smoke technology for indoor use.',
  'CT-KIT-002',
  360.00,
  40,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71lRLbFndSL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'HOSHANHO 16-Piece Knife Set Stainless Steel with Sharpener',
  'hoshanho-16-piece-knife-set-stainless-steel-sharpener',
  'Professional Japanese knife set with built-in sharpener',
  'HOSHANHO 16-Piece Knife Set, Japanese High Carbon Stainless Steel Kitchen Knife Set. Ultra sharp chef knife block set with sharpener. Complete kitchen knife set including chef knife, bread knife, utility knives, and built-in sharpener. Premium stainless steel construction. Ergonomic handles for comfortable use. Dishwasher safe.',
  'CT-KIT-003',
  279.99,
  70,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/81NuDZfC+-L._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Echo Show 21 Smart Display with Alexa',
  'echo-show-21-smart-display-alexa',
  '21-inch smart display with Alexa voice assistant',
  'Large 21-inch smart display with Alexa. Perfect for kitchen use with hands-free control. Stream videos, check recipes, and control smart home devices. HD display with stereo speakers. Perfect for cooking and entertainment.',
  'CT-KIT-004',
  449.99,
  40,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/81rabj72X9L._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'ikkle Storage Shelves Kitchen Microwave Stand',
  'ikkle-storage-shelves-kitchen-microwave-stand',
  'Multi-tier kitchen storage stand for microwave and more',
  'Versatile kitchen storage stand with multiple tiers. Perfect for microwave, small appliances, and kitchen essentials. Space-saving design. Sturdy construction. Easy to assemble. Organize your kitchen efficiently.',
  'CT-KIT-005',
  269.99,
  55,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71rMEATmHyL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

-- HOME APPLIANCES PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Techwood Electric Stove 1800W Double Infrared Ceramic Hot Plate',
  'techwood-electric-stove-1800w-double-infrared-ceramic',
  'Portable double burner electric stove with anti-scald handles',
  'Techwood Electric Stove, 1800W Double Infrared Ceramic Hot Plate for Cooking. Two control cooktop burner with portable anti-scald handles. Suitable for office, home, and camp use. Compatible with all cookware. Perfect for small spaces and outdoor cooking.',
  'CT-HA-001',
  245.99,
  80,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/61wPSIlx7ML._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Ultrean Food Scale Digital Kitchen Scale Weight Grams and Ounces',
  'ultrean-precision-digital-kitchen-scale',
  'Precise digital kitchen scale with stainless steel platform',
  'Ultrean Food Scale, Digital Kitchen Scale Weight Grams and Ounces for Baking and Cooking. 6 units with tare function. 11lb capacity. Batteries included. High-precision measurements with large stainless steel platform. LCD display with multiple unit options. Perfect for baking and cooking.',
  'CT-HA-002',
  224.99,
  90,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71TV+iWbGlL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Food Party Hot Pot Electric and BBQ Grill Smokeless 2 in 1',
  'food-party-electric-grill-hotpot-multi-function',
  'Versatile electric grill and hotpot combo appliance',
  'Food Party Hot Pot Electric and BBQ Grill Smokeless 2 in 1 Chinese Hotpot with Divider Shabu Shabu Hot Pot Korean BBQ Grill Indoor Large Fondue. Multi-function electric grill and hotpot combination. Perfect for indoor grilling and hotpot cooking. Adjustable temperature control. Easy to clean. Non-stick surface.',
  'CT-HA-003',
  329.99,
  50,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/81598KcjYkL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Nutrichef Rotisserie Oven Vertical Countertop Oven',
  'nutrichef-multi-function-countertop-rotisserie-oven',
  'Versatile countertop rotisserie oven with multiple functions',
  'Nutrichef Rotisserie Oven, Vertical Countertop Oven with Rotisserie, Bake, Broil, & Kebab Rack Functions. 2 shelves, 1500W. Perfect for Thanksgiving turkey. Includes grill, kebab skewer racks & bake pan. Professional countertop rotisserie oven with multiple cooking functions. Large capacity for family meals. Digital controls.',
  'CT-HA-004',
  399.99,
  35,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/81YlVdZBmaL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'VIVOHOME 20.7 Qt Large Capacity Electric Deep Fryer',
  'vivohome-large-capacity-removable-temperature-commercial',
  'Commercial-grade large capacity deep fryer with temperature control',
  'VIVOHOME 20.7 Qt Large Capacity Electric Deep Fryer with 2 x 6.35 QT Removable Baskets and Temperature Limiter for Commercial and Home Use. Professional-grade appliance with large capacity. Removable components for easy cleaning. Precise temperature control. Perfect for commercial or home use. Durable construction.',
  'CT-HA-005',
  549.99,
  25,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/51ZaNKhUE6L._AC_SL1100_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

-- OFFICE PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Stacking Student Chromed Learning Classroom Desk',
  'stacking-student-chromed-learning-classroom-desk',
  'Durable stacking desk perfect for classrooms and offices',
  'Heavy-duty stacking desk with chromed frame. Space-efficient design perfect for classrooms and offices. Easy to stack and store when not in use. Adjustable height options available. Durable construction.',
  'CT-OFF-001',
  289.99,
  60,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71rAU8g-7cL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Rolanstar Computer Desk with Power Outlets & LED Light 55 inch',
  'rolanstar-computer-desk-outlets-drawers-storage',
  'Modern computer desk with built-in outlets, LED light, and storage',
  'Rolanstar Computer Desk with Power Outlets & LED Light, 55 inch Home Office Desk with Drawers and Storage Shelves. Writing desk with monitor stand. Modern work study desk for home office. Features built-in power outlets, USB ports, LED lighting, and multiple storage compartments.',
  'CT-OFF-002',
  449.99,
  40,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/519YovQY8YL._AC_SL1000_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Wooden Podium Elegant Lectern Conference Stand',
  'wooden-podium-elegant-lectern-conference-stand',
  'Elegant wooden podium for presentations and conferences',
  'Professional wooden podium with elegant design. Perfect for presentations, conferences, and speeches. Adjustable height. Premium wood construction. Built-in storage compartment. Classic design.',
  'CT-OFF-003',
  499.99,
  30,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71M3ccaqHGL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Yealink Wireless Headset Certified Softphone Noise Cancelling',
  'yealink-wireless-headset-certified-softphone-noise-cancelling',
  'Professional wireless headset with noise cancellation',
  'Premium wireless headset with active noise cancellation. Certified for softphone use. Long battery life. Perfect for remote work and calls. Comfortable over-ear design. Crystal clear audio quality.',
  'CT-OFF-004',
  399.99,
  50,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/513TMdNQZBL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'SILKYDRY Cabinet Storage Organizer Printer Stand',
  'silkydry-cabinet-storage-organizer-printer-stand',
  'Organized storage cabinet with printer stand',
  'Multi-functional storage cabinet with dedicated printer space. Multiple shelves and compartments for office organization. Modern design. Durable construction. Perfect for home or office use.',
  'CT-OFF-005',
  349.99,
  45,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/61ytH4tMUnL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'EMPSIGN Briefcase Water Repellent Overnight Computer Bag',
  'empsign-briefcase-water-repellent-overnight-computer-bag',
  'Professional water-repellent briefcase for laptop and travel',
  'Durable water-repellent briefcase perfect for laptops and travel. Multiple compartments for organization. Overnight capacity. Professional design. Padded laptop compartment. TSA-friendly design.',
  'CT-OFF-006',
  279.99,
  70,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/71J-TF9qXxL._AC_SL1500_.jpg']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET 
  name = EXCLUDED.name,
  sku = CASE 
    WHEN NOT EXISTS (SELECT 1 FROM products WHERE sku = EXCLUDED.sku AND slug != EXCLUDED.slug) 
    THEN EXCLUDED.sku 
    ELSE products.sku 
  END,
  short_description = EXCLUDED.short_description,
  description = EXCLUDED.description,
  images = EXCLUDED.images,
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  status = EXCLUDED.status,
  category_id = EXCLUDED.category_id;

-- Verify products were added
SELECT 
  COUNT(*) as total_products,
  COUNT(CASE WHEN images IS NOT NULL AND array_length(images, 1) > 0 THEN 1 END) as products_with_images
FROM products 
WHERE status = 'active';

-- Show sample products
SELECT name, slug, price, array_length(images, 1) as image_count 
FROM products 
WHERE status = 'active' 
ORDER BY created_at DESC 
LIMIT 10;

