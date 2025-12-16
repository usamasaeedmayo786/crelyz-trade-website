-- Migration: Add Amazon Products
-- This migration adds products from Amazon URLs provided
-- Note: Product names, prices, and images need to be extracted from Amazon and updated

-- First, ensure categories exist (they should already exist from previous migrations)
-- Categories: fitness, furniture, kitchen, home-appliances, office

-- FITNESS PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Trampoline Fitness Rebounder with Adjustable Handlebar',
  'trampoline-fitness-rebounder-adjustable-handlebar',
  'Professional fitness trampoline with adjustable handlebar for home workouts',
  'High-quality fitness trampoline designed for rebounding exercises. Features adjustable handlebar for stability and support during workouts. Perfect for cardio, strength training, and low-impact exercise routines.',
  'CT-FIT-001',
  129.99,
  50,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'fitness';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Adjustable Dumbbell Set with Stand',
  'adjustable-dumbbell-set-with-stand',
  'Versatile adjustable dumbbell set perfect for home gym',
  'Space-saving adjustable dumbbell set with stand. Adjustable weight system allows for multiple weight combinations. Ideal for strength training and muscle building.',
  'CT-FIT-002',
  199.99,
  30,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'fitness';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Soozier Adjustable Equipment Strength Training Bench',
  'soozier-adjustable-strength-training-bench',
  'Professional adjustable bench for strength training exercises',
  'Heavy-duty adjustable bench for strength training. Multiple incline positions for various exercises. Supports up to 800lbs. Perfect for home gym setup.',
  'CT-FIT-003',
  159.99,
  25,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'fitness';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'MaxiClimber Hydraulic Resistance Lightweight Mainframe',
  'maxiclimber-hydraulic-resistance-lightweight',
  'Compact hydraulic resistance climber for full-body workouts',
  'Space-efficient hydraulic resistance climber. Provides full-body workout with smooth hydraulic resistance. Lightweight and easy to store. Perfect for small spaces.',
  'CT-FIT-004',
  89.99,
  40,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'fitness';

-- FURNITURE PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Toilet Bathroom Organizer Adjustable Freestanding',
  'toilet-bathroom-organizer-adjustable-freestanding',
  'Space-saving bathroom organizer with adjustable shelves',
  'Modern freestanding bathroom organizer with adjustable shelves. Perfect for organizing toiletries and bathroom essentials. Easy to assemble and clean.',
  'CT-FURN-002',
  49.99,
  60,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'furniture';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'HIGDBFE 8-Drawer Dresser with Charging Station',
  'higdbfe-8-drawer-dresser-charging-station',
  'Modern dresser with built-in charging station and 8 drawers',
  'Stylish 8-drawer dresser featuring built-in USB charging station. Spacious drawers for clothing storage. Modern design perfect for bedroom organization.',
  'CT-FURN-003',
  299.99,
  35,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'furniture';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Tribesigns 39.4-Inch Thickened Industrial Geometric Bookshelf',
  'tribesigns-industrial-geometric-bookshelf',
  'Industrial-style geometric bookshelf with thickened design',
  'Modern industrial geometric bookshelf with thickened shelves. Unique design adds style to any room. Perfect for books, decor, and storage.',
  'CT-FURN-004',
  179.99,
  45,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'furniture';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'BROTTAR Dresser Dressing Charging Farmhouse Style',
  'brottar-dresser-dressing-charging-farmhouse',
  'Farmhouse-style dresser with charging station and mirror',
  'Charming farmhouse-style dresser with built-in charging station and mirror. Multiple drawers for organization. Perfect blend of style and functionality.',
  'CT-FURN-005',
  349.99,
  30,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'furniture';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Modern Bedroom Dresser with Mirror',
  'modern-bedroom-dresser-with-mirror',
  'Contemporary bedroom dresser with full-length mirror',
  'Sleek modern dresser with integrated full-length mirror. Ample storage space with smooth drawer operation. Perfect for contemporary bedroom decor.',
  'CT-FURN-006',
  399.99,
  25,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'furniture';

-- KITCHEN PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'HOSHANHO Knife Set Stainless Steel with Sharpener',
  'hoshanho-knife-set-stainless-steel-sharpener',
  'Professional knife set with built-in sharpener',
  'Complete kitchen knife set with 15 pieces including chef knife, bread knife, utility knives, and built-in sharpener. Premium stainless steel construction.',
  'CT-KIT-003',
  79.99,
  70,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Echo Show 21 Smart Display with Alexa',
  'echo-show-21-smart-display-alexa',
  '21-inch smart display with Alexa voice assistant',
  'Large 21-inch smart display with Alexa. Perfect for kitchen use with hands-free control. Stream videos, check recipes, and control smart home devices.',
  'CT-KIT-004',
  249.99,
  40,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'ikkle Storage Shelves Kitchen Microwave Stand',
  'ikkle-storage-shelves-kitchen-microwave-stand',
  'Multi-tier kitchen storage stand for microwave and more',
  'Versatile kitchen storage stand with multiple tiers. Perfect for microwave, small appliances, and kitchen essentials. Space-saving design.',
  'CT-KIT-005',
  69.99,
  55,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'GoveeLife Upgraded Detector Ultra-Long Range Basement',
  'goveelife-detector-ultra-long-range-basement',
  'Advanced detector with ultra-long range for basement monitoring',
  'Professional-grade detector with extended range. Perfect for basement and large area monitoring. Advanced sensor technology with mobile app connectivity.',
  'CT-KIT-006',
  89.99,
  45,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'YOUNIKE Furniture Adjustable Streamlined Polypropylene',
  'younike-furniture-adjustable-streamlined-polypropylene',
  'Modern adjustable furniture piece in streamlined design',
  'Contemporary adjustable furniture piece made from durable polypropylene. Streamlined design fits modern interiors. Versatile and easy to maintain.',
  'CT-KIT-007',
  59.99,
  50,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'kitchen';

-- HOME APPLIANCES PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Techwood Electric Kettle Anti-scald Compatible Cookwares',
  'techwood-electric-kettle-anti-scald-compatible',
  'Safe electric kettle with anti-scald technology',
  'Premium electric kettle with anti-scald protection. Compatible with various cookware. Fast boiling with auto shut-off. Perfect for daily use.',
  'CT-HA-001',
  45.99,
  80,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Ultrean Precision Digital Kitchen Scale Stainless Steel',
  'ultrean-precision-digital-kitchen-scale-stainless',
  'Precise digital kitchen scale with stainless steel platform',
  'High-precision digital kitchen scale with large stainless steel platform. Accurate measurements up to 11lbs. LCD display with multiple unit options.',
  'CT-HA-002',
  24.99,
  90,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Food Party Electric Grill Hotpot Multi-function',
  'food-party-electric-grill-hotpot-multi-function',
  'Versatile electric grill and hotpot combo appliance',
  'Multi-function electric grill and hotpot combination. Perfect for indoor grilling and hotpot cooking. Adjustable temperature control. Easy to clean.',
  'CT-HA-003',
  129.99,
  50,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'NutriChef Multi-Function Countertop Rotisserie Oven',
  'nutrichef-multi-function-countertop-rotisserie-oven',
  'Versatile countertop rotisserie oven with multiple functions',
  'Professional countertop rotisserie oven with multiple cooking functions. Rotisserie, bake, broil, and toast capabilities. Large capacity for family meals.',
  'CT-HA-004',
  199.99,
  35,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'VIVOHOME Large Capacity Removable Temperature Commercial',
  'vivohome-large-capacity-removable-temperature-commercial',
  'Commercial-grade large capacity appliance with temperature control',
  'Professional-grade appliance with large capacity. Removable components for easy cleaning. Precise temperature control. Perfect for commercial or home use.',
  'CT-HA-005',
  349.99,
  25,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'home-appliances';

-- OFFICE PRODUCTS
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Stacking Student Chromed Learning Classroom Desk',
  'stacking-student-chromed-learning-classroom-desk',
  'Durable stacking desk perfect for classrooms and offices',
  'Heavy-duty stacking desk with chromed frame. Space-efficient design perfect for classrooms and offices. Easy to stack and store when not in use.',
  'CT-OFF-001',
  89.99,
  60,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'office';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Rolanstar Computer Desk with Outlets Drawers Storage',
  'rolanstar-computer-desk-outlets-drawers-storage',
  'Modern computer desk with built-in outlets and storage',
  'Contemporary computer desk featuring built-in power outlets and USB ports. Multiple drawers for organization. Spacious work surface. Perfect for home office.',
  'CT-OFF-002',
  249.99,
  40,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'office';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Wooden Podium Elegant Lectern Conference Stand',
  'wooden-podium-elegant-lectern-conference-stand',
  'Elegant wooden podium for presentations and conferences',
  'Professional wooden podium with elegant design. Perfect for presentations, conferences, and speeches. Adjustable height. Premium wood construction.',
  'CT-OFF-003',
  299.99,
  30,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'office';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'Yealink Wireless Headset Certified Softphone Noise Cancelling',
  'yealink-wireless-headset-certified-softphone-noise-cancelling',
  'Professional wireless headset with noise cancellation',
  'Premium wireless headset with active noise cancellation. Certified for softphone use. Long battery life. Perfect for remote work and calls.',
  'CT-OFF-004',
  199.99,
  50,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'office';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'SILKYDRY Cabinet Storage Organizer Printer Stand',
  'silkydry-cabinet-storage-organizer-printer-stand',
  'Organized storage cabinet with printer stand',
  'Multi-functional storage cabinet with dedicated printer space. Multiple shelves and compartments for office organization. Modern design.',
  'CT-OFF-005',
  149.99,
  45,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'office';

INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'EMPSIGN Briefcase Water Repellent Overnight Computer Bag',
  'empsign-briefcase-water-repellent-overnight-computer-bag',
  'Professional water-repellent briefcase for laptop and travel',
  'Durable water-repellent briefcase perfect for laptops and travel. Multiple compartments for organization. Overnight capacity. Professional design.',
  'CT-OFF-006',
  79.99,
  70,
  'active',
  c.id,
  ARRAY['https://images.unsplash.com/photo-1497366216548-37526070297c?w=800']::TEXT[]
FROM categories c WHERE c.slug = 'office';

-- Note: Product images are currently using placeholder URLs from Unsplash
-- Replace these with actual product images from Amazon URLs
-- Prices are estimated - update with actual prices from Amazon
-- Product names and descriptions are based on URL analysis - verify and update from actual Amazon product pages

