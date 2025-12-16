# Canonical URL & Domain Redirect Setup

This guide explains how canonical URLs and www → non-www redirects are configured in your Next.js site.

## ✅ What's Configured

### 1. **Primary Domain: Non-WWW** (Recommended)
- Primary domain: `https://crelyztradeinc.com`
- Redirects: `https://www.crelyztradeinc.com` → `https://crelyztradeinc.com` (301 permanent redirect)

### 2. **Canonical URLs**
- Root layout includes canonical URL for homepage
- Product pages include dynamic canonical URLs
- All canonical URLs point to non-www version

### 3. **Middleware Redirect**
- Automatically redirects www to non-www
- Uses 301 permanent redirect (SEO-friendly)
- Excludes static files and API routes

---

## 🔧 Configuration

### Environment Variable

Add this to your `.env.local` and Vercel environment variables:

```env
NEXT_PUBLIC_SITE_URL=https://crelyztradeinc.com
```

**Important:** 
- Use `https://` (not `http://`)
- No trailing slash
- Use non-www version (your primary domain)

### Vercel Setup

1. Go to your Vercel project settings
2. Navigate to **Environment Variables**
3. Add: `NEXT_PUBLIC_SITE_URL` = `https://crelyztradeinc.com`
4. Redeploy your site

---

## 📁 Files Modified

### 1. `middleware.ts` (NEW)
- Handles www → non-www redirects
- Runs on every request (except static files)

### 2. `app/layout.tsx`
- Added canonical URL in metadata
- Uses `NEXT_PUBLIC_SITE_URL` environment variable

### 3. `app/(public)/products/[slug]/page.tsx`
- Added dynamic canonical URLs for product pages
- Format: `https://crelyztradeinc.com/products/{slug}`

---

## 🧪 Testing

### Test Redirects

1. **Visit www version:**
   ```
   https://www.crelyztradeinc.com
   ```
   Should redirect to: `https://crelyztradeinc.com`

2. **Check canonical URLs:**
   - View page source
   - Look for: `<link rel="canonical" href="https://crelyztradeinc.com/..." />`
   - Should always be non-www version

### Test Product Pages

1. Visit any product page:
   ```
   https://crelyztradeinc.com/products/trampoline-fitness-rebounder
   ```

2. Check canonical URL in page source:
   ```html
   <link rel="canonical" href="https://crelyztradeinc.com/products/trampoline-fitness-rebounder" />
   ```

---

## 🔄 Changing to WWW (If Needed)

If you prefer `www.crelyztradeinc.com` as primary:

1. **Update `middleware.ts`:**
   ```typescript
   // Change this section:
   if (!hostname.startsWith('www.')) {
     url.hostname = `www.${hostname}`;
     return NextResponse.redirect(url, 301);
   }
   ```

2. **Update environment variable:**
   ```env
   NEXT_PUBLIC_SITE_URL=https://www.crelyztradeinc.com
   ```

3. **Redeploy**

---

## ✅ SEO Benefits

- **Prevents duplicate content:** Search engines know which URL is canonical
- **Consolidates link equity:** All links point to one version
- **Better rankings:** Clear canonical signals help SEO
- **301 redirects:** Preserves SEO value when redirecting

---

## 🚀 Deployment Checklist

- [ ] Add `NEXT_PUBLIC_SITE_URL` to Vercel environment variables
- [ ] Verify domain is configured in Vercel (both www and non-www)
- [ ] Test www → non-www redirect
- [ ] Check canonical URLs in page source
- [ ] Verify product page canonical URLs
- [ ] Test on mobile and desktop

---

## 📝 Notes

- The middleware runs on **every request** but is very lightweight
- Static files (images, CSS, JS) are excluded from redirect logic
- API routes are excluded from redirect logic
- The redirect is a **301 permanent redirect** (best for SEO)

---

## 🆘 Troubleshooting

### Redirect not working?
1. Check Vercel domain configuration (both www and non-www should be added)
2. Verify middleware.ts is in the root directory
3. Check Vercel deployment logs for errors
4. Clear browser cache and test in incognito mode

### Canonical URL not showing?
1. Verify `NEXT_PUBLIC_SITE_URL` is set in environment variables
2. Check that the variable is available at build time
3. View page source (not just DevTools) to see canonical tag

### Want to change primary domain?
1. Update `NEXT_PUBLIC_SITE_URL` environment variable
2. Update middleware.ts redirect logic
3. Redeploy

---

**Current Configuration:** Non-WWW primary (`crelyztradeinc.com`) ✅

