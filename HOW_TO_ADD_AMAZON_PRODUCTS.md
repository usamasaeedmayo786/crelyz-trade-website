# How to Add Amazon Products to Database

This guide explains how to add products from the provided Amazon URLs to your database.

## Method 1: Using Admin Panel (Recommended)

1. **Log in to Admin Panel**
   - Go to `/login`
   - Sign in with your admin credentials

2. **Navigate to Products**
   - Click on "Products" in the admin menu
   - Click "Add New Product"

3. **For Each Product:**
   - Visit the Amazon URL from `PRODUCTS_TO_ADD.md`
   - Copy the product name exactly as shown on Amazon
   - Copy the price (convert to CAD if needed)
   - Copy the main product image URL (right-click image → Copy image address)
   - Fill in the form:
     - **Name**: Product name from Amazon
     - **Slug**: Auto-generated or create URL-friendly version
     - **Description**: Copy from Amazon product description
     - **Short Description**: Brief summary
     - **SKU**: Create unique SKU (e.g., CT-FIT-001)
     - **Price**: Price in CAD
     - **Stock Quantity**: Set appropriate quantity
     - **Category**: Select appropriate category
     - **Images**: Add main product image URL
     - **Status**: Set to "Active"

4. **Save Product**
   - Click "Save" or "Create Product"
   - Verify product appears in product list

## Method 2: Using SQL Migration

1. **Update Migration File**
   - Open `supabase/migrations/004_add_amazon_products.sql`
   - For each product, update:
     - Product name (exact from Amazon)
     - Price (from Amazon)
     - Image URLs (from Amazon product images)
     - Description (from Amazon)

2. **Extract Image URLs from Amazon:**
   - Visit product page
   - Right-click on main product image
   - Select "Copy image address"
   - Use this URL in the images array

3. **Run Migration:**
   - Go to Supabase Dashboard
   - Navigate to SQL Editor
   - Copy and paste the updated migration SQL
   - Click "Run"

## Product Categories Mapping

- **Fitness** → `fitness` category
- **Furniture** → `furniture` category  
- **Home and Kitchen** → `kitchen` category
- **Home Appliances** → `home-appliances` category
- **Office** → `office` category

## Tips for Extracting Product Information

### Product Name
- Copy exact name from Amazon product title
- Keep it concise but descriptive

### Price
- Note the price shown on Amazon
- Convert to CAD if needed
- Use decimal format (e.g., 129.99)

### Images
- Use the main product image (usually the first large image)
- Right-click → Copy image address
- Use high-resolution images when possible
- Format: `ARRAY['https://image-url.jpg']::TEXT[]`

### Description
- Copy the product description from Amazon
- Use the "About this item" section
- Keep it informative but not too long

### SKU Format
- Use format: `CT-{CATEGORY}-{NUMBER}`
- Examples:
  - `CT-FIT-001` (Fitness product 1)
  - `CT-FURN-002` (Furniture product 2)
  - `CT-KIT-003` (Kitchen product 3)
  - `CT-HA-004` (Home Appliances product 4)
  - `CT-OFF-005` (Office product 5)

## Quick Reference: Product Count

- **Fitness**: 4 products
- **Furniture**: 5 products
- **Kitchen**: 5 products
- **Home Appliances**: 5 products
- **Office**: 6 products
- **Total**: 25 products

## Verification

After adding products:
1. Check product appears in `/products` page
2. Verify category filtering works
3. Check product detail page loads correctly
4. Verify images display properly
5. Test search functionality

## Notes

- Product images in the migration use placeholder URLs
- Replace with actual Amazon product images
- Prices are estimates - update with actual Amazon prices
- Product names are based on URL analysis - verify from Amazon pages
- Descriptions should be updated with actual Amazon product descriptions

