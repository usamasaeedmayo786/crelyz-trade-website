# Free Tier Limitations & Usage Guide

This document outlines the free tier limitations for all services used in your Crelyz Trade Inc. e-commerce website.

## Services Overview

Your project uses the following services:
1. **Next.js** - Open source (completely free)
2. **Vercel** - Hosting & deployment
3. **Supabase** - Database & authentication
4. **GitHub** - Version control

---

## 1. Vercel (Hosting & Deployment)

### Free Tier (Hobby Plan) - **FREE FOREVER**

**What you get:**
- ✅ Unlimited deployments
- ✅ Automatic HTTPS
- ✅ Custom domains (unlimited)
- ✅ Global CDN
- ✅ Preview deployments for every push
- ✅ Analytics (limited)

**Limitations:**
- **Bandwidth**: 100 GB/month
- **Build minutes**: 6,000 minutes/month
- **Serverless function execution**: 100 GB-hours/month
- **Team members**: 1 (just you)
- **Support**: Community support only

**When you'll need to upgrade:**
- If you exceed 100 GB bandwidth/month (unlikely for a B2B site unless very popular)
- If you need more than 6,000 build minutes/month (very unlikely)
- If you need team collaboration features
- If you need priority support

**Cost to upgrade:** $20/month (Pro plan)

**Estimated free usage:** Can last indefinitely for small to medium B2B sites with moderate traffic.

---

## 2. Supabase (Database & Authentication)

### Free Tier - **FREE FOREVER** (with usage limits)

**What you get:**
- ✅ PostgreSQL database (500 MB storage)
- ✅ Authentication (unlimited users)
- ✅ Row Level Security (RLS)
- ✅ API auto-generation
- ✅ Real-time subscriptions (limited)
- ✅ Storage (1 GB)
- ✅ 2 projects

**Limitations:**
- **Database size**: 500 MB
- **Database bandwidth**: 5 GB/month
- **API requests**: 50,000/month
- **Storage**: 1 GB
- **Storage bandwidth**: 2 GB/month
- **Realtime connections**: 200 concurrent connections
- **Auth users**: Unlimited (but limited by database size)
- **Backups**: Daily backups (7-day retention)

**When you'll need to upgrade:**
- If your database exceeds 500 MB
- If you exceed 50,000 API requests/month
- If you need more storage (images, files)
- If you need longer backup retention
- If you need more projects

**Cost to upgrade:** $25/month (Pro plan) - includes 8 GB database, 250 GB bandwidth, 2M API requests

**Estimated free usage:**
- **Database**: Can store ~10,000-50,000 products (depending on data size)
- **API requests**: ~1,600 requests/day (sufficient for moderate traffic)
- **Storage**: ~1,000 product images (if optimized)

---

## 3. GitHub (Version Control)

### Free Tier - **FREE FOREVER**

**What you get:**
- ✅ Unlimited public repositories
- ✅ Unlimited private repositories
- ✅ Unlimited collaborators
- ✅ 500 MB storage per repository
- ✅ 1 GB bandwidth/month per repository
- ✅ GitHub Actions: 2,000 minutes/month (free for public repos)

**Limitations:**
- **Storage**: 500 MB per repository (usually enough for code)
- **Bandwidth**: 1 GB/month per repository
- **Actions**: 2,000 minutes/month (for private repos)

**When you'll need to upgrade:**
- If you need advanced security features
- If you need more GitHub Actions minutes
- If you need enterprise features

**Cost to upgrade:** $4/month (Team plan) or $21/month (Enterprise)

**Estimated free usage:** Can last indefinitely for most projects.

---

## 4. Next.js (Framework)

### Completely Free - **NO LIMITATIONS**

- Open source
- No usage limits
- No cost
- Free forever

---

## Summary: How Long Can You Use It Free?

### ✅ **Can Use Free Indefinitely If:**

1. **Traffic stays moderate** (< 1,600 API requests/day)
2. **Database stays under 500 MB** (~10,000-50,000 products)
3. **Storage stays under 1 GB** (~1,000 optimized images)
4. **Bandwidth stays under 100 GB/month** (Vercel)
5. **You're the only team member**

### ⚠️ **You'll Need to Upgrade When:**

1. **High traffic**: > 50,000 API requests/month (Supabase)
2. **Large database**: > 500 MB (Supabase)
3. **Many images**: > 1 GB storage (Supabase)
4. **High bandwidth**: > 100 GB/month (Vercel)
5. **Team collaboration**: Need multiple team members

---

## Cost Breakdown (If You Need to Upgrade)

| Service | Free Tier | Paid Tier | Monthly Cost |
|---------|-----------|-----------|--------------|
| Vercel | Hobby (Free) | Pro | $20/month |
| Supabase | Free | Pro | $25/month |
| GitHub | Free | Team | $4/month |
| **Total** | **$0/month** | **All Paid** | **$49/month** |

---

## Recommendations

### To Stay on Free Tier Longer:

1. **Optimize images**: Compress product images to reduce storage
2. **Implement caching**: Reduce API calls with proper caching
3. **Monitor usage**: Check Supabase dashboard regularly
4. **Clean up data**: Remove old/unused products and enquiries
5. **Use CDN**: Vercel's CDN helps reduce bandwidth

### When to Upgrade:

- **Supabase Pro ($25/month)**: When you hit database or API limits
- **Vercel Pro ($20/month)**: When you need team features or exceed bandwidth
- **Both**: When your business grows and you need reliability guarantees

---

## Monitoring Your Usage

### Vercel Dashboard:
- Go to: [vercel.com/dashboard](https://vercel.com/dashboard)
- Check: Bandwidth usage, build minutes

### Supabase Dashboard:
- Go to: [supabase.com/dashboard](https://supabase.com/dashboard)
- Check: Database size, API requests, storage usage

### GitHub:
- Go to: [github.com/settings/billing](https://github.com/settings/billing)
- Check: Storage and bandwidth usage

---

## Conclusion

**You can use this website FREE for a very long time** (potentially indefinitely) if:
- Your traffic is moderate
- You manage your database size efficiently
- You optimize images and storage

**Most small to medium B2B e-commerce sites can run on the free tier for years** before needing to upgrade.

The free tiers are quite generous and designed to support growing businesses. You'll likely only need to upgrade when your business scales significantly.

