# 🔧 Vercel Environment Variables - Quick Reference

## Required Environment Variables

Add these in **Vercel Dashboard → Settings → Environment Variables**:

### 1. Site URL (Required)
```
Key: NEXT_PUBLIC_SITE_URL
Value: https://crelyztradeinc.com
Environment: Production, Preview, Development
```

### 2. Supabase URL (Required)
```
Key: NEXT_PUBLIC_SUPABASE_URL
Value: https://your-project-id.supabase.co
Environment: Production, Preview, Development
```
**Where to find:** Supabase Dashboard → Settings → API → Project URL

### 3. Supabase Anon Key (Required)
```
Key: NEXT_PUBLIC_SUPABASE_ANON_KEY
Value: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9... (long string)
Environment: Production, Preview, Development
```
**Where to find:** Supabase Dashboard → Settings → API → anon/public key

### 4. Supabase Service Role Key (Optional but Recommended)
```
Key: SUPABASE_SERVICE_ROLE_KEY
Value: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9... (long string)
Environment: Production, Preview, Development
```
**Where to find:** Supabase Dashboard → Settings → API → service_role key  
**⚠️ Security:** Keep this secret! It bypasses Row Level Security.

---

## 📋 Step-by-Step: Adding in Vercel

1. **Go to Vercel Dashboard**
   - Visit [vercel.com](https://vercel.com)
   - Sign in and select your project

2. **Navigate to Environment Variables**
   - Click **"Settings"** tab
   - Click **"Environment Variables"** in left sidebar

3. **Add Each Variable**
   - Click **"+ Add More"** for each variable
   - Enter the **Key** (exactly as shown above)
   - Enter the **Value** (your actual values)
   - Select **Environments**: Production, Preview, Development (or at least Production)
   - Click **"Save"**

4. **Redeploy**
   - After adding all variables, go to **"Deployments"**
   - Click **"Redeploy"** on the latest deployment
   - Or push a new commit to trigger automatic deployment

---

## ✅ Verification Checklist

After adding environment variables:

- [ ] `NEXT_PUBLIC_SITE_URL` = `https://crelyztradeinc.com`
- [ ] `NEXT_PUBLIC_SUPABASE_URL` = Your Supabase project URL
- [ ] `NEXT_PUBLIC_SUPABASE_ANON_KEY` = Your Supabase anon key
- [ ] `SUPABASE_SERVICE_ROLE_KEY` = Your Supabase service role key (optional)
- [ ] All variables are set for **Production** environment
- [ ] Site has been **redeployed** after adding variables

---

## 🎯 Quick Copy-Paste Template

When adding in Vercel, use these exact keys:

```
NEXT_PUBLIC_SITE_URL
NEXT_PUBLIC_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY
```

---

**Current Configuration:** All set for `crelyztradeinc.com` ✅

