# 🖼️ How to Change Product Images from Supabase

This guide shows you how to update product images directly in Supabase Dashboard and see changes instantly on your live website.

---

## 🚀 Quick Steps

1. **Open Supabase Dashboard**
2. **Go to Table Editor → products**
3. **Find and Edit the Product**
4. **Update the images array**
5. **Save Changes**
6. **Refresh your website** - Changes appear immediately! ✨

---

## 📋 Step-by-Step Instructions

### Step 1: Access Supabase Dashboard

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. **Sign in** with your Supabase account
3. **Select your project** (the one for your website)

---

### Step 2: Navigate to Products Table

1. In the left sidebar, click **"Table Editor"**
2. Click on the **"products"** table
3. You'll see a list of all products

---

### Step 3: Find the Product to Update

1. **Use the search/filter** (top right) to find a specific product:
   - Search by name, SKU, or slug
   - Or scroll through the list

2. **Click on the product row** you want to edit
   - The row will expand to show all fields

---

### Step 4: Locate the Images Field

1. Scroll down in the expanded row to find the **"images"** field
2. The images field shows as an **array** of URLs

**Current format example:**
```
["https://example.com/image1.jpg", "https://example.com/image2.jpg"]
```

---

### Step 5: Update Image URLs

#### Method A: Edit Array Directly

1. **Click on the images field** (it should be editable)
2. **Replace the URLs** with your new image URLs
3. **Format**: Array of strings, each URL in quotes, separated by commas

**Example - Single Image:**
```json
["https://example.com/new-image.jpg"]
```

**Example - Multiple Images:**
```json
["https://example.com/main-image.jpg", "https://example.com/image2.jpg", "https://example.com/image3.jpg"]
```

#### Method B: Use the Array Editor

1. **Click the edit icon** (pencil) next to the images field
2. A popup/editor will appear
3. **Add/Remove URLs**:
   - Click **"+"** to add a new URL
   - Click **"-"** to remove a URL
   - Edit existing URLs in the input fields
4. Click **"Save"** or **"OK"**

---

### Step 6: Save Changes

1. After updating the images field, scroll to the bottom
2. Click **"Save"** or **"Update"** button
3. You'll see a success message confirming the update

---

### Step 7: Verify on Live Website

1. **Wait 1-2 seconds** for database sync
2. Go to your live website: `https://crelyztradeinc.com/products`
3. **Hard refresh** your browser:
   - **Windows/Linux**: `Ctrl + F5` or `Ctrl + Shift + R`
   - **Mac**: `Cmd + Shift + R`
4. **Find the product** you just updated
5. **Check the product card** - new image should be visible! ✅
6. **Click on the product** to see the detail page - all gallery images should update

---

## 🖼️ Image URL Format Requirements

### ✅ Correct Format:

```json
["https://example.com/image1.jpg"]
```

Or multiple images:
```json
["https://example.com/main.jpg", "https://example.com/image2.jpg"]
```

### ✅ Important Rules:

1. **Full URLs Only**: Must start with `https://` or `http://`
2. **Array Format**: Must be in square brackets `[]`
3. **Quotes**: Each URL must be in double quotes `"`
4. **Commas**: Separate multiple URLs with commas
5. **No Trailing Commas**: Don't add comma after the last URL

### ❌ Wrong Formats:

```json
// ❌ Missing quotes
[https://example.com/image.jpg]

// ❌ Not an array
"https://example.com/image.jpg"

// ❌ Relative path (won't work)
["/images/product.jpg"]

// ❌ Local file (won't work)
["file:///C:/images/product.jpg"]

// ❌ Trailing comma
["https://example.com/image.jpg",]
```

---

## 📝 Complete Example: Updating a Product

### Before:
```json
{
  "name": "Modern Office Chair",
  "images": [
    "https://old-cdn.com/chair-old.jpg",
    "https://old-cdn.com/chair-side.jpg"
  ]
}
```

### After (Updated):
```json
{
  "name": "Modern Office Chair",
  "images": [
    "https://new-cdn.com/chair-main.jpg",
    "https://new-cdn.com/chair-front.jpg",
    "https://new-cdn.com/chair-back.jpg"
  ]
}
```

---

## 🔄 Updating Multiple Products

To update images for multiple products:

1. **Repeat Steps 3-6** for each product
2. Or use **SQL Editor** for bulk updates (see Advanced Method below)

---

## 🚀 Advanced: Bulk Update via SQL Editor

If you need to update many products at once:

### Step 1: Open SQL Editor

1. In Supabase Dashboard, click **"SQL Editor"** (left sidebar)
2. Click **"New query"**

### Step 2: Write Update Query

**Update by Product ID:**
```sql
UPDATE products
SET images = ARRAY['https://example.com/new-main-image.jpg', 'https://example.com/new-gallery-1.jpg']
WHERE id = 'product-id-here';
```

**Update by Product Slug:**
```sql
UPDATE products
SET images = ARRAY['https://example.com/new-main-image.jpg', 'https://example.com/new-gallery-1.jpg']
WHERE slug = 'modern-office-chair';
```

**Update by Product Name:**
```sql
UPDATE products
SET images = ARRAY['https://example.com/new-main-image.jpg']
WHERE name = 'Modern Office Chair';
```

**Bulk Update Multiple Products:**
```sql
-- Update all products in a category
UPDATE products
SET images = ARRAY['https://example.com/default-category-image.jpg']
WHERE category_id = 'category-id-here';

-- Update products with specific condition
UPDATE products
SET images = ARRAY['https://example.com/sale-image.jpg']
WHERE status = 'active' AND price < 100;
```

### Step 3: Execute Query

1. **Replace** the URLs and conditions with your actual values
2. Click **"Run"** button (or press `Ctrl + Enter`)
3. You'll see how many rows were updated
4. Changes are applied immediately!

---

## ⚡ Why Changes Appear Instantly

Your website reads product data directly from Supabase database:
- ✅ **No deployment needed**
- ✅ **No build required**
- ✅ **Changes are instant**

The website fetches product data on every page load, so any changes in Supabase appear immediately (after a browser refresh).

---

## ✅ Quick Checklist

Before updating:
- [ ] Have new image URLs ready (tested in browser)
- [ ] URLs are accessible (open in browser to verify)
- [ ] URLs start with `https://` or `http://`
- [ ] Know which product to update (name, SKU, or ID)

After updating:
- [ ] Saved changes in Supabase
- [ ] Waited 1-2 seconds
- [ ] Hard refreshed browser (`Ctrl + F5`)
- [ ] Checked product card image
- [ ] Checked product detail page
- [ ] Verified all gallery images

---

## 🎨 Image Recommendations

### Best Practices:

1. **Main Image (First URL):**
   - Highest quality image
   - Shows product clearly
   - Best angle/representation
   - Recommended: 1200x1200px

2. **Gallery Images (Additional URLs):**
   - Multiple angles
   - Details and close-ups
   - Use cases/scenarios
   - Recommended: 1000x1000px or larger

3. **Image Quality:**
   - Format: JPG, PNG, or WebP
   - Size: Under 2MB per image
   - Resolution: At least 800x800px

---

## 🔍 Testing Image URLs

Before adding URLs to Supabase:

1. **Copy the image URL**
2. **Paste in browser address bar**
3. **Press Enter**
4. **Image should load directly** (not a webpage)
5. If it works, it's ready to use in Supabase ✅

---

## 🆘 Troubleshooting

### Images Don't Update on Website?

1. **Wait a few seconds** - Database sync takes a moment
2. **Hard refresh browser** - `Ctrl + F5` or `Cmd + Shift + R`
3. **Clear browser cache** - Use incognito/private mode
4. **Check URL format** - Must be valid JSON array
5. **Verify URLs** - Test URLs in browser first

### Error Saving in Supabase?

1. **Check JSON format** - Must be valid array syntax
2. **Check quotes** - URLs must be in double quotes
3. **No special characters** - Unless properly escaped
4. **Array brackets** - Must start with `[` and end with `]`

### Wrong Image Showing?

1. **Check array order** - First URL is the main image
2. **Verify URLs** - Make sure URLs are correct
3. **Test URLs** - Open URLs in browser to verify
4. **Check database** - Verify images were saved correctly

### Images Show Placeholder?

- This means image URLs are broken or inaccessible
- **Fix:** Update URLs to working, accessible image URLs
- Test URLs in browser before adding to Supabase

---

## 📞 Quick Reference

**Supabase Dashboard URL:**
- https://app.supabase.com

**Your Website:**
- https://crelyztradeinc.com/products

**Path in Supabase:**
- Table Editor → products → [Select Product] → images field

**Changes appear:**
- ✅ Immediately (after browser refresh)

---

## 🎯 Summary

1. **Supabase Dashboard** → Table Editor → products
2. **Click product row** to expand
3. **Find images field** (array type)
4. **Update URLs** in array format
5. **Save changes**
6. **Refresh website** - New images appear! ✨

**That's it!** No code, no deployment, just update in Supabase and refresh your browser! 🚀

