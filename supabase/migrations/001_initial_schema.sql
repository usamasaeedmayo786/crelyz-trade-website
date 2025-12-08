-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Categories table
CREATE TABLE categories (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Products table (with extended fields)
CREATE TABLE products (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  short_description TEXT,
  sku TEXT UNIQUE NOT NULL,
  price NUMERIC(10, 2),
  stock_quantity INTEGER,
  status TEXT DEFAULT 'active' CHECK (status IN ('active', 'draft', 'archived')),
  images TEXT[] DEFAULT ARRAY[]::TEXT[],
  category_id UUID REFERENCES categories(id) ON DELETE SET NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enquiries table (with enriched fields)
CREATE TABLE enquiries (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  company TEXT,
  phone TEXT,
  country TEXT,
  product_id UUID REFERENCES products(id) ON DELETE SET NULL,
  cart_items JSONB,
  message TEXT NOT NULL,
  status TEXT DEFAULT 'new' CHECK (status IN ('new', 'contacted', 'closed')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX idx_products_slug ON products(slug);
CREATE INDEX idx_products_status ON products(status);
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_created ON products(created_at DESC);
CREATE INDEX idx_enquiries_status ON enquiries(status);
CREATE INDEX idx_enquiries_created ON enquiries(created_at DESC);
CREATE INDEX idx_categories_slug ON categories(slug);

-- Enable Row Level Security
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE enquiries ENABLE ROW LEVEL SECURITY;

-- RLS Policies for Categories
-- Public can read categories
CREATE POLICY "Categories are viewable by everyone"
  ON categories FOR SELECT
  USING (true);

-- Only authenticated admins can modify categories
CREATE POLICY "Only admins can insert categories"
  ON categories FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Only admins can update categories"
  ON categories FOR UPDATE
  USING (auth.role() = 'authenticated');

CREATE POLICY "Only admins can delete categories"
  ON categories FOR DELETE
  USING (auth.role() = 'authenticated');

-- RLS Policies for Products
-- Public can only read active products
CREATE POLICY "Active products are viewable by everyone"
  ON products FOR SELECT
  USING (status = 'active');

-- Authenticated users (admins) can read all products
CREATE POLICY "Admins can view all products"
  ON products FOR SELECT
  USING (auth.role() = 'authenticated');

-- Only authenticated admins can modify products
CREATE POLICY "Only admins can insert products"
  ON products FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

CREATE POLICY "Only admins can update products"
  ON products FOR UPDATE
  USING (auth.role() = 'authenticated');

CREATE POLICY "Only admins can delete products"
  ON products FOR DELETE
  USING (auth.role() = 'authenticated');

-- RLS Policies for Enquiries
-- Public can insert enquiries
CREATE POLICY "Anyone can submit enquiries"
  ON enquiries FOR INSERT
  WITH CHECK (true);

-- Only authenticated admins can read enquiries
CREATE POLICY "Only admins can view enquiries"
  ON enquiries FOR SELECT
  USING (auth.role() = 'authenticated');

CREATE POLICY "Only admins can update enquiries"
  ON enquiries FOR UPDATE
  USING (auth.role() = 'authenticated');

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger to automatically update updated_at
CREATE TRIGGER update_products_updated_at
  BEFORE UPDATE ON products
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

