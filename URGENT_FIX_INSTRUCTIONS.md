# 🚨 URGENT: Fix Server Error - Step by Step

Your site is showing a server error. Follow these steps **IN ORDER**:

## Step 1: Run Quick Fix Migration (CRITICAL)

1. **Go to Supabase Dashboard**
   - Visit [app.supabase.com](https://app.supabase.com)
   - Select your project
   - Click **"SQL Editor"** in left sidebar
   - Click **"New query"**

2. **Copy and Run This SQL** (from `007_quick_fix_seed.sql`):
   ```sql
   -- Ensure categories exist
   INSERT INTO categories (name, slug) VALUES
     ('Fitness', 'fitness'),
     ('Furniture', 'furniture'),
     ('Kitchen', 'kitchen'),
     ('Home Appliances', 'home-appliances'),
     ('Office', 'office'),
     ('Tools', 'tools'),
     ('Wellness', 'wellness')
   ON CONFLICT (slug) DO NOTHING;

   -- Add products with images
   INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
   SELECT 
     '4 Pieces Rustic Dining Table Set',
     '4-pieces-rustic-dining-table-set',
     'Beautiful rustic dining set perfect for your home',
     'This 4-piece rustic dining table set includes a dining table and matching chairs. Made from high-quality materials, this set combines style and durability. Perfect for family gatherings and dinner parties.',
     'CT-FURN-001',
     249.99,
     25,
     'active',
     c.id,
     ARRAY['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop']::TEXT[]
   FROM categories c WHERE c.slug = 'furniture'
   ON CONFLICT (slug) DO UPDATE SET
     images = EXCLUDED.images,
     price = EXCLUDED.price,
     stock_quantity = EXCLUDED.stock_quantity;

   INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
   SELECT 
     '19 Piece Silicone Kitchenware Utensil Set',
     '19-piece-silicone-kitchenware-utensil-set',
     'Heat resistant non-stick cooking tool set with wooden handles',
     'Complete 19-piece silicone kitchenware utensil set. Heat resistant and non-stick, these cooking tools feature wooden handles for comfortable grip. Perfect for all your cooking needs.',
     'CT-KIT-001',
     205.00,
     70,
     'active',
     c.id,
     ARRAY['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop']::TEXT[]
   FROM categories c WHERE c.slug = 'kitchen'
   ON CONFLICT (slug) DO UPDATE SET
     images = EXCLUDED.images,
     price = EXCLUDED.price,
     stock_quantity = EXCLUDED.stock_quantity;

   INSERT INTO products (name, slug, short_description, description, sku, price, stock_quantity, status, category_id, images)
   SELECT 
     'Techwood Indoor Grill Smokeless Grill',
     'techwood-indoor-grill-smokeless-grill',
     '1500W Indoor Korean BBQ Electric Tabletop Grill',
     'Techwood Indoor Grill - 1500W smokeless grill perfect for indoor Korean BBQ. Features removable grill and griddle plates with drip tray. Includes tempered glass lid.',
     'CT-KIT-002',
     260.00,
     40,
     'active',
     c.id,
     ARRAY['https://images.unsplash.com/photo-1556911220-bff31c812dba?w=800&h=800&fit=crop']::TEXT[]
   FROM categories c WHERE c.slug = 'kitchen'
   ON CONFLICT (slug) DO UPDATE SET
     images = EXCLUDED.images,
     price = EXCLUDED.price,
     stock_quantity = EXCLUDED.stock_quantity;
   ```

3. **Click "Run"** and wait for success message

4. **Verify Products Exist**:
   ```sql
   SELECT name, slug, array_length(images, 1) as image_count 
   FROM products 
   WHERE status = 'active' 
   LIMIT 10;
   ```

## Step 2: Check Vercel Environment Variables

1. **Go to Vercel Dashboard**
   - Visit [vercel.com/dashboard](https://vercel.com/dashboard)
   - Select your project
   - Go to **Settings** → **Environment Variables**

2. **Verify These Are Set**:
   - `NEXT_PUBLIC_SUPABASE_URL` - Your Supabase project URL
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY` - Your Supabase anon key
   - `SUPABASE_SERVICE_ROLE_KEY` - Your Supabase service role key

3. **If Missing, Add Them**:
   - Get values from Supabase → Settings → API
   - Add each variable
   - **Redeploy** after adding

## Step 3: Redeploy on Vercel

1. **Trigger New Deployment**:
   - Go to Vercel → Deployments
   - Click **"Redeploy"** on latest deployment
   - Or push a new commit (already done)

2. **Wait for Build**:
   - Build should complete in 2-3 minutes
   - Check build logs for any errors

## Step 4: Test Your Site

1. **Visit Products Page**:
   - Go to `https://www.crelyztradeinc.com/products`
   - Should see products with images

2. **Click a Product**:
   - Click on any product card
   - Should open product detail page
   - Should see product image and details

3. **Test Categories**:
   - Click "Categories" dropdown
   - Select a category
   - Should filter products

## Step 5: If Still Getting Errors

### Check Vercel Build Logs:
1. Go to Vercel → Deployments
2. Click on latest deployment
3. Click "View Build Logs"
4. Look for error messages
5. Common issues:
   - Missing environment variables
   - Build errors
   - TypeScript errors

### Check Supabase Logs:
1. Go to Supabase Dashboard
2. Check if project is paused (free tier pauses after inactivity)
3. If paused, click "Restore" to reactivate

### Common Fixes:

**If "Cannot find module" error:**
- Run `npm install` locally
- Push changes
- Redeploy

**If "Environment variable missing" error:**
- Add missing variables in Vercel
- Redeploy

**If "Database connection" error:**
- Check Supabase project is active
- Verify environment variables are correct
- Check Supabase CORS settings

## ✅ Success Checklist

After following all steps:
- [ ] Migration 007 run successfully
- [ ] Products visible on `/products` page
- [ ] Can click and open product detail pages
- [ ] Product images load correctly
- [ ] No server errors
- [ ] Categories dropdown works
- [ ] Filters work

## 🆘 Still Need Help?

If errors persist:
1. Check Vercel build logs for specific error
2. Check Supabase logs
3. Verify environment variables are set correctly
4. Make sure Supabase project is active (not paused)

The code fixes have been pushed. You just need to:
1. ✅ Run the SQL migration (Step 1)
2. ✅ Verify environment variables (Step 2)
3. ✅ Wait for Vercel to redeploy (automatic)

Your site should work after these steps!

