# Extract Amazon Product Images

Since we need unique product images for each product, I've extracted images from a few Amazon URLs. However, to get all unique images, you'll need to visit each Amazon URL and extract the main product image.

## Images Already Extracted:
1. **Trampoline Fitness Rebounder** - `https://m.media-amazon.com/images/I/813XaWAXw4L._AC_SL1500_.jpg`
2. **Soozier Adjustable Bench** - `https://m.media-amazon.com/images/I/71115-n045L._AC_SL1500_.jpg`
3. **Bathroom Organizer** - `https://m.media-amazon.com/images/I/71mAY-c1uCL._AC_SL1500_.jpg`
4. **HOSHANHO Knife Set** - `https://m.media-amazon.com/images/I/81NuDZfC+-L._AC_SL1500_.jpg`
5. **MaxiClimber** - `https://m.media-amazon.com/images/I/61ISdnXUVDL._AC_SL1500_.jpg`

## How to Extract Images from Amazon URLs:

1. Visit each Amazon product URL
2. Right-click on the main product image
3. Select "Copy image address" or "Copy image URL"
4. The URL will look like: `https://m.media-amazon.com/images/I/[IMAGE_ID]._AC_SL1500_.jpg`
5. Update the SQL file with the correct image URL for each product

## Alternative: Use Browser Developer Tools

1. Open Amazon product page
2. Press F12 to open Developer Tools
3. Go to Network tab
4. Filter by "Img" or "image"
5. Look for the main product image request
6. Copy the image URL

## Products Still Needing Unique Images:

- Adjustable Dumbbell Set (B0DFH38CZW)
- 4 Pieces Rustic Dining Table Set
- HIGDBFE 8-Drawer Dresser (B0FBG1N9HN)
- Tribesigns Bookshelf (B0D1C7VRV6)
- BROTTAR Dresser (B0DPN1ZP6F)
- 19 Piece Silicone Kitchenware Set
- Techwood Indoor Grill (B07M5JKSWQ)
- Echo Show 21 (B0CDWJ5DVD)
- ikkle Storage Shelves (B0DPKWT1S2)
- Techwood Electric Kettle (B07M5JKSWQ)
- Ultrean Digital Scale (B08CZDYNF7)
- Food Party Electric Grill (B07VBSX6XN)
- NutriChef Rotisserie (B01MAWQSW5)
- VIVOHOME Appliance (B07XCK2CBP)
- All Office products

## Quick Fix:

For now, I've updated the SQL file to use unique Amazon product images where available. The remaining products use placeholder images that should be replaced with actual Amazon product images.

