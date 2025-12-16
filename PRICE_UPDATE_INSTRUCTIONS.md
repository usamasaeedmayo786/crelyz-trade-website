# Price Update Instructions - Add $100 to All Products

This guide explains how to increase all product prices by $100.

## Method 1: Using Supabase SQL Editor (Recommended)

1. **Go to Supabase Dashboard**
   - Visit [app.supabase.com](https://app.supabase.com)
   - Select your project

2. **Open SQL Editor**
   - Click on "SQL Editor" in the left sidebar
   - Click "New query"

3. **Run the Migration**
   - Copy the contents of `supabase/migrations/005_increase_prices_by_100.sql`
   - Paste into the SQL Editor
   - Click "Run" or press Ctrl+Enter

4. **Verify the Update**
   - Run this query to see updated prices:
   ```sql
   SELECT id, name, price 
   FROM products 
   WHERE status = 'active' 
   ORDER BY created_at DESC 
   LIMIT 10;
   ```

## Method 2: Using Admin Panel (Manual)

If you prefer to update prices manually:

1. **Go to Admin Panel**
   - Navigate to `/admin/products`
   - Click "Edit" on each product

2. **Update Price**
   - Add $100 to the current price
   - Click "Save"

**Note:** This method is time-consuming if you have many products.

## What the Migration Does

- Adds $100.00 to the price of all active products
- Only updates products that have a price set (not NULL)
- Leaves inactive/draft products unchanged

## Example

Before:
- Product A: $149.99 → After: $249.99
- Product B: $79.99 → After: $179.99
- Product C: $299.99 → After: $399.99

## Rollback (If Needed)

If you need to revert the price increase:

```sql
UPDATE products
SET price = price - 100.00
WHERE price IS NOT NULL
  AND status = 'active'
  AND price >= 100.00;
```

## Important Notes

- ⚠️ **Backup First**: Consider backing up your database before running the migration
- ✅ **Test First**: Test on a few products first if unsure
- 📊 **Verify**: Check prices after migration to ensure they updated correctly
- 💰 **Pricing Strategy**: Make sure $100 increase aligns with your pricing strategy

