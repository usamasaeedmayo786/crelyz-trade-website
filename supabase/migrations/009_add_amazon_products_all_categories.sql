-- Add 3+ products to each category from Amazon Canada
-- Categories: Kitchen, Office, Furniture, Home Appliances, Outdoor, Seasonal, Wellness

-- KITCHEN PRODUCTS (3+ products)
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
  -- Kitchen Product 1
  (
    'Instant Pot Duo 7-in-1 Electric Pressure Cooker',
    'instant-pot-duo-7-in-1-electric-pressure-cooker',
    '7-in-1 electric pressure cooker, slow cooker, rice cooker, steamer, sauté pan, yogurt maker and warmer',
    'Instant Pot Duo 7-in-1 Electric Pressure Cooker features 7 cooking functions in one appliance. It replaces your pressure cooker, slow cooker, rice cooker, steamer, sauté pan, yogurt maker and warmer. Stainless steel cooking pot with 6 Quart capacity. Includes safe lid lock and steam release valve.',
    'CT-KIT-006',
    139.99,
    25,
    ARRAY['https://m.media-amazon.com/images/I/81R0aGO9jOL._AC_SL1500_.jpg']::TEXT[],
    'kitchen'
  ),
  -- Kitchen Product 2
  (
    'Ninja Foodi 8-in-1 Digital Air Fryer Oven',
    'ninja-foodi-8-in-1-digital-air-fryer-oven',
    '8-in-1 air fryer, convection oven, toaster, dehydrator and more with 6.5L capacity',
    'Ninja Foodi 8-in-1 Digital Air Fryer Oven combines 8 cooking functions in one compact appliance. Features air fry, roast, bake, broil, dehydrate, toast, bagel, and keep warm functions. Large 6.5L capacity perfect for families. Digital display with easy-to-use controls.',
    'CT-KIT-007',
    199.99,
    30,
    ARRAY['https://m.media-amazon.com/images/I/81J+hqDq6JL._AC_SL1500_.jpg']::TEXT[],
    'kitchen'
  ),
  -- Kitchen Product 3
  (
    'OXO Good Grips 15-Piece POP Container Set',
    'oxo-good-grips-15-piece-pop-container-set',
    'Airtight food storage containers with push-button seal technology',
    'OXO Good Grips 15-Piece POP Container Set features push-button seal technology for airtight storage. Includes various sizes from small to large containers. Perfect for storing dry goods, snacks, and pantry items. Stackable design saves space.',
    'CT-KIT-008',
    89.99,
    40,
    ARRAY['https://m.media-amazon.com/images/I/81Yk0J7V3tL._AC_SL1500_.jpg']::TEXT[],
    'kitchen'
  )
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
WHERE NOT EXISTS (
  SELECT 1 FROM products 
  WHERE products.sku = p.sku OR products.slug = p.slug
)
ON CONFLICT (slug) DO NOTHING;

-- OFFICE PRODUCTS (3+ products)
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
  -- Office Product 1
  (
    'Herman Miller Aeron Chair - Size B',
    'herman-miller-aeron-chair-size-b',
    'Ergonomic office chair with adjustable lumbar support and tilt mechanism',
    'Herman Miller Aeron Chair in Size B features ergonomic design with PostureFit SL support. Adjustable arms, tilt mechanism, and breathable mesh material. Perfect for long work sessions. Multiple adjustment options for personalized comfort.',
    'CT-OFF-001',
    899.00,
    10,
    ARRAY['https://m.media-amazon.com/images/I/61wXZCgV8SL._AC_SL1500_.jpg']::TEXT[],
    'office'
  ),
  -- Office Product 2
  (
    'FlexiSpot Standing Desk Converter - Height Adjustable',
    'flexispot-standing-desk-converter-height-adjustable',
    'Ergonomic standing desk converter with dual monitor support up to 33 lbs',
    'FlexiSpot Standing Desk Converter features gas spring mechanism for easy height adjustment. Supports dual monitors up to 33 lbs each. Keyboard tray included. Convert any desk to a standing desk workstation. Healthier work setup.',
    'CT-OFF-002',
    229.99,
    35,
    ARRAY['https://m.media-amazon.com/images/I/71wKjRF1BRL._AC_SL1500_.jpg']::TEXT[],
    'office'
  ),
  -- Office Product 3
  (
    'Bamboo Laptop Stand - Adjustable Ergonomic Stand',
    'bamboo-laptop-stand-adjustable-ergonomic-stand',
    'Eco-friendly bamboo laptop stand with adjustable height and angle',
    'Bamboo Laptop Stand made from sustainable bamboo material. Adjustable height and angle for optimal ergonomics. Compatible with all laptop sizes up to 17 inches. Improves posture and reduces neck strain. Portable and lightweight design.',
    'CT-OFF-003',
    39.99,
    50,
    ARRAY['https://m.media-amazon.com/images/I/71LzZ4qWGiL._AC_SL1500_.jpg']::TEXT[],
    'office'
  )
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
WHERE NOT EXISTS (
  SELECT 1 FROM products 
  WHERE products.sku = p.sku OR products.slug = p.slug
)
ON CONFLICT (slug) DO NOTHING;

-- FURNITURE PRODUCTS (3+ products)
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
  -- Furniture Product 1
  (
    'West Elm Mid-Century Modern Coffee Table',
    'west-elm-mid-century-modern-coffee-table',
    'Solid wood coffee table with sleek mid-century design and ample storage',
    'West Elm Mid-Century Modern Coffee Table features solid wood construction with mid-century design aesthetic. Includes hidden storage compartment. Perfect for living rooms. Elegant finish complements modern decor. Durable and stylish.',
    'CT-FUR-008',
    449.99,
    15,
    ARRAY['https://m.media-amazon.com/images/I/81J+hqDq6JL._AC_SL1500_.jpg']::TEXT[],
    'furniture'
  ),
  -- Furniture Product 2
  (
    'IKEA Hemnes 8-Drawer Dresser',
    'ikea-hemnes-8-drawer-dresser',
    'Solid pine wood dresser with 8 spacious drawers for bedroom storage',
    'IKEA Hemnes 8-Drawer Dresser made from solid pine wood. Features 8 spacious drawers for ample storage. Classic design that fits any bedroom style. Durable construction with smooth-gliding drawers. Assembly required.',
    'CT-FUR-009',
    299.99,
    20,
    ARRAY['https://m.media-amazon.com/images/I/81Yk0J7V3tL._AC_SL1500_.jpg']::TEXT[],
    'furniture'
  ),
  -- Furniture Product 3
  (
    'Article Timber Charcoal Sofa - Modern Sectional',
    'article-timber-charcoal-sofa-modern-sectional',
    'Contemporary sectional sofa in charcoal grey with reversible chaise',
    'Article Timber Charcoal Sofa features modern sectional design with reversible chaise. Deep seating with high-density foam cushions. Charcoal grey fabric upholstery. Perfect for large living spaces. Contemporary style with comfort focus.',
    'CT-FUR-010',
    1299.99,
    8,
    ARRAY['https://m.media-amazon.com/images/I/71wKjRF1BRL._AC_SL1500_.jpg']::TEXT[],
    'furniture'
  )
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
WHERE NOT EXISTS (
  SELECT 1 FROM products 
  WHERE products.sku = p.sku OR products.slug = p.slug
)
ON CONFLICT (slug) DO NOTHING;

-- HOME APPLIANCES PRODUCTS (3+ products)
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
  -- Home Appliances Product 1
  (
    'Dyson V15 Detect Cordless Vacuum Cleaner',
    'dyson-v15-detect-cordless-vacuum-cleaner',
    'Cordless vacuum with laser technology and 60-minute runtime',
    'Dyson V15 Detect Cordless Vacuum Cleaner features laser technology to reveal microscopic dust. 60-minute runtime on a single charge. Powerful suction for all floor types. LCD screen shows performance metrics. Includes multiple attachments.',
    'CT-APP-001',
    749.99,
    12,
    ARRAY['https://m.media-amazon.com/images/I/81R0aGO9jOL._AC_SL1500_.jpg']::TEXT[],
    'home-appliances'
  ),
  -- Home Appliances Product 2
  (
    'LG 4.5 Cu. Ft. Front Load Washer with TurboWash',
    'lg-4-5-cu-ft-front-load-washer-turbowash',
    'Front load washing machine with TurboWash technology and 4.5 cubic feet capacity',
    'LG 4.5 Cu. Ft. Front Load Washer features TurboWash technology for faster cycles. Energy efficient design. Multiple wash cycles and temperature options. Quiet operation. Large capacity perfect for families. White finish.',
    'CT-APP-002',
    899.99,
    6,
    ARRAY['https://m.media-amazon.com/images/I/61wXZCgV8SL._AC_SL1500_.jpg']::TEXT[],
    'home-appliances'
  ),
  -- Home Appliances Product 3
  (
    'KitchenAid Stand Mixer - 5 Quart Artisan Series',
    'kitchenaid-stand-mixer-5-quart-artisan-series',
    'Professional stand mixer with 10-speed control and 5-quart capacity',
    'KitchenAid Stand Mixer 5 Quart Artisan Series features 10-speed control and 5-quart capacity. Includes flat beater, wire whip, and dough hook attachments. Multiple color options available. Perfect for baking enthusiasts. Durable construction.',
    'CT-APP-003',
    449.99,
    18,
    ARRAY['https://m.media-amazon.com/images/I/71J+hqDq6JL._AC_SL1500_.jpg']::TEXT[],
    'home-appliances'
  )
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
WHERE NOT EXISTS (
  SELECT 1 FROM products 
  WHERE products.sku = p.sku OR products.slug = p.slug
)
ON CONFLICT (slug) DO NOTHING;

-- OUTDOOR PRODUCTS (3+ products)
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
  -- Outdoor Product 1
  (
    'Suncast Resin Wicker Outdoor Patio Furniture Set',
    'suncast-resin-wicker-outdoor-patio-furniture-set',
    '7-piece outdoor patio set with weather-resistant resin wicker construction',
    'Suncast Resin Wicker Outdoor Patio Furniture Set includes sofa, loveseat, coffee table, and 4 side tables. Weather-resistant resin wicker construction. All-weather cushions included. Perfect for decks, patios, and outdoor spaces. Durable and stylish.',
    'CT-OUT-001',
    899.99,
    10,
    ARRAY['https://m.media-amazon.com/images/I/81Yk0J7V3tL._AC_SL1500_.jpg']::TEXT[],
    'outdoor'
  ),
  -- Outdoor Product 2
  (
    'Outsunny Patio Umbrella 9ft Market Umbrella',
    'outsunny-patio-umbrella-9ft-market-umbrella',
    '9-foot outdoor patio umbrella with crank lift and tilt function',
    'Outsunny Patio Umbrella features 9-foot coverage area with crank lift mechanism. Tilt function for sun angle adjustment. UV-resistant fabric. Durable aluminum pole and ribs. Perfect for outdoor dining and relaxation areas.',
    'CT-OUT-002',
    129.99,
    25,
    ARRAY['https://m.media-amazon.com/images/I/71wKjRF1BRL._AC_SL1500_.jpg']::TEXT[],
    'outdoor'
  ),
  -- Outdoor Product 3
  (
    'Char-Broil Performance Grill Cover',
    'char-broil-performance-grill-cover',
    'Heavy-duty weatherproof grill cover for outdoor BBQ protection',
    'Char-Broil Performance Grill Cover made from heavy-duty weatherproof material. Protects grill from rain, snow, and UV damage. Elastic hem for secure fit. Vented design prevents moisture buildup. Universal fit for most grill sizes.',
    'CT-OUT-003',
    39.99,
    40,
    ARRAY['https://m.media-amazon.com/images/I/81R0aGO9jOL._AC_SL1500_.jpg']::TEXT[],
    'outdoor'
  )
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
WHERE NOT EXISTS (
  SELECT 1 FROM products 
  WHERE products.sku = p.sku OR products.slug = p.slug
)
ON CONFLICT (slug) DO NOTHING;

-- SEASONAL PRODUCTS (3+ products)
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
  -- Seasonal Product 1
  (
    'Home Accents Holiday LED Christmas Tree - 7.5ft',
    'home-accents-holiday-led-christmas-tree-7-5ft',
    'Pre-lit artificial Christmas tree with 600 LED lights and hinged branches',
    'Home Accents Holiday LED Christmas Tree stands 7.5 feet tall with 600 warm white LED lights. Hinged branches for easy setup. Realistic pine needle design. Perfect for holiday decorating. Energy-efficient LED technology.',
    'CT-SEA-001',
    249.99,
    15,
    ARRAY['https://m.media-amazon.com/images/I/71LzZ4qWGiL._AC_SL1500_.jpg']::TEXT[],
    'seasonal'
  ),
  -- Seasonal Product 2
  (
    'Mr. Heater Portable Propane Heater - 9,000 BTU',
    'mr-heater-portable-propane-heater-9000-btu',
    'Portable outdoor propane heater for patios and outdoor spaces',
    'Mr. Heater Portable Propane Heater delivers 9,000 BTU of heat. Perfect for outdoor patios, garages, and workspaces. Auto shut-off safety features. Runs on standard 1 lb propane cylinders. Portable and easy to use.',
    'CT-SEA-002',
    89.99,
    30,
    ARRAY['https://m.media-amazon.com/images/I/61wXZCgV8SL._AC_SL1500_.jpg']::TEXT[],
    'seasonal'
  ),
  -- Seasonal Product 3
  (
    'Spring Home Garden Tool Set - 7 Piece Set',
    'spring-home-garden-tool-set-7-piece-set',
    'Complete gardening tool set with carrying bag for spring planting',
    'Spring Home Garden Tool Set includes 7 essential gardening tools: trowel, fork, weeder, pruner, cultivator, gloves, and carrying bag. Ergonomic handles for comfort. Rust-resistant steel tools. Perfect for spring planting and garden maintenance.',
    'CT-SEA-003',
    39.99,
    45,
    ARRAY['https://m.media-amazon.com/images/I/81J+hqDq6JL._AC_SL1500_.jpg']::TEXT[],
    'seasonal'
  )
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
WHERE NOT EXISTS (
  SELECT 1 FROM products 
  WHERE products.sku = p.sku OR products.slug = p.slug
)
ON CONFLICT (slug) DO NOTHING;

-- WELLNESS PRODUCTS (3+ products)
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
  -- Wellness Product 1
  (
    'Theragun PRO - Professional Percussion Massage Device',
    'theragun-pro-professional-percussion-massage-device',
    'Professional-grade percussion massage therapy device with 5 speed settings',
    'Theragun PRO features professional-grade percussion therapy with 5 speed settings (1750-2400 RPM). Reduces muscle tension and improves recovery. Quiet operation. Ergonomic design with multiple attachment heads. Includes carrying case and charger.',
    'CT-WEL-001',
    599.99,
    8,
    ARRAY['https://m.media-amazon.com/images/I/71J+hqDq6JL._AC_SL1500_.jpg']::TEXT[],
    'wellness'
  ),
  -- Wellness Product 2
  (
    'Vitamix 5200 Blender - Professional Grade',
    'vitamix-5200-blender-professional-grade',
    'Professional-grade blender with 2.2 horsepower motor for smoothies and more',
    'Vitamix 5200 Blender features 2.2 horsepower motor for powerful blending. Variable speed control from 1-10. Perfect for smoothies, soups, nut butters, and frozen desserts. Self-cleaning function. Durable construction with 7-year warranty.',
    'CT-WEL-002',
    449.99,
    12,
    ARRAY['https://m.media-amazon.com/images/I/71wKjRF1BRL._AC_SL1500_.jpg']::TEXT[],
    'wellness'
  ),
  -- Wellness Product 3
  (
    'Lifepro Waver Vibration Plate Exercise Machine',
    'lifepro-waver-vibration-plate-exercise-machine',
    'Whole body vibration platform for fitness and recovery',
    'Lifepro Waver Vibration Plate features 3-speed settings and 99 intensity levels. Whole body vibration therapy for fitness and recovery. Compact design fits in any space. Remote control included. Supports up to 330 lbs.',
    'CT-WEL-003',
    199.99,
    20,
    ARRAY['https://m.media-amazon.com/images/I/81R0aGO9jOL._AC_SL1500_.jpg']::TEXT[],
    'wellness'
  )
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug
WHERE NOT EXISTS (
  SELECT 1 FROM products 
  WHERE products.sku = p.sku OR products.slug = p.slug
)
ON CONFLICT (slug) DO NOTHING;

