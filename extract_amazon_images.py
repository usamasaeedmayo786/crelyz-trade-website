"""
Script to extract product images from Amazon URLs
This script visits Amazon product pages and extracts the main product image URL
"""

import re
import requests
from bs4 import BeautifulSoup

# Product URLs from PRODUCTS_TO_ADD.md
products = [
    # Fitness
    ("Trampoline Fitness Rebounder", "https://www.amazon.ca/Trampoline-Fitness-Rebounder-Adjustable-Handlebar/dp/B0FJXWDL1L"),
    ("Adjustable Dumbbell Set", "https://www.amazon.ca/gp/aw/d/B0DFH38CZW/"),
    ("Soozier Adjustable Strength Training", "https://www.amazon.ca/Soozier-Adjustable-Equipment-Strength-Training/dp/B0CN65BT3M"),
    ("MaxiClimber Hydraulic Resistance", "https://www.amazon.ca/MaxiClimber-Hydraulic-Resistance-Lightweight-Mainframe/dp/B0822ZDFHL"),
    
    # Furniture
    ("Toilet Bathroom Organizer", "https://www.amazon.ca/Toilet-Bathroom-Organizer-Adjustable-Freestanding/dp/B0CYZW6NZJ"),
    ("HIGDBFE 8-Drawer Dresser", "https://www.amazon.ca/HIGDBFE-8-Drawer-Dresser-Charging-Dressers/dp/B0FBG1N9HN"),
    ("Tribesigns Industrial Geometric", "https://www.amazon.ca/Tribesigns-39-4-Inch-Thickened-Industrial-Geometric/dp/B0D1C7VRV6"),
    ("BROTTAR Dresser", "https://www.amazon.ca/BROTTAR-Dresser-Dressing-Charging-Farmhouse/dp/B0DPN1ZP6F"),
    
    # Kitchen
    ("HOSHANHO Knife Set", "https://www.amazon.ca/HOSHANHO-Knife-Set-Stainless-Sharpener/dp/B0CP5QXC1H"),
    ("Echo Show 21", "https://www.amazon.ca/Echo-Show-21-Smart-Display/dp/B0CDWJ5DVD"),
    ("ikkle Storage Shelves", "https://www.amazon.ca/ikkle-Storage-Shelves-Kitchen-Microwave/dp/B0DPKWT1S2"),
    ("GoveeLife Detector", "https://www.amazon.ca/GoveeLife-Upgraded-Detector-Ultra-Long-Basement/dp/B0FPQY1HYS"),
    ("YOUNIKE Furniture", "https://www.amazon.ca/YOUNIKE-Furniture-Adjustable-Streamlined-Polypropylene/dp/B07TTWV987"),
    
    # Home Appliances
    ("Techwood Electric Kettle", "https://www.amazon.ca/Techwood-Electric-Anti-scald-Compatible-Cookwares/dp/B07M5JKSWQ"),
    ("Ultrean Precision Scale", "https://www.amazon.ca/Ultrean-Precision-Measures-Stainless-Batteries/dp/B08CZDYNF7"),
    ("Food Party Electric Grill", "https://www.amazon.ca/Food-Party-Electric-Grill-Hotpot/dp/B07VBSX6XN"),
    ("NutriChef Rotisserie", "https://www.amazon.ca/NutriChef-PKRT97-Multi-Function-Countertop-Rotisserie/dp/B01MAWQSW5"),
    ("VIVOHOME Large Capacity", "https://www.amazon.ca/VIVOHOME-Capacity-Removable-Temperature-Commercial/dp/B07XCK2CBP"),
    
    # Office
    ("Stacking Student Desk", "https://www.amazon.ca/Stacking-Student-Chromed-Learning-Classroom/dp/B0B7CLKTFX"),
    ("Rolanstar Computer Desk", "https://www.amazon.ca/Rolanstar-Computer-Outlets-Drawers-Storage/dp/B0C621P5B3"),
    ("Wooden Podium", "https://www.amazon.ca/Wooden-Podium-Elegant-Lectern-Conference/dp/B0F5W9QR82"),
    ("Yealink Wireless Headset", "https://www.amazon.ca/Yealink-Wireless-Certified-Softphone-Cancelling/dp/B0DP6QGGDD"),
    ("SILKYDRY Cabinet", "https://www.amazon.ca/SILKYDRY-Cabinet-Storage-Organizer-Printer/dp/B0FC5WNMYL"),
    ("EMPSIGN Briefcase", "https://www.amazon.ca/EMPSIGN-Briefcase-Water-Repellent-Overnight-Computer/dp/B0B8RDCYKK"),
]

def extract_image_from_url(url):
    """Extract main product image from Amazon URL"""
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        }
        response = requests.get(url, headers=headers, timeout=10)
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Try to find the main product image
        # Amazon uses various selectors for product images
        img_selectors = [
            '#landingImage',
            '#main-image',
            '#imgBlkFront',
            'img[data-a-image-name="landingImage"]',
            'img[data-a-dynamic-image]',
        ]
        
        for selector in img_selectors:
            img = soup.select_one(selector)
            if img:
                img_url = img.get('src') or img.get('data-src') or img.get('data-a-dynamic-image')
                if img_url:
                    # Extract the base image URL (remove size parameters)
                    if isinstance(img_url, str):
                        # Clean up the URL
                        img_url = img_url.split('?')[0]
                        # Convert to high-res version
                        if '_AC_' in img_url:
                            img_url = img_url.split('_AC_')[0] + '_AC_SL1500_.jpg'
                        return img_url
        
        # Fallback: look for any image with media-amazon.com
        imgs = soup.find_all('img', src=re.compile(r'm\.media-amazon\.com'))
        if imgs:
            img_url = imgs[0].get('src')
            if img_url:
                img_url = img_url.split('?')[0]
                if '_AC_' in img_url:
                    img_url = img_url.split('_AC_')[0] + '_AC_SL1500_.jpg'
                return img_url
                
    except Exception as e:
        print(f"Error extracting image from {url}: {e}")
    
    return None

if __name__ == "__main__":
    print("Extracting product images from Amazon URLs...")
    print("=" * 60)
    
    results = []
    for name, url in products:
        print(f"Processing: {name}")
        image_url = extract_image_from_url(url)
        if image_url:
            results.append((name, image_url))
            print(f"  ✓ Found: {image_url}")
        else:
            print(f"  ✗ Not found")
        print()
    
    print("\n" + "=" * 60)
    print("Results:")
    print("=" * 60)
    for name, img_url in results:
        print(f"{name}: {img_url}")

