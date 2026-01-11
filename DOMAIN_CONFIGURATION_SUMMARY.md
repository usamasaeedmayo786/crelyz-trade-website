# ✅ Domain Configuration Summary - crelyztradeinc.com

## 🎯 Primary Domain Configuration

**Primary Domain:** `crelyztradeinc.com` (non-www)  
**Redirect:** `www.crelyztradeinc.com` → `crelyztradeinc.com` (301 permanent redirect)

---

## 📋 Configuration Status

### ✅ Files Configured

1. **`middleware.ts`**
   - Redirects `www.crelyztradeinc.com` → `crelyztradeinc.com`
   - Uses 301 permanent redirect (SEO-friendly)
   - Default domain: `crelyztradeinc.com`

2. **`app/layout.tsx`**
   - Canonical URL: `https://crelyztradeinc.com`
   - Metadata base URL: `https://crelyztradeinc.com`
   - Fallback: `https://crelyztradeinc.com`

3. **`app/(public)/products/[slug]/page.tsx`**
   - Dynamic canonical URLs: `https://crelyztradeinc.com/products/{slug}`
   - OpenGraph URLs: `https://crelyztradeinc.com/products/{slug}`
   - Fallback: `https://crelyztradeinc.com`

4. **`app/api/auth/logout/route.ts`**
   - Redirect URL: Uses `NEXT_PUBLIC_SITE_URL` or `https://crelyztradeinc.com`

5. **`next.config.ts`**
   - Image remote pattern: `crelyztradeinc.com` (for loading images from reference site)

---

## 🔧 Environment Variables Required

Add these in **Vercel → Settings → Environment Variables**:

```env
NEXT_PUBLIC_SITE_URL=https://crelyztradeinc.com
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

**Important:**
- Use `https://` (not `http://`)
- No trailing slash
- Use non-www version: `crelyztradeinc.com`

---

## 🌐 Domain Setup in Vercel

### Step 1: Add Domains in Vercel

1. Go to **Vercel Dashboard** → Your Project → **Settings** → **Domains**
2. Add both domains:
   - `crelyztradeinc.com` (root domain)
   - `www.crelyztradeinc.com` (www subdomain)

### Step 2: Configure DNS Records

At your domain registrar (GoDaddy, Namecheap, Cloudflare, etc.):

**For Root Domain (`crelyztradeinc.com`):**
```
Type: A
Name: @ (or leave blank)
Value: 76.76.21.21
TTL: 3600
```

**For WWW Subdomain (`www.crelyztradeinc.com`):**
```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 3600
```

**⚠️ Note:** Vercel will show you the exact DNS records needed. Use what Vercel provides in the dashboard!

### Step 3: Wait for Verification

- DNS propagation: 5-60 minutes (can take up to 24 hours)
- Vercel will automatically verify and enable SSL/HTTPS
- Status should show: ✅ **"Valid Configuration"**

---

## 🔄 How Redirects Work

### Current Behavior:

1. **User visits:** `https://www.crelyztradeinc.com`
2. **Middleware detects:** `www.` prefix
3. **Redirects to:** `https://crelyztradeinc.com` (301 permanent redirect)
4. **User sees:** `https://crelyztradeinc.com` in browser

### SEO Benefits:

- ✅ Prevents duplicate content issues
- ✅ Consolidates link equity to one domain
- ✅ Clear canonical signals for search engines
- ✅ 301 redirect preserves SEO value

---

## ✅ Testing Checklist

After deployment, verify:

- [ ] `https://crelyztradeinc.com` loads correctly
- [ ] `https://www.crelyztradeinc.com` redirects to `https://crelyztradeinc.com`
- [ ] SSL certificate is active (🔒 green lock in browser)
- [ ] Canonical URLs in page source point to `crelyztradeinc.com`
- [ ] Product pages have correct canonical URLs
- [ ] Environment variables are set in Vercel
- [ ] All images load correctly
- [ ] Forms and API routes work

---

## 📝 Configuration Details

### Middleware Redirect Logic

```typescript
// If request is for www version
if (hostname.startsWith('www.')) {
  // Remove www. and redirect to non-www
  const nonWwwHostname = hostname.replace(/^www\./, '');
  url.hostname = nonWwwHostname;
  return NextResponse.redirect(url, 301); // 301 = Permanent Redirect
}
```

### Canonical URL Format

- **Homepage:** `https://crelyztradeinc.com`
- **Product Pages:** `https://crelyztradeinc.com/products/{slug}`
- **Other Pages:** `https://crelyztradeinc.com/{path}`

---

## 🚀 Deployment Steps

1. **Add environment variables** in Vercel
2. **Add domains** in Vercel (both www and non-www)
3. **Configure DNS records** at your domain registrar
4. **Wait for DNS propagation** (5-60 minutes)
5. **Verify domain** shows "Valid Configuration" in Vercel
6. **Test both URLs** to ensure redirects work
7. **Check canonical URLs** in page source

---

## 🆘 Troubleshooting

### Domain Not Working?

1. **Check DNS Records:**
   - Verify records are correct at your registrar
   - Use [whatsmydns.net](https://www.whatsmydns.net) to check propagation
   - Wait up to 24 hours for full propagation

2. **Check Vercel Status:**
   - Go to Vercel → Settings → Domains
   - Verify status shows "Valid Configuration"
   - Check for any error messages

3. **Check Environment Variables:**
   - Verify `NEXT_PUBLIC_SITE_URL` is set correctly
   - Ensure it's set for Production environment
   - Redeploy after adding/changing variables

4. **Test Redirects:**
   - Clear browser cache
   - Try incognito/private mode
   - Use curl: `curl -I https://www.crelyztradeinc.com`

---

## 📊 Current Configuration Summary

| Setting | Value |
|---------|-------|
| **Primary Domain** | `crelyztradeinc.com` |
| **WWW Redirect** | `www.crelyztradeinc.com` → `crelyztradeinc.com` |
| **Redirect Type** | 301 Permanent Redirect |
| **Canonical URLs** | Always non-www version |
| **SSL/HTTPS** | Auto-enabled by Vercel |
| **Environment Variable** | `NEXT_PUBLIC_SITE_URL=https://crelyztradeinc.com` |

---

**✅ Configuration Complete!** Your app is now fully configured for `crelyztradeinc.com` as the primary domain.

