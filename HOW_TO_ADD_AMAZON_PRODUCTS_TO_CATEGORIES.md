# 📦 How to Add Amazon Products to All Categories

This guide will help you add at least 3 Amazon products to each category on your website.

---

## 🎯 Goal

Add **3+ products** to each of these categories:
- ✅ Kitchen
- ✅ Office
- ✅ Furniture
- ✅ Home Appliances
- ✅ Outdoor
- ✅ Seasonal
- ✅ Wellness

---

## 📋 Step-by-Step Process

### Step 1: Find Products on Amazon Canada

1. Go to **Amazon.ca**
2. Search for products in each category
3. Choose **popular, well-reviewed products**
4. Copy the **Amazon product URL** (ASIN)

### Step 2: Extract Product Information

For each product, collect:
- ✅ Product Name (exact from Amazon)
- ✅ Amazon Product URL
- ✅ Product Image URL
- ✅ Price (CAD)
- ✅ Short Description
- ✅ Full Description
- ✅ SKU (create unique SKU like `CT-KIT-003`)

### Step 3: Extract Product Images

**Method 1: Manual**
1. Go to Amazon product page
2. Right-click main product image
3. Copy image address
4. URL format: `https://m.media-amazon.com/images/I/[IMAGE_ID]._AC_SL1500_.jpg`

**Method 2: Use Browser Developer Tools**
1. Open Amazon product page
2. Press `F12` (Developer Tools)
3. Go to Network tab → Images
4. Find the main product image
5. Copy the image URL

### Step 4: Update SQL File

1. Open: `supabase/migrations/009_add_amazon_products_all_categories.sql`
2. Replace placeholder URLs with real Amazon URLs
3. Update image URLs with extracted Amazon image URLs
4. Verify prices match Amazon Canada prices

### Step 5: Run SQL in Supabase

1. Go to **Supabase Dashboard** → **SQL Editor**
2. Copy the updated SQL from `009_add_amazon_products_all_categories.sql`
3. Click **Run**
4. Verify success message

---

## 🔍 Quick Reference: Product Examples

### Kitchen Products Examples:
- Instant Pot Duo (B00FLYWNYQ)
- Ninja Foodi Air Fryer (B08KFKHM68)
- KitchenAid Stand Mixer (B00004S1XK)

### Office Products Examples:
- Herman Miller Aeron Chair
- FlexiSpot Standing Desk
- Ergonomic Laptop Stand

### Furniture Products Examples:
- Coffee Tables
- Dressers
- Sectional Sofas

### Home Appliances Examples:
- Dyson Vacuums
- LG Washers
- Kitchen Appliances

### Outdoor Products Examples:
- Patio Furniture Sets
- Outdoor Umbrellas
- Grill Covers

### Seasonal Products Examples:
- Christmas Trees
- Portable Heaters
- Garden Tools

### Wellness Products Examples:
- Massage Devices (Theragun)
- Blenders (Vitamix)
- Exercise Equipment

---

## 📝 SQL Template for Adding Products

```sql
INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
SELECT 
  'PRODUCT_NAME',
  'product-slug',
  'Short description here',
  'Full detailed description here',
  'CT-CAT-XXX',
  99.99,
  25,
  'active',
  c.id,
  ARRAY['https://m.media-amazon.com/images/I/[IMAGE_ID]._AC_SL1500_.jpg']::TEXT[]
FROM categories c
WHERE c.slug = 'category-slug'
ON CONFLICT (slug) DO NOTHING;
```

---

## ✅ Checklist

Before running SQL, verify:
- [ ] All Amazon URLs are correct (Amazon.ca)
- [ ] All image URLs are valid (test in browser)
- [ ] Prices are in CAD and accurate
- [ ] SKUs are unique and follow pattern
- [ ] Each category has at least 3 products
- [ ] Product descriptions are complete
- [ ] Stock quantities are realistic

---

## 🚀 Quick Start: Use Pre-filled SQL

The file `supabase/migrations/009_add_amazon_products_all_categories.sql` already has:
- ✅ Product names and descriptions
- ✅ SKU codes
- ✅ Placeholder image URLs
- ✅ Price estimates

**You just need to:**
1. Replace placeholder image URLs with real Amazon image URLs
2. Update prices to match current Amazon prices
3. Verify Amazon product URLs (optional - if you add a URL field)

---

## 🔗 Adding Amazon Product URLs

If you want to store Amazon URLs with products, you can:

### Option 1: Add to Description
Include the Amazon URL in the product description

### Option 2: Add URL Field (Future Enhancement)
Add an `amazon_url` field to the products table:
```sql
ALTER TABLE products ADD COLUMN amazon_url TEXT;
```

Then update products:
```sql
UPDATE products SET amazon_url = 'https://www.amazon.ca/dp/ASIN' WHERE slug = 'product-slug';
```

---

## 📊 Verification

After adding products:

1. **Check Products Page**: `https://crelyztradeinc.com/products`
2. **Filter by Category**: Verify each category shows products
3. **Check Product Images**: Ensure all images load correctly
4. **Test Product Detail Pages**: Click products to verify details
5. **Check Homepage**: Verify products appear in "Proven bestsellers" or "New Arrivals"

---

## 🆘 Troubleshooting

### Images Not Loading?
- Verify image URLs are from `m.media-amazon.com`
- Check URLs are accessible (test in browser)
- Ensure URLs don't expire (use permanent image URLs)

### Products Not Appearing?
- Check category slugs match exactly
- Verify SQL ran successfully
- Check product status is 'active'
- Refresh browser cache

### Duplicate Products?
- SQL uses `ON CONFLICT (slug) DO NOTHING`
- Change slug if adding duplicate product
- Or use `ON CONFLICT (slug) DO UPDATE` to update existing

---

## 📈 Next Steps

After adding all products:
1. ✅ Test the website thoroughly
2. ✅ Verify all categories have products
3. ✅ Check product images load correctly
4. ✅ Update product prices if needed
5. ✅ Add more products if desired

---

**Need Help?** Check `AMAZON_PRODUCTS_COMPLETE_LIST.md` for detailed product list with suggested Amazon URLs.

