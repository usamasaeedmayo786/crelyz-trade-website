# 🔧 Fix: Domain Configuration for www.crelyztradeinc.com

## Problem
Your website is not working on `www.crelyztradeinc.com` because the domain is not properly configured in Vercel.

---

## ✅ Step-by-Step Solution

### Step 1: Add Domain in Vercel Dashboard

1. **Go to Vercel Dashboard**
   - Visit [vercel.com](https://vercel.com)
   - Sign in to your account
   - Select your project

2. **Navigate to Domain Settings**
   - Click **"Settings"** tab (top navigation)
   - Click **"Domains"** in the left sidebar

3. **Add Both Domains**
   
   **Add Root Domain:**
   - Click **"Add Domain"** button
   - Enter: `crelyztradeinc.com` (without www)
   - Click **"Add"**
   
   **Add WWW Domain:**
   - Click **"Add Domain"** button again
   - Enter: `www.crelyztradeinc.com` (with www)
   - Click **"Add"**

4. **Vercel will show DNS records** - Keep this page open!

---

### Step 2: Configure DNS Records at Your Domain Registrar

You need to add DNS records where you bought your domain (GoDaddy, Namecheap, Cloudflare, etc.).

#### Go to Your Domain Registrar's DNS Settings

**For Root Domain (`crelyztradeinc.com`):**

**Option A: A Record (Most Common)**
```
Type: A
Name: @ (or leave blank, or enter "crelyztradeinc.com")
Value: 76.76.21.21
TTL: 3600 (or Auto)
```

**Option B: CNAME Record (If your registrar supports CNAME for root)**
```
Type: CNAME
Name: @ (or leave blank)
Value: cname.vercel-dns.com
TTL: 3600
```

**For WWW Subdomain (`www.crelyztradeinc.com`):**

```
Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 3600
```

**⚠️ IMPORTANT:** 
- Vercel will show you the **EXACT** DNS records needed in the dashboard
- Use the values Vercel provides (they may differ from the examples above)
- Copy them exactly as shown

---

### Step 3: Wait for DNS Propagation

1. **Save DNS records** at your domain registrar
2. **Wait 5-60 minutes** for DNS to propagate (can take up to 24 hours)
3. **Check status in Vercel:**
   - Go back to Vercel → Settings → Domains
   - You'll see status indicators:
     - ⏳ **"Pending"** = DNS is propagating (wait longer)
     - ✅ **"Valid Configuration"** = Domain is ready!
     - ❌ **"Invalid Configuration"** = Check DNS records

---

### Step 4: Verify Domain is Working

Once Vercel shows **"Valid Configuration"**:

1. **Test Root Domain:**
   ```
   https://crelyztradeinc.com
   ```
   Should load your website ✅

2. **Test WWW Domain:**
   ```
   https://www.crelyztradeinc.com
   ```
   Should load your website ✅

3. **Check SSL Certificate:**
   - Both URLs should show 🔒 (green lock) in browser
   - HTTPS should be enabled automatically

---

### Step 5: Configure Domain Redirect (Choose One Option)

You should redirect one version to the other for SEO. Choose based on your preference:

#### Option A: Redirect WWW to Root (Current Setup)
- `www.crelyztradeinc.com` → `crelyztradeinc.com`
- **This is already configured** in your `middleware.ts`
- No changes needed ✅

#### Option B: Redirect Root to WWW
If you prefer `www.crelyztradeinc.com` as primary:

1. **Update `middleware.ts`:**
   - Change the redirect logic (see below)

2. **Update Environment Variable:**
   - In Vercel → Settings → Environment Variables
   - Change `NEXT_PUBLIC_SITE_URL` to `https://www.crelyztradeinc.com`

---

### Step 6: Update Environment Variables

Make sure these are set in Vercel:

1. **Go to:** Vercel → Settings → Environment Variables

2. **Add/Verify:**
   ```
   NEXT_PUBLIC_SITE_URL=https://crelyztradeinc.com
   NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
   SUPABASE_SERVICE_ROLE_KEY=your_service_role_key
   ```

3. **Select Environments:** Production, Preview, Development (or at least Production)

4. **Click "Save"**

5. **Redeploy** your site (Vercel → Deployments → Click "Redeploy")

---

## 🔍 Troubleshooting

### Domain Shows "Invalid Configuration"

**Check:**
1. DNS records are correct (copy exactly from Vercel)
2. DNS records are saved at your registrar
3. Wait longer (DNS can take up to 24 hours)
4. Use a DNS checker tool: [whatsmydns.net](https://www.whatsmydns.net)

### Domain Shows "Pending" for Hours

**This is normal!** DNS propagation can take:
- **5-60 minutes** (most common)
- **Up to 24 hours** (rare, but possible)

**What to do:**
- Wait patiently
- Check DNS propagation: [whatsmydns.net](https://www.whatsmydns.net)
- Verify DNS records are correct

### Website Shows "404 Not Found"

**Check:**
1. Domain is verified in Vercel (shows ✅ "Valid Configuration")
2. Environment variables are set correctly
3. Build succeeded (check Vercel → Deployments)
4. You're visiting the correct URL

### SSL Certificate Not Working

**Vercel automatically provisions SSL** via Let's Encrypt. If HTTPS doesn't work:
1. Wait 5-10 minutes after domain verification
2. Clear browser cache
3. Try incognito/private mode
4. Check Vercel → Settings → Domains → SSL status

---

## 📋 Quick Checklist

- [ ] Added `crelyztradeinc.com` in Vercel → Settings → Domains
- [ ] Added `www.crelyztradeinc.com` in Vercel → Settings → Domains
- [ ] Copied DNS records from Vercel dashboard
- [ ] Added DNS records at domain registrar
- [ ] Waited for DNS propagation (5-60 minutes)
- [ ] Verified domain shows "Valid Configuration" in Vercel
- [ ] Tested `https://crelyztradeinc.com` (works ✅)
- [ ] Tested `https://www.crelyztradeinc.com` (works ✅)
- [ ] SSL certificate is active (🔒 shows in browser)
- [ ] Environment variables are set in Vercel
- [ ] Site is redeployed after adding environment variables

---

## 🆘 Still Not Working?

If after following all steps the domain still doesn't work:

1. **Check Vercel Deployment Logs:**
   - Vercel → Deployments → Click latest deployment → View logs
   - Look for errors

2. **Verify DNS Records:**
   - Use [whatsmydns.net](https://www.whatsmydns.net)
   - Enter your domain
   - Check if DNS records match what Vercel expects

3. **Contact Support:**
   - Vercel Support: [vercel.com/support](https://vercel.com/support)
   - Your Domain Registrar Support

---

**Current Configuration:** 
- Primary Domain: `crelyztradeinc.com` (non-www)
- Redirect: `www.crelyztradeinc.com` → `crelyztradeinc.com` ✅

