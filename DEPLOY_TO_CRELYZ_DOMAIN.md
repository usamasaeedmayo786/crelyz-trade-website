# Deploy to Crelyz Domain - Step-by-Step Guide

This guide will walk you through deploying your website to **crelyztradeinc.com** on Vercel.

## ✅ Prerequisites Check

Your project is already:
- ✅ Connected to GitHub: `https://github.com/usamasaeedmayo786/crelyz-trade-website.git`
- ✅ Code is committed and pushed
- ✅ Ready for deployment

---

## Step 1: Deploy to Vercel

### 1.1 Sign Up / Log In to Vercel

1. Go to [vercel.com](https://vercel.com)
2. Sign up or log in (you can use your GitHub account for easy integration)

### 1.2 Import Your Project

1. Click **"Add New..."** → **"Project"**
2. Click **"Import Git Repository"**
3. Find and select: **`usamasaeedmayo786/crelyz-trade-website`**
4. Click **"Import"**

### 1.3 Configure Project Settings

Vercel will auto-detect Next.js. Keep these default settings:

- **Framework Preset**: Next.js ✅
- **Root Directory**: `./` ✅
- **Build Command**: `npm run build` ✅
- **Output Directory**: `.next` ✅
- **Install Command**: `npm install` ✅

### 1.4 Add Environment Variables ⚠️ CRITICAL

**BEFORE clicking Deploy**, add these environment variables:

1. Scroll down to **"Environment Variables"** section
2. Click **"Add"** for each variable:

```
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

**Where to find Supabase credentials:**

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Select your project
3. Go to **Settings** → **API**
4. Copy:
   - **Project URL** → Use for `NEXT_PUBLIC_SUPABASE_URL`
   - **anon/public key** → Use for `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - **service_role key** → Use for `SUPABASE_SERVICE_ROLE_KEY` (keep secret!)

**Important:** Make sure to add these for **Production**, **Preview**, and **Development** environments (or at least Production).

### 1.5 Deploy

1. Click **"Deploy"** button
2. Wait 2-3 minutes for the build to complete
3. Your site will be live at: `https://crelyz-trade-website.vercel.app` (or similar)

---

## Step 2: Connect Your Crelyz Domain

### 2.1 Add Domain in Vercel

1. In your Vercel project dashboard, go to **"Settings"** → **"Domains"**
2. Enter your domain: **`crelyztradeinc.com`**
3. Click **"Add"**

Vercel will show you the DNS records you need to add.

### 2.2 Configure DNS Records

You need to add DNS records in your domain registrar (where you bought crelyztradeinc.com).

**Go to your domain registrar** (GoDaddy, Namecheap, Cloudflare, etc.) and add these DNS records:

#### For Root Domain (crelyztradeinc.com):

**Option A: A Record (Recommended)**
```
Type: A
Name: @ (or leave blank)
Value: 76.76.21.21
TTL: 3600 (or default)
```

**Option B: CNAME Record (If your registrar supports CNAME for root)**
```
Type: CNAME
Name: @ (or leave blank)
Value: cname.vercel-dns.com
TTL: 3600
```

#### For WWW Subdomain (www.crelyztradeinc.com):

```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 3600
```

**⚠️ Important:** Vercel will show you the EXACT DNS records needed. Use what Vercel displays in the dashboard, as these values may change.

### 2.3 Verify Domain

1. After adding DNS records, wait **5-60 minutes** for DNS propagation
2. Vercel will automatically detect and verify your domain
3. Once verified, you'll see a green checkmark ✅ next to your domain
4. SSL/HTTPS will be automatically enabled (no action needed)

### 2.4 Test Your Domain

Visit:
- `https://crelyztradeinc.com` ✅
- `https://www.crelyztradeinc.com` ✅

Both should work!

---

## Step 3: Configure Domain Redirects (Optional)

In Vercel → Settings → Domains:

- Choose one:
  - **Redirect www to root** (www.crelyztradeinc.com → crelyztradeinc.com)
  - **Redirect root to www** (crelyztradeinc.com → www.crelyztradeinc.com)

This ensures all traffic goes to one version of your site (better for SEO).

---

## Step 4: Update Supabase CORS Settings

To ensure your Supabase connection works with your custom domain:

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. Select your project
3. Go to **Settings** → **API**
4. Scroll to **"Allowed CORS origins"**
5. Add:
   ```
   https://crelyztradeinc.com
   https://www.crelyztradeinc.com
   ```
6. Click **Save**

---

## Step 5: Test Your Live Site

After deployment, test these:

- [ ] Homepage loads at `https://crelyztradeinc.com`
- [ ] Products page (`/products`) works
- [ ] Product detail pages work
- [ ] Enquiry form submission works
- [ ] Admin login (`/login`) works
- [ ] Admin panel (`/admin`) works
- [ ] Images load correctly
- [ ] HTTPS/SSL is enabled (green lock in browser)

---

## Step 6: Set Up Automatic Deployments

Vercel automatically deploys when you push to GitHub:

- **Main branch** → Production deployment (your live site)
- **Other branches** → Preview deployments (for testing)

To deploy updates in the future:

```bash
git add .
git commit -m "Your update message"
git push origin main
```

Vercel will automatically rebuild and deploy your site!

---

## Troubleshooting

### Domain Not Working

- **Check DNS records**: Make sure they match what Vercel shows
- **Wait longer**: DNS can take up to 24 hours to propagate globally
- **Check domain status**: In Vercel → Settings → Domains, see if domain shows as "Valid Configuration"

### Site Shows 404 or Errors

- **Check environment variables**: Make sure all Supabase variables are set correctly
- **Check build logs**: In Vercel → Deployments → Click deployment → View logs
- **Check Supabase**: Make sure your Supabase project is active (not paused)

### Database Connection Errors

- **Check Supabase URL and keys**: Verify they're correct in Vercel environment variables
- **Check CORS settings**: Make sure your domain is added to Supabase CORS origins
- **Check Supabase project**: Make sure it's not paused (free tier pauses after inactivity)

### SSL Certificate Issues

- **Wait**: SSL certificates are automatically provisioned and can take a few minutes
- **Check domain verification**: Domain must be verified before SSL is issued

---

## Quick Reference

### Vercel Dashboard
- **URL**: [vercel.com/dashboard](https://vercel.com/dashboard)
- **Your Project**: Find `crelyz-trade-website` in your projects list

### Domain Settings
- **Path**: Vercel → Your Project → Settings → Domains
- **Add Domain**: Enter `crelyztradeinc.com`
- **View DNS Records**: Click on your domain to see required DNS records

### Environment Variables
- **Path**: Vercel → Your Project → Settings → Environment Variables
- **Required Variables**:
  - `NEXT_PUBLIC_SUPABASE_URL`
  - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
  - `SUPABASE_SERVICE_ROLE_KEY`

### Supabase Dashboard
- **URL**: [app.supabase.com](https://app.supabase.com)
- **API Settings**: Settings → API (to get credentials)
- **CORS Settings**: Settings → API → Allowed CORS origins

---

## Summary Checklist

- [ ] Code pushed to GitHub ✅ (Already done)
- [ ] Project imported to Vercel
- [ ] Environment variables added in Vercel
- [ ] Initial deployment successful
- [ ] Domain added in Vercel
- [ ] DNS records configured at domain registrar
- [ ] Domain verified in Vercel
- [ ] Supabase CORS updated with domain
- [ ] Site tested and working
- [ ] SSL/HTTPS enabled automatically

---

## 🎉 You're Done!

Once all steps are complete, your website will be live at:

**https://crelyztradeinc.com**

---

## Need Help?

- **Vercel Docs**: [vercel.com/docs](https://vercel.com/docs)
- **Vercel Domain Docs**: [vercel.com/docs/concepts/projects/domains](https://vercel.com/docs/concepts/projects/domains)
- **Next.js Docs**: [nextjs.org/docs](https://nextjs.org/docs)
- **Supabase Docs**: [supabase.com/docs](https://supabase.com/docs)

---

*Last updated: 2024*

