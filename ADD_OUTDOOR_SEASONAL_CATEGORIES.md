# 🌳 Add Outdoor and Seasonal Categories

This guide shows you how to add the "Outdoor" and "Seasonal" categories to your database.

---

## 🚀 Quick Method: Using Supabase SQL Editor

### Step 1: Access Supabase SQL Editor

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Select your project
3. Click **"SQL Editor"** in the left sidebar
4. Click **"New query"**

### Step 2: Run the SQL Query

Copy and paste this SQL code:

```sql
-- Add Outdoor and Seasonal categories
INSERT INTO categories (name, slug) VALUES
  ('Outdoor', 'outdoor'),
  ('Seasonal', 'seasonal')
ON CONFLICT (slug) DO NOTHING;
```

### Step 3: Execute

1. Click **"Run"** button (or press `Ctrl + Enter`)
2. You should see a success message
3. The categories are now added! ✅

---

## ✅ Verify Categories Were Added

### Check in Supabase Table Editor:

1. Go to **Table Editor** → **categories**
2. You should see:
   - ✅ Outdoor (slug: `outdoor`)
   - ✅ Seasonal (slug: `seasonal`)

### Check on Your Website:

1. Visit your website: `https://crelyztradeinc.com`
2. Click **Categories** dropdown in navigation
3. You should see:
   - Outdoor
   - Seasonal

---

## 📋 What Was Updated

### Frontend Code Already Updated:

✅ **Homepage** (`app/(public)/page.tsx`):
- Added descriptions for Outdoor and Seasonal
- Added category images for Outdoor and Seasonal

✅ **Products Page** (`app/(public)/products/page.tsx`):
- Added descriptions for Outdoor and Seasonal

✅ **Category Images**:
- Outdoor: Patio/outdoor furniture image
- Seasonal: Seasonal/holiday themed image

---

## 🎨 Category Details

### Outdoor Category:
- **Name**: Outdoor
- **Slug**: `outdoor`
- **Description**: "Explore our outdoor living collection in Canada. From patio furniture to outdoor accessories, create the perfect outdoor space for relaxation and entertainment."
- **Image**: Patio/outdoor furniture themed image

### Seasonal Category:
- **Name**: Seasonal
- **Slug**: `seasonal`
- **Description**: "Discover seasonal products for every time of year in Canada. From holiday decorations to seasonal essentials, find everything you need for special occasions."
- **Image**: Seasonal/holiday themed image

---

## 🔄 Alternative: Using Admin Panel (If Available)

If your admin panel has category management:

1. Log in to admin panel: `https://crelyztradeinc.com/login`
2. Navigate to Categories (if available)
3. Add new category:
   - Name: `Outdoor`
   - Slug: `outdoor`
4. Add second category:
   - Name: `Seasonal`
   - Slug: `seasonal`
5. Save both categories

---

## 📝 Notes

- The SQL uses `ON CONFLICT (slug) DO NOTHING` so it's safe to run multiple times
- Categories will automatically appear in:
  - Navigation dropdown menu
  - Homepage category section
  - Products page category filter
- Categories are filtered the same way as others (tools/fitness excluded)
- You can now add products to these categories!

---

## ✅ After Adding Categories

1. ✅ Categories appear in dropdown menu
2. ✅ Categories show on homepage
3. ✅ Categories can be used when adding products
4. ✅ Product filtering works by these categories

---

**That's it!** Just run the SQL query in Supabase and the categories will be live on your website! 🎉

