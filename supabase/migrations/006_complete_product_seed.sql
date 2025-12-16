-- Complete Product Seed - All Products with Images
-- This migration seeds all products with proper images and details
-- Run this after ensuring categories exist

-- Clear existing products (optional - comment out if you want to keep existing)
-- DELETE FROM products;

-- FITNESS PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Trampoline Fitness Rebounder with Adjustable Handlebar',
  'trampoline-fitness-rebounder-adjustable-handlebar',
  'Professional fitness trampoline with adjustable handlebar for home workouts',
  'High-quality fitness trampoline designed for rebounding exercises. Features adjustable handlebar for stability and support during workouts. Perfect for cardio, strength training, and low-impact exercise routines. Durable construction supports up to 300lbs. Easy to assemble and store.',
  'CT-FIT-001',
  229.99,
  50,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'fitness'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Adjustable Dumbbell Set with Stand',
  'adjustable-dumbbell-set-with-stand',
  'Versatile adjustable dumbbell set perfect for home gym',
  'Space-saving adjustable dumbbell set with stand. Adjustable weight system allows for multiple weight combinations from 5lbs to 50lbs per dumbbell. Ideal for strength training and muscle building. Compact design perfect for home gyms.',
  'CT-FIT-002',
  299.99,
  30,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'fitness'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Soozier Adjustable Strength Training Bench',
  'soozier-adjustable-strength-training-bench',
  'Professional adjustable bench for strength training exercises',
  'Heavy-duty adjustable bench for strength training. Multiple incline positions for various exercises. Supports up to 800lbs. Perfect for home gym setup. Padded seat and backrest for comfort during workouts.',
  'CT-FIT-003',
  259.99,
  25,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'fitness'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'MaxiClimber Hydraulic Resistance Lightweight Mainframe',
  'maxiclimber-hydraulic-resistance-lightweight',
  'Compact hydraulic resistance climber for full-body workouts',
  'Space-efficient hydraulic resistance climber. Provides full-body workout with smooth hydraulic resistance. Lightweight and easy to store. Perfect for small spaces. Adjustable resistance levels for all fitness levels.',
  'CT-FIT-004',
  189.99,
  40,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'fitness'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

-- FURNITURE PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  '4 Pieces Rustic Dining Table Set',
  '4-pieces-rustic-dining-table-set',
  'Beautiful rustic dining set perfect for your home',
  'This 4-piece rustic dining table set includes a dining table and matching chairs. Made from high-quality materials, this set combines style and durability. Perfect for family gatherings and dinner parties. Seats 4 comfortably.',
  'CT-FURN-001',
  249.99,
  25,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Toilet Bathroom Organizer Adjustable Freestanding',
  'toilet-bathroom-organizer-adjustable-freestanding',
  'Space-saving bathroom organizer with adjustable shelves',
  'Modern freestanding bathroom organizer with adjustable shelves. Perfect for organizing toiletries and bathroom essentials. Easy to assemble and clean. Water-resistant design. Multiple storage compartments.',
  'CT-FURN-002',
  149.99,
  60,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'HIGDBFE 8-Drawer Dresser with Charging Station',
  'higdbfe-8-drawer-dresser-charging-station',
  'Modern dresser with built-in charging station and 8 drawers',
  'Stylish 8-drawer dresser featuring built-in USB charging station. Spacious drawers for clothing storage. Modern design perfect for bedroom organization. Smooth drawer operation. Durable construction.',
  'CT-FURN-003',
  399.99,
  35,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Tribesigns Industrial Geometric Bookshelf',
  'tribesigns-industrial-geometric-bookshelf',
  'Industrial-style geometric bookshelf with thickened design',
  'Modern industrial geometric bookshelf with thickened shelves. Unique design adds style to any room. Perfect for books, decor, and storage. Sturdy metal frame with wood shelves. Easy assembly required.',
  'CT-FURN-004',
  279.99,
  45,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'BROTTAR Dresser Dressing Charging Farmhouse Style',
  'brottar-dresser-dressing-charging-farmhouse',
  'Farmhouse-style dresser with charging station and mirror',
  'Charming farmhouse-style dresser with built-in charging station and mirror. Multiple drawers for organization. Perfect blend of style and functionality. Vintage-inspired design with modern conveniences.',
  'CT-FURN-005',
  449.99,
  30,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'furniture'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

-- KITCHEN PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  '19 Piece Silicone Kitchenware Utensil Set',
  '19-piece-silicone-kitchenware-utensil-set',
  'Heat resistant non-stick cooking tool set with wooden handles',
  'Complete 19-piece silicone kitchenware utensil set. Heat resistant and non-stick, these cooking tools feature wooden handles for comfortable grip. Perfect for all your cooking needs. Dishwasher safe and easy to clean.',
  'CT-KIT-001',
  205.00,
  70,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Techwood Indoor Grill Smokeless Grill',
  'techwood-indoor-grill-smokeless-grill',
  '1500W Indoor Korean BBQ Electric Tabletop Grill with Tempered Glass Lid',
  'Techwood Indoor Grill - 1500W smokeless grill perfect for indoor Korean BBQ. Features removable grill and griddle plates with drip tray. Includes tempered glass lid. Gray finish. No smoke technology for indoor use.',
  'CT-KIT-002',
  260.00,
  40,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556911220-bff31c812dba?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'HOSHANHO Knife Set Stainless Steel with Sharpener',
  'hoshanho-knife-set-stainless-steel-sharpener',
  'Professional knife set with built-in sharpener',
  'Complete kitchen knife set with 15 pieces including chef knife, bread knife, utility knives, and built-in sharpener. Premium stainless steel construction. Ergonomic handles for comfortable use. Dishwasher safe.',
  'CT-KIT-003',
  179.99,
  70,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Echo Show 21 Smart Display with Alexa',
  'echo-show-21-smart-display-alexa',
  '21-inch smart display with Alexa voice assistant',
  'Large 21-inch smart display with Alexa. Perfect for kitchen use with hands-free control. Stream videos, check recipes, and control smart home devices. HD display with stereo speakers. Perfect for cooking and entertainment.',
  'CT-KIT-004',
  349.99,
  40,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'ikkle Storage Shelves Kitchen Microwave Stand',
  'ikkle-storage-shelves-kitchen-microwave-stand',
  'Multi-tier kitchen storage stand for microwave and more',
  'Versatile kitchen storage stand with multiple tiers. Perfect for microwave, small appliances, and kitchen essentials. Space-saving design. Sturdy construction. Easy to assemble. Organize your kitchen efficiently.',
  'CT-KIT-005',
  169.99,
  55,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

-- HOME APPLIANCES PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Techwood Electric Kettle Anti-scald Compatible',
  'techwood-electric-kettle-anti-scald-compatible',
  'Safe electric kettle with anti-scald technology',
  'Premium electric kettle with anti-scald protection. Compatible with various cookware. Fast boiling with auto shut-off. Perfect for daily use. 1.7L capacity. Stainless steel construction.',
  'CT-HA-001',
  145.99,
  80,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Ultrean Precision Digital Kitchen Scale',
  'ultrean-precision-digital-kitchen-scale',
  'Precise digital kitchen scale with stainless steel platform',
  'High-precision digital kitchen scale with large stainless steel platform. Accurate measurements up to 11lbs. LCD display with multiple unit options. Tare function included. Perfect for baking and cooking.',
  'CT-HA-002',
  124.99,
  90,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Food Party Electric Grill Hotpot Multi-function',
  'food-party-electric-grill-hotpot-multi-function',
  'Versatile electric grill and hotpot combo appliance',
  'Multi-function electric grill and hotpot combination. Perfect for indoor grilling and hotpot cooking. Adjustable temperature control. Easy to clean. Non-stick surface. Perfect for family meals and entertaining.',
  'CT-HA-003',
  229.99,
  50,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'NutriChef Multi-Function Countertop Rotisserie Oven',
  'nutrichef-multi-function-countertop-rotisserie-oven',
  'Versatile countertop rotisserie oven with multiple functions',
  'Professional countertop rotisserie oven with multiple cooking functions. Rotisserie, bake, broil, and toast capabilities. Large capacity for family meals. Digital controls. Easy to clean interior.',
  'CT-HA-004',
  299.99,
  35,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'VIVOHOME Large Capacity Removable Temperature Commercial',
  'vivohome-large-capacity-removable-temperature-commercial',
  'Commercial-grade large capacity appliance with temperature control',
  'Professional-grade appliance with large capacity. Removable components for easy cleaning. Precise temperature control. Perfect for commercial or home use. Durable construction. Energy efficient.',
  'CT-HA-005',
  449.99,
  25,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

-- OFFICE PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Stacking Student Chromed Learning Classroom Desk',
  'stacking-student-chromed-learning-classroom-desk',
  'Durable stacking desk perfect for classrooms and offices',
  'Heavy-duty stacking desk with chromed frame. Space-efficient design perfect for classrooms and offices. Easy to stack and store when not in use. Adjustable height options available. Durable construction.',
  'CT-OFF-001',
  189.99,
  60,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Rolanstar Computer Desk with Outlets Drawers Storage',
  'rolanstar-computer-desk-outlets-drawers-storage',
  'Modern computer desk with built-in outlets and storage',
  'Contemporary computer desk featuring built-in power outlets and USB ports. Multiple drawers for organization. Spacious work surface. Perfect for home office. Cable management system included.',
  'CT-OFF-002',
  349.99,
  40,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Wooden Podium Elegant Lectern Conference Stand',
  'wooden-podium-elegant-lectern-conference-stand',
  'Elegant wooden podium for presentations and conferences',
  'Professional wooden podium with elegant design. Perfect for presentations, conferences, and speeches. Adjustable height. Premium wood construction. Built-in storage compartment. Classic design.',
  'CT-OFF-003',
  399.99,
  30,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Yealink Wireless Headset Certified Softphone Noise Cancelling',
  'yealink-wireless-headset-certified-softphone-noise-cancelling',
  'Professional wireless headset with noise cancellation',
  'Premium wireless headset with active noise cancellation. Certified for softphone use. Long battery life. Perfect for remote work and calls. Comfortable over-ear design. Crystal clear audio quality.',
  'CT-OFF-004',
  299.99,
  50,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'SILKYDRY Cabinet Storage Organizer Printer Stand',
  'silkydry-cabinet-storage-organizer-printer-stand',
  'Organized storage cabinet with printer stand',
  'Multi-functional storage cabinet with dedicated printer space. Multiple shelves and compartments for office organization. Modern design. Durable construction. Perfect for home or office use.',
  'CT-OFF-005',
  249.99,
  45,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'EMPSIGN Briefcase Water Repellent Overnight Computer Bag',
  'empsign-briefcase-water-repellent-overnight-computer-bag',
  'Professional water-repellent briefcase for laptop and travel',
  'Durable water-repellent briefcase perfect for laptops and travel. Multiple compartments for organization. Overnight capacity. Professional design. Padded laptop compartment. TSA-friendly design.',
  'CT-OFF-006',
  179.99,
  70,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800&h=800&fit=crop']::TEXT[]
FROM categories c WHERE c.slug = 'office'
ON CONFLICT (slug) DO UPDATE SET
  price = EXCLUDED.price,
  stock_quantity = EXCLUDED.stock_quantity,
  images = EXCLUDED.images;

-- Verify products were added
-- SELECT COUNT(*) as total_products, 
--        COUNT(CASE WHEN images IS NOT NULL AND array_length(images, 1) > 0 THEN 1 END) as products_with_images
-- FROM products 
-- WHERE status = 'active';

