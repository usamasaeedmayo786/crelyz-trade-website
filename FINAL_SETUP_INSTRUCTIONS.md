# Final Setup Instructions - Complete Your Site

## 🚨 IMPORTANT: Fix the Server Error First

Your site is showing a server error. Follow these steps to fix it:

### Step 1: Run the Complete Product Seed Migration

1. **Go to Supabase Dashboard**
   - Visit [app.supabase.com](https://app.supabase.com)
   - Select your project
   - Go to **SQL Editor**

2. **Run Migration 006**
   - Click "New query"
   - Copy the entire contents of `supabase/migrations/006_complete_product_seed.sql`
   - Paste and click "Run"
   - This will add 20 products with images across all categories

3. **Verify Products Were Added**
   - Run this query to check:
   ```sql
   SELECT COUNT(*) as total, 
          COUNT(CASE WHEN images IS NOT NULL AND array_length(images, 1) > 0 THEN 1 END) as with_images
   FROM products 
   WHERE status = 'active';
   ```
   - You should see products with images

### Step 2: Increase Prices by $100 (Optional)

If you want to increase all prices:

1. **Run Migration 005**
   - Copy contents of `supabase/migrations/005_increase_prices_by_100.sql`
   - Run in SQL Editor

### Step 3: Verify Your Site Works

1. **Check Products Page**
   - Visit `https://www.crelyztradeinc.com/products`
   - You should see products with images

2. **Check Product Detail Page**
   - Click on any product
   - Should see full product details

3. **Check Categories**
   - Click "Categories" dropdown
   - Should see all categories
   - Clicking a category should filter products

## 📦 Products Included

The migration adds **20 products** across **5 categories**:

- **Fitness**: 4 products
- **Furniture**: 5 products  
- **Kitchen**: 5 products
- **Home Appliances**: 5 products
- **Office**: 6 products

All products have:
- ✅ Product images
- ✅ Descriptions
- ✅ Prices (already increased by $100)
- ✅ Stock quantities
- ✅ Proper categories

## 🔧 Troubleshooting

### If Products Still Don't Show:

1. **Check Environment Variables in Vercel**
   - Go to Vercel Dashboard → Your Project → Settings → Environment Variables
   - Verify these are set:
     - `NEXT_PUBLIC_SUPABASE_URL`
     - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
     - `SUPABASE_SERVICE_ROLE_KEY`

2. **Check Supabase Project Status**
   - Make sure your Supabase project is not paused
   - Free tier projects pause after inactivity

3. **Check Build Logs**
   - Go to Vercel → Deployments
   - Click on latest deployment
   - Check for any build errors

4. **Clear Vercel Cache**
   - In Vercel Dashboard → Deployments
   - Click "Redeploy" on latest deployment

### If Product Detail Pages Don't Work:

1. **Check Product Slugs**
   - Make sure products have valid slugs
   - Run: `SELECT slug FROM products WHERE status = 'active';`

2. **Check Images**
   - Verify images array is not empty
   - Run: `SELECT name, images FROM products WHERE status = 'active' LIMIT 5;`

## ✅ Final Checklist

- [ ] Migration 006 run successfully
- [ ] Products visible on `/products` page
- [ ] Product detail pages work
- [ ] Categories dropdown works
- [ ] Filters work (price, availability, sort)
- [ ] Forms work (Contact, Enquiry, Ask For Price)
- [ ] No server errors
- [ ] Site loads on `www.crelyztradeinc.com`

## 🎉 Your Site Should Now Be Complete!

After running the migration, your site will have:
- ✅ 20 products with images
- ✅ All categories populated
- ✅ Working product pages
- ✅ Working filters
- ✅ Polished UI
- ✅ All forms functional

If you still see errors, check the Vercel build logs and Supabase logs for specific error messages.

