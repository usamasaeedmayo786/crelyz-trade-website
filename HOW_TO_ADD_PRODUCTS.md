# How to Add Products to Crelyz Trade Inc. Website

This guide will walk you through adding products to your website using the admin panel.

## Method 1: Using the Admin Panel (Recommended)

### Step 1: Set Up Admin Access (First Time Only)

If you haven't created an admin user yet:

1. Go to your **Supabase Dashboard**: https://supabase.com/dashboard
2. Select your project
3. Navigate to **Authentication** → **Users** in the left sidebar
4. Click **"Add user"** or **"Invite user"**
5. Enter:
   - **Email**: Your admin email address
   - **Password**: A strong password
   - **Auto Confirm User**: Enable this checkbox
6. Click **"Create user"** or **"Send invite"**

### Step 2: Log In to Admin Panel

1. Open your website: `http://localhost:3000` (or your production URL)
2. Navigate to: `http://localhost:3000/login`
3. Enter your admin credentials:
   - **Email**: The email you created in Supabase
   - **Password**: Your password
4. Click **"Sign in"**
5. You'll be redirected to `/admin` (Admin Dashboard)

### Step 3: Add a New Product

1. **From the Admin Dashboard:**
   - Click **"Products"** in the top navigation
   - OR click **"Manage Products"** card on the dashboard

2. **On the Products Page:**
   - Click the **"Add New Product"** button (top right)

3. **Fill in the Product Form:**

   **Required Fields:**
   - **Product Name** *: e.g., "Modern Office Desk Chair"
   - **Slug** *: Auto-generated from name (you can edit it)
     - Format: `modern-office-desk-chair`
     - Must be unique, lowercase, with hyphens
   - **SKU** *: Unique product code, e.g., "CRZ-OFF-CHAIR-001"
   - **Status** *: Choose from:
     - `active` - Product will show on website
     - `draft` - Hidden from public, but saved
     - `archived` - Archived product

   **Optional Fields:**
   - **Category**: Select from dropdown (Furniture, Kitchen, etc.)
   - **Price**: Enter price in CAD, e.g., `299.99`
   - **Stock Quantity**: Number of units available, e.g., `50`
   - **Short Description**: One-line description (shown on product cards)
   - **Description**: Full product description (shown on product detail page)
   - **Images**: Add image URLs (one per line)
     ```
     https://example.com/image1.jpg
     https://example.com/image2.jpg
     ```
     - First image will be the main product image
     - Additional images will show in a gallery

4. **Save the Product:**
   - Click **"Create Product"** button
   - You'll be redirected to the products list
   - Your new product will appear there

### Step 4: Edit an Existing Product

1. Go to **Admin Panel** → **Products**
2. Find the product in the list
3. Click **"Edit"** next to the product
4. Make your changes
5. Click **"Update Product"**

### Step 5: View Your Product on the Website

1. Go to your public website: `http://localhost:3000`
2. Navigate to **Catalog** or **Products**
3. Your new product should appear if status is `active`
4. Click on the product to see the full detail page

---

## Method 2: Using SQL (For Bulk Imports)

If you have many products to add at once, you can use SQL:

### Step 1: Access Supabase SQL Editor

1. Go to **Supabase Dashboard** → **SQL Editor**
2. Click **"New query"**

### Step 2: Use This Template

```sql
-- Insert a single product
INSERT INTO products (
  name,
  slug,
  short_description,
  description,
  sku,
  price,
  stock_quantity,
  status,
  category_id,
  images
) VALUES (
  'Your Product Name',
  'your-product-slug',
  'Short one-line description',
  'Full product description with multiple lines of details about the product features, materials, and benefits.',
  'CRZ-CAT-SKU-001',
  199.99,
  25,
  'active',
  (SELECT id FROM categories WHERE slug = 'furniture'), -- Change 'furniture' to your category slug
  ARRAY['https://example.com/image1.jpg', 'https://example.com/image2.jpg']::TEXT[]
);
```

### Step 3: Available Category Slugs

- `furniture`
- `home-appliances`
- `tools`
- `fitness`
- `wellness`
- `kitchen`
- `office`

### Step 4: Bulk Insert Example

```sql
-- Insert multiple products at once
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
  ('Product 1', 'product-1-slug', 'Short desc 1', 'Full desc 1', 'SKU-001', 99.99, 10, ARRAY['https://image1.jpg']::TEXT[], 'furniture'),
  ('Product 2', 'product-2-slug', 'Short desc 2', 'Full desc 2', 'SKU-002', 149.99, 20, ARRAY['https://image2.jpg']::TEXT[], 'kitchen')
) AS p(name, slug, short_description, description, sku, price, stock_quantity, images, category_slug)
JOIN categories c ON c.slug = p.category_slug;
```

---

## Tips & Best Practices

### Product Images

1. **Image Requirements:**
   - Use high-quality images (recommended: 800x800px or larger)
   - Supported formats: JPG, PNG, WebP
   - First image is the main/featured image
   - Additional images appear in product gallery

2. **Where to Host Images:**
   - **Option 1**: Upload to Supabase Storage (recommended)
     - Go to Supabase Dashboard → Storage
     - Create a bucket called `product-images`
     - Upload images and copy the public URL
   - **Option 2**: Use external hosting (Imgur, Cloudinary, etc.)
   - **Option 3**: Use placeholder services for testing:
     - `https://via.placeholder.com/800x800?text=Product+Name`

### Product Slugs

- **Format**: lowercase, with hyphens
- **Examples**: 
  - ✅ `modern-office-chair`
  - ✅ `kitchen-utensil-set-19-piece`
  - ❌ `Modern Office Chair` (no spaces)
  - ❌ `modern_office_chair` (use hyphens, not underscores)
- **Auto-generated**: The form auto-generates slugs from product names
- **Must be unique**: Each product needs a unique slug

### SKU Format

- **Recommended format**: `CRZ-CATEGORY-TYPE-NUMBER`
- **Examples**:
  - `CRZ-FUR-CHAIR-001` (Furniture - Chair)
  - `CRZ-KIT-UTENSIL-019` (Kitchen - Utensil)
  - `CRZ-APP-GRILL-1500` (Appliance - Grill)

### Product Status

- **active**: Product is visible on the public website
- **draft**: Product is saved but hidden from public
- **archived**: Product is archived (hidden from public)

### Categories

If you need to add a new category:

1. Go to **Supabase Dashboard** → **SQL Editor**
2. Run:
```sql
INSERT INTO categories (name, slug) 
VALUES ('New Category Name', 'new-category-slug')
ON CONFLICT (slug) DO NOTHING;
```

---

## Troubleshooting

### Product Not Showing on Website?

1. **Check Status**: Make sure status is set to `active`
2. **Check Category**: Ensure category is selected
3. **Clear Cache**: Hard refresh your browser (Ctrl+F5 or Cmd+Shift+R)
4. **Check Database**: Verify product exists in Supabase Table Editor

### Can't Log In to Admin Panel?

1. **Verify User Exists**: Check Supabase Dashboard → Authentication → Users
2. **Check Email**: Make sure you're using the exact email from Supabase
3. **Reset Password**: In Supabase Dashboard, you can reset the user's password
4. **Check Environment Variables**: Ensure `.env.local` has correct Supabase credentials

### Images Not Loading?

1. **Check URLs**: Verify image URLs are accessible (open in new tab)
2. **HTTPS**: Use HTTPS URLs (not HTTP)
3. **CORS**: If hosting images yourself, ensure CORS is enabled
4. **Format**: Use one URL per line in the images field

### Slug Already Exists Error?

1. **Change Slug**: Edit the slug to make it unique
2. **Check Existing**: Look at existing products to see what slugs are used
3. **Add Suffix**: Add a number or identifier, e.g., `product-name-2`

---

## Quick Reference

### Admin Panel URLs

- **Login**: `/login`
- **Dashboard**: `/admin`
- **Products List**: `/admin/products`
- **Add Product**: `/admin/products/new`
- **Edit Product**: `/admin/products/[id]`
- **Enquiries**: `/admin/enquiries`

### Required Fields for Products

- ✅ Product Name
- ✅ Slug
- ✅ SKU
- ✅ Status

### Optional but Recommended

- Category
- Price
- Short Description
- Description
- Images (at least one)
- Stock Quantity

---

## Need Help?

If you encounter any issues:

1. Check the browser console for errors (F12)
2. Check Supabase logs in the Dashboard
3. Verify your database schema matches the migration files
4. Ensure RLS policies are set up correctly

Happy product adding! 🎉

