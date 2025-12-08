# Deployment Guide - Making Your Site Live

This guide will walk you through deploying your Next.js e-commerce site to production with a custom domain.

## Prerequisites Checklist

Before deploying, ensure you have:

- ✅ **GitHub Account** - Free account works fine
- ✅ **Vercel Account** - Sign up at [vercel.com](https://vercel.com) (free tier available)
- ✅ **Supabase Project** - Already set up with database migrations
- ✅ **Domain Name** - Your main domain (e.g., crelyztradeinc.com)
- ✅ **Domain DNS Access** - Access to your domain's DNS settings

---

## Step 1: Prepare Your Code for Deployment

### 1.1 Initialize Git Repository (if not already done)

```bash
# Navigate to your project directory
cd E:\CursorAi_\E_Commerce_Automation_Curosr

# Initialize git (if not already initialized)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit - Ready for deployment"
```

### 1.2 Create GitHub Repository

1. Go to [GitHub.com](https://github.com) and sign in
2. Click the **"+"** icon → **"New repository"**
3. Name your repository (e.g., `crelyz-trade-website`)
4. Choose **Public** or **Private**
5. **DO NOT** initialize with README, .gitignore, or license (you already have these)
6. Click **"Create repository"**

### 1.3 Push Code to GitHub

```bash
# Add GitHub remote (replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Push to GitHub
git branch -M main
git push -u origin main
```

---

## Step 2: Deploy to Vercel

### 2.1 Import Project to Vercel

1. Go to [vercel.com](https://vercel.com) and sign in
2. Click **"Add New..."** → **"Project"**
3. Click **"Import Git Repository"**
4. Find and select your GitHub repository
5. Click **"Import"**

### 2.2 Configure Project Settings

Vercel will auto-detect Next.js. Keep these settings:

- **Framework Preset**: Next.js (auto-detected)
- **Root Directory**: `./` (default)
- **Build Command**: `npm run build` (default)
- **Output Directory**: `.next` (default)
- **Install Command**: `npm install` (default)

### 2.3 Add Environment Variables

**IMPORTANT**: Add these environment variables in Vercel before deploying:

1. In the Vercel project setup, scroll to **"Environment Variables"**
2. Add each variable:

```
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

**Where to find Supabase credentials:**

1. Go to your [Supabase Dashboard](https://app.supabase.com)
2. Select your project
3. Go to **Settings** → **API**
4. Copy:
   - **Project URL** → `NEXT_PUBLIC_SUPABASE_URL`
   - **anon/public key** → `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - **service_role key** → `SUPABASE_SERVICE_ROLE_KEY` (keep this secret!)

### 2.4 Deploy

1. Click **"Deploy"**
2. Wait 2-3 minutes for the build to complete
3. Your site will be live at: `https://your-project-name.vercel.app`

---

## Step 3: Connect Your Custom Domain

### 3.1 Add Domain in Vercel

1. In your Vercel project dashboard, go to **"Settings"** → **"Domains"**
2. Enter your domain name (e.g., `crelyztradeinc.com`)
3. Click **"Add"**

Vercel will show you DNS records to add.

### 3.2 Configure DNS Records

You need to add DNS records in your domain registrar (GoDaddy, Namecheap, Cloudflare, etc.).

#### Option A: Root Domain (crelyztradeinc.com)

Add these DNS records:

**Type A Record:**
```
Name: @
Type: A
Value: 76.76.21.21
TTL: 3600 (or default)
```

**Type CNAME Record:**
```
Name: www
Type: CNAME
Value: cname.vercel-dns.com
TTL: 3600 (or default)
```

#### Option B: Using CNAME (Recommended)

Some registrars require CNAME for root domain:

**Type CNAME Record:**
```
Name: @
Type: CNAME
Value: cname.vercel-dns.com
TTL: 3600
```

**Type CNAME Record:**
```
Name: www
Type: CNAME
Value: cname.vercel-dns.com
TTL: 3600
```

**Note**: Vercel will show you the exact records needed. Use what Vercel provides!

### 3.3 Verify Domain

1. After adding DNS records, wait 5-60 minutes for DNS propagation
2. Vercel will automatically detect and verify your domain
3. Once verified, your site will be accessible at your custom domain

### 3.4 Enable SSL/HTTPS

Vercel automatically provisions SSL certificates via Let's Encrypt. No action needed - HTTPS will be enabled automatically once DNS is verified.

---

## Step 4: Post-Deployment Checklist

### 4.1 Test Your Live Site

- [ ] Visit your domain and verify the homepage loads
- [ ] Test product pages (`/products`)
- [ ] Test product detail pages
- [ ] Test enquiry form submission
- [ ] Test admin login (`/login`)
- [ ] Verify admin panel works (`/admin`)

### 4.2 Verify Environment Variables

- [ ] Check that Supabase connection works (products load)
- [ ] Test authentication (admin login)
- [ ] Verify API routes work

### 4.3 Update Supabase Settings (if needed)

If you have CORS restrictions:

1. Go to Supabase Dashboard → **Settings** → **API**
2. Add your domain to **Allowed CORS origins**:
   ```
   https://yourdomain.com
   https://www.yourdomain.com
   ```

### 4.4 Set Up Automatic Deployments

Vercel automatically deploys when you push to GitHub:

- **Main branch** → Production deployment
- **Other branches** → Preview deployments

To deploy updates:
```bash
git add .
git commit -m "Your update message"
git push origin main
```

---

## Step 5: Optional Optimizations

### 5.1 Set Up Custom Domain Redirects

In Vercel → Settings → Domains:
- Enable **"Redirect www to root"** or **"Redirect root to www"** (choose one)

### 5.2 Configure Analytics (Optional)

1. Vercel → Settings → Analytics
2. Enable Vercel Analytics (free tier available)

### 5.3 Set Up Monitoring (Optional)

- Enable Vercel Speed Insights
- Set up error tracking (Sentry integration available)

---

## Troubleshooting

### Site Shows "404" or "Not Found"

- **Check**: Environment variables are set correctly in Vercel
- **Check**: Build logs in Vercel dashboard for errors
- **Check**: Supabase project is active and accessible

### Domain Not Working

- **Check**: DNS records are correct (wait up to 24 hours for propagation)
- **Check**: Domain is verified in Vercel dashboard
- **Check**: SSL certificate is issued (may take a few minutes)

### Database Connection Errors

- **Check**: Supabase project URL and keys are correct
- **Check**: Supabase project is not paused (free tier pauses after inactivity)
- **Check**: RLS policies allow public access for products

### Admin Login Not Working

- **Check**: Admin user exists in Supabase Authentication
- **Check**: Email/password is correct
- **Check**: Supabase Auth is enabled in your project

### Images Not Loading

- **Check**: Image URLs in database are accessible
- **Check**: URLs use HTTPS (not HTTP)
- **Check**: CORS settings if hosting images yourself

---

## Quick Reference

### Vercel Dashboard
- **Project URL**: `https://vercel.com/dashboard`
- **Deployments**: View all deployments and logs
- **Settings**: Configure domain, environment variables, etc.

### Supabase Dashboard
- **Project URL**: `https://app.supabase.com`
- **API Settings**: Get your credentials
- **SQL Editor**: Run migrations or queries
- **Authentication**: Manage admin users

### Common Commands

```bash
# Deploy updates
git add .
git commit -m "Update message"
git push origin main

# Check deployment status
# Visit Vercel dashboard

# View build logs
# Vercel → Deployments → Click deployment → View logs
```

---

## Support Resources

- **Vercel Docs**: [vercel.com/docs](https://vercel.com/docs)
- **Next.js Docs**: [nextjs.org/docs](https://nextjs.org/docs)
- **Supabase Docs**: [supabase.com/docs](https://supabase.com/docs)

---

## Summary

Your deployment workflow:

1. ✅ Code pushed to GitHub
2. ✅ Project imported to Vercel
3. ✅ Environment variables configured
4. ✅ Domain added and DNS configured
5. ✅ Site live and accessible!

**Your site is now live at: `https://yourdomain.com`** 🎉

---

*Last updated: 2024*

