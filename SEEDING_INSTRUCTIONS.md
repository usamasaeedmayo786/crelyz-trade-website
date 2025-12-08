# Database Seeding Instructions

## Overview
This document explains how to seed your Supabase database with categories and products to match the Crelyz Trade Inc. website.

## SQL Migration Files

### 1. Initial Schema (`001_initial_schema.sql`)
**Status:** Already created
**Purpose:** Creates all database tables, indexes, and RLS policies
**When to run:** First time setup only

### 2. Seed Data (`003_seed_categories_and_products.sql`)
**Status:** Ready to run
**Purpose:** Seeds categories and products
**When to run:** After initial schema is set up

## How to Run the Seeding Script

### Step 1: Access Supabase SQL Editor
1. Go to your Supabase project dashboard: https://supabase.com/dashboard
2. Navigate to **SQL Editor** in the left sidebar
3. Click **New query**

### Step 2: Run the Initial Schema (if not already done)
1. Open the file: `supabase/migrations/001_initial_schema.sql`
2. Copy the entire contents
3. Paste into the SQL Editor
4. Click **Run** (or press Ctrl+Enter)
5. Wait for success confirmation

### Step 3: Run the Seed Data Script
1. Open the file: `supabase/migrations/003_seed_categories_and_products.sql`
2. Copy the entire contents
3. Paste into the SQL Editor
4. Click **Run** (or press Ctrl+Enter)
5. Wait for success confirmation

## What Gets Seeded

### Categories (7 total)
- Furniture
- Home Appliances
- Tools
- Fitness
- Wellness
- Kitchen
- Office

### Products (5 total)
1. **4 Pieces Rustic Dining Table Set** - $149.99 CAD (Furniture)
2. **19 Piece Silicone Kitchenware Utensil Set** - $105.00 CAD (Kitchen)
3. **Techwood Smokeless Indoor Grill 1500W** - $160.00 CAD (Home Appliances)
4. **7-PC Patio Wicker Sectional Dining Set - Gray** - $777.77 CAD (Furniture)
5. **3-Seater Corduroy Sofa - Beige** - $399.00 CAD (Furniture)

## Safe Re-runs
The seeding script uses `ON CONFLICT DO NOTHING` and `ON CONFLICT DO UPDATE` clauses, so you can safely run it multiple times without creating duplicates.

## Homepage Data Dependencies

The homepage (`app/(public)/page.tsx`) pulls data from Supabase for:

1. **Proven Bestsellers Section**
   - Query: Latest 3 active products ordered by `created_at`
   - Location: Lines 10-15 in `app/(public)/page.tsx`

2. **New Arrivals Section**
   - Query: Latest 4 active products ordered by `created_at`
   - Location: Lines 18-23 in `app/(public)/page.tsx`

3. **Shop Top Categories Section**
   - Query: Categories with slugs: kitchen, office, furniture, home-appliances, tools
   - Location: Lines 26-30 in `app/(public)/page.tsx`

4. **Navigation Categories Dropdown**
   - Query: All categories ordered by name
   - Location: `app/layout.tsx` lines 18-21

## Verification

After running the seed script, verify the data:

1. In Supabase Dashboard, go to **Table Editor**
2. Check the `categories` table - should have 7 rows
3. Check the `products` table - should have 5 rows
4. Visit your homepage at `http://localhost:3000` to see the seeded products

## Troubleshooting

### Products not showing?
- Check that products have `status = 'active'`
- Verify category_id links correctly to categories table
- Check browser console for any errors

### Categories dropdown empty?
- Verify categories were inserted successfully
- Check that the Supabase client is properly configured
- Ensure environment variables are set correctly

### Images not loading?
- The seed script uses placeholder URLs (`https://via.placeholder.com/800x800`)
- Replace these with actual product images later via the admin panel

## Next Steps

1. Run the seeding script in Supabase SQL Editor
2. Verify data appears in Table Editor
3. Visit the homepage to see products displayed
4. Use the admin panel (`/admin`) to add more products or update existing ones

