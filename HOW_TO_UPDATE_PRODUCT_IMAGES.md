# 📸 How to Change Product Images

This guide explains how to update product images in the admin panel and how changes reflect on your live website.

---

## 🎯 Quick Steps Overview

1. **Login to Admin Panel**
2. **Navigate to Products**
3. **Edit the Product**
4. **Update Image URLs**
5. **Save Changes**
6. **Changes appear live immediately!** ✨

---

## 📋 Step-by-Step Instructions

### Step 1: Access Admin Panel

1. Go to your website: `https://crelyztradeinc.com/login`
2. **Login** with your admin credentials
3. You'll be redirected to the admin dashboard

**Can't remember your credentials?**
- Check Supabase Dashboard → Authentication → Users
- Or reset password from Supabase Dashboard

---

### Step 2: Navigate to Products

1. In the admin panel, click **"Products"** in the navigation menu
2. You'll see a list of all products
3. Find the product you want to update

---

### Step 3: Edit the Product

1. Find the product in the list
2. Click the **"Edit"** button next to the product
3. The edit form will open with all product details

---

### Step 4: Update Image URLs

In the edit form, scroll down to the **"Images"** section:

1. **Find the Images field** (textarea labeled "Images (one URL per line)")

2. **Current images** will be displayed as URLs, one per line:
   ```
   https://example.com/old-image1.jpg
   https://example.com/old-image2.jpg
   ```

3. **Replace with new image URLs:**
   - Delete the old URLs
   - Add new image URLs, one per line:
   ```
   https://example.com/new-image1.jpg
   https://example.com/new-image2.jpg
   https://example.com/new-image3.jpg
   ```

4. **Image URL Format:**
   - ✅ Must be a full URL starting with `https://` or `http://`
   - ✅ First image = Main product image (shown on product cards)
   - ✅ Additional images = Gallery images (shown on product detail page)
   - ✅ One URL per line
   - ✅ No quotes or commas needed

---

### Step 5: Save Changes

1. Review your changes
2. Click the **"Update Product"** button (bottom right)
3. You'll be redirected back to the products list
4. The product is now updated! ✅

---

## 🌐 How Changes Reflect on Live Site

### Automatic & Instant Updates

**Good News:** Your changes appear on the live site **immediately** without needing to redeploy! 🎉

Here's why:

1. **Database-Driven:** Products are stored in Supabase database
2. **No Build Required:** Next.js fetches data from database at runtime
3. **Instant Sync:** Changes in database = instant changes on website

### What Happens When You Update Images:

1. ✅ **Admin Panel** → Saves new image URLs to Supabase database
2. ✅ **Website** → Fetches product data from Supabase (on every page load)
3. ✅ **Result** → New images appear immediately (may need browser refresh)

### To See Changes on Live Site:

1. **Wait 1-2 seconds** after saving (for database sync)
2. **Visit your website:** `https://crelyztradeinc.com/products`
3. **Hard refresh** your browser to clear cache:
   - **Windows/Linux:** `Ctrl + F5` or `Ctrl + Shift + R`
   - **Mac:** `Cmd + Shift + R`
4. **Navigate to the product** you updated
5. **New images should be visible!** ✨

---

## 🖼️ Where to Get Image URLs

### Option 1: Use Image Hosting Services

**Recommended Services:**
- **Imgur** - Free image hosting
- **Cloudinary** - Professional image hosting
- **Supabase Storage** - Built-in storage (if you have it set up)
- **AWS S3** - Cloud storage

**Steps:**
1. Upload your image to the hosting service
2. Get the public URL (should start with `https://`)
3. Copy and paste into the Images field

### Option 2: Use Existing Image URLs

If you have images already hosted elsewhere:
- Copy the direct image URL
- Paste it into the Images field

### Option 3: Use Unsplash (For Testing/Placeholders)

You can use Unsplash image URLs:
```
https://images.unsplash.com/photo-1234567890?w=800
```

**Note:** For production, use your own hosted images.

---

## 📝 Image URL Best Practices

### ✅ Good Image URLs:
```
https://cdn.example.com/products/chair-main.jpg
https://storage.googleapis.com/bucket/product-image.png
https://images.unsplash.com/photo-1234567890?w=800
```

### ❌ Bad Image URLs:
```
/static/images/chair.jpg (relative path - won't work)
file:///C:/Users/Images/chair.jpg (local file - won't work)
chair.jpg (not a full URL - won't work)
```

### Tips:

1. **Use HTTPS:** Always use `https://` for secure images
2. **Main Image First:** First URL becomes the main product image
3. **High Quality:** Use images at least 800x800px for best quality
4. **Multiple Images:** Add multiple URLs for product galleries
5. **Test URLs:** Make sure URLs are accessible (open in browser first)

---

## 🔄 Updating Multiple Products

To update images for multiple products:

1. Repeat Steps 2-5 for each product
2. Or use **Bulk Update via SQL** (advanced method below)

---

## 🚀 Advanced: Bulk Update via SQL

If you need to update many products at once, you can use SQL:

### Step 1: Access Supabase SQL Editor

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Select your project
3. Go to **SQL Editor**
4. Click **"New query"**

### Step 2: Use Update Query

```sql
-- Update images for a specific product by ID
UPDATE products
SET images = ARRAY[
  'https://example.com/new-image1.jpg',
  'https://example.com/new-image2.jpg',
  'https://example.com/new-image3.jpg'
]
WHERE id = 'product-id-here';

-- Update images for a product by slug
UPDATE products
SET images = ARRAY[
  'https://example.com/new-image1.jpg',
  'https://example.com/new-image2.jpg'
]
WHERE slug = 'product-slug-here';

-- Update images for multiple products
UPDATE products
SET images = ARRAY['https://example.com/new-image.jpg']
WHERE category_id = 'category-id-here';
```

### Step 3: Run the Query

1. Replace the URLs with your actual image URLs
2. Replace the `WHERE` condition with your product ID/slug
3. Click **"Run"** or press `Ctrl + Enter`
4. Changes are applied immediately!

---

## 🔍 Verify Changes

### Check Admin Panel:
1. Go to Products list
2. Edit the product again
3. Verify new URLs are saved

### Check Live Website:
1. Visit: `https://crelyztradeinc.com/products`
2. Find your product
3. Check product card image
4. Click product to see detail page
5. Verify all gallery images

### If Images Don't Show:

1. **Check URL is valid:**
   - Copy URL and paste in browser
   - Image should load directly

2. **Check URL format:**
   - Must start with `https://` or `http://`
   - Must be a direct image link (not a webpage)

3. **Clear browser cache:**
   - Hard refresh: `Ctrl + F5` (Windows) or `Cmd + Shift + R` (Mac)
   - Or use incognito/private mode

4. **Check database:**
   - Go to Supabase Dashboard → Table Editor → products
   - Verify images array contains correct URLs

5. **Wait a few seconds:**
   - Sometimes database sync takes a moment

---

## 🎨 Image Recommendations

### Image Specifications:

- **Format:** JPG, PNG, or WebP
- **Size:** At least 800x800px (larger is better)
- **Aspect Ratio:** 1:1 (square) or 4:3 (landscape) works best
- **File Size:** Under 2MB per image (for faster loading)
- **Quality:** High quality, professional product photos

### Main Product Image (First URL):
- **Recommended:** 1200x1200px
- **Purpose:** Shown on product cards and as main image
- **Important:** Make this your best, most representative image

### Gallery Images (Additional URLs):
- **Recommended:** 1000x1000px or larger
- **Purpose:** Shown on product detail page gallery
- **Can include:** Multiple angles, details, use cases

---

## 📱 Mobile Considerations

Images automatically resize for mobile devices, but ensure:
- ✅ Images are clear and visible on small screens
- ✅ Product is centered and well-lit
- ✅ Background is clean (white or neutral works best)

---

## ✅ Quick Checklist

Before saving:
- [ ] Image URLs are full URLs (start with `https://`)
- [ ] URLs are accessible (test in browser)
- [ ] First image is the best/main product image
- [ ] Image quality is high (at least 800x800px)
- [ ] File size is reasonable (< 2MB each)
- [ ] Images show the product clearly

After saving:
- [ ] Hard refresh browser (`Ctrl + F5`)
- [ ] Check product card image
- [ ] Check product detail page
- [ ] Check all gallery images
- [ ] Test on mobile device (if possible)

---

## 🆘 Troubleshooting

### Images Not Updating?

1. **Wait 2-3 seconds** after saving
2. **Hard refresh** browser (`Ctrl + F5`)
3. **Check database** - Verify URLs are saved correctly
4. **Test URL** - Copy/paste URL in browser to verify it works
5. **Clear cache** - Use incognito mode to bypass cache

### Images Showing Placeholder?

- ProductImage component shows placeholder for broken images
- **Fix:** Update image URLs to valid, accessible URLs
- Make sure URLs point directly to images (not HTML pages)

### Can't Access Admin Panel?

1. Go to `/login`
2. Check your credentials in Supabase Dashboard
3. Reset password if needed
4. Contact admin if you don't have access

---

## 📞 Need Help?

If you encounter issues:
1. Check this guide first
2. Verify image URLs are accessible
3. Check Supabase Dashboard for errors
4. Review browser console for errors (F12)

---

**Remember:** Changes to product images appear on your live site immediately after saving! No deployment needed! 🚀

