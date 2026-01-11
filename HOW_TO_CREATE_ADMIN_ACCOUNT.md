# 🔐 How to Create Admin Credentials

Your website doesn't come with default admin credentials. You need to create an admin user account through Supabase Dashboard first.

---

## 🚀 Quick Steps

1. **Go to Supabase Dashboard**
2. **Create a new user**
3. **Use that email/password to login**

---

## 📋 Step-by-Step Instructions

### Step 1: Access Supabase Dashboard

1. Go to [Supabase Dashboard](https://app.supabase.com)
2. **Sign in** with your Supabase account
3. **Select your project** (the one you're using for this website)

---

### Step 2: Create Admin User

1. In the left sidebar, click **"Authentication"**
2. Click **"Users"** (under Authentication)
3. Click the **"Add user"** button (top right) or **"Invite user"** button

### Step 3: Fill in User Details

You have two options:

#### Option A: Create User Directly (Recommended)

1. Click **"Create new user"** tab
2. Enter:
   - **Email**: Your admin email address (e.g., `admin@crelyztradeinc.com` or your personal email)
   - **Password**: Create a strong password
   - **Auto Confirm User**: ✅ **Enable this checkbox** (important!)
   - **Send invite email**: You can leave this unchecked if creating directly
3. Click **"Create user"**

#### Option B: Invite User (Sends Email)

1. Click **"Invite user"** tab
2. Enter:
   - **Email**: Your admin email address
3. Click **"Send invite"**
4. Check your email and click the invitation link
5. Set your password

---

### Step 4: Verify User Was Created

1. You should see the new user in the Users list
2. Check that:
   - ✅ Email is confirmed (green checkmark)
   - ✅ User is active
   - ✅ User ID is visible

---

### Step 5: Login to Admin Panel

1. Go to your website login page:
   - **Production**: `https://crelyztradeinc.com/login`
   - **Local**: `http://localhost:3000/login`

2. Enter your credentials:
   - **Email**: The email you created in Supabase
   - **Password**: The password you set

3. Click **"Sign in"**

4. You'll be redirected to `/admin` (Admin Dashboard) ✅

---

## 🔑 Important Notes

### No Default Credentials
- ❌ There are **no default admin credentials**
- ✅ You **must create** your own admin account
- ✅ **Any user** created in Supabase Authentication can access the admin panel

### Auto Confirm User
- **Important**: Enable **"Auto Confirm User"** when creating the user
- This allows you to login immediately without email confirmation
- If you don't enable this, you'll need to confirm your email first

### Password Requirements
Supabase requires:
- Minimum 6 characters (but use at least 8 for security)
- Mix of letters and numbers (recommended)
- Special characters (recommended for better security)

### Example Credentials (Don't Use These - Create Your Own!)

You might create something like:
- **Email**: `admin@crelyztradeinc.com`
- **Password**: `YourStrongPassword123!`

**But remember**: Create your own unique credentials!

---

## 👥 Adding Multiple Admin Users

You can create multiple admin accounts:

1. Repeat Steps 2-3 for each user
2. Each user will have full admin access
3. Use different emails for different admins

---

## 🔄 Reset Password (If You Forget)

### If You Forgot Your Password:

1. **Go to Supabase Dashboard**
2. **Authentication** → **Users**
3. **Find your user** in the list
4. **Click the three dots** (⋯) next to the user
5. **Select "Reset password"**
6. A password reset link will be sent to the user's email

### Or Use Supabase Auth UI (If Configured):

1. Go to your login page
2. Look for **"Forgot password?"** link (if available)
3. Enter your email
4. Check email for reset link

---

## 🛡️ Security Best Practices

1. **Use Strong Passwords**
   - At least 12 characters
   - Mix of uppercase, lowercase, numbers, and symbols
   - Don't use common words or personal information

2. **Use a Dedicated Admin Email**
   - Use a professional email (e.g., `admin@yourdomain.com`)
   - Don't use personal emails for admin accounts

3. **Limit Admin Users**
   - Only create admin accounts for people who need access
   - Remove admin access when no longer needed

4. **Enable Two-Factor Authentication** (if available)
   - Check Supabase settings for 2FA options

---

## 🔍 Verify Admin Access

After creating your account, verify you can:

1. ✅ Login at `/login`
2. ✅ Access `/admin` dashboard
3. ✅ See Products list
4. ✅ Edit products
5. ✅ View enquiries
6. ✅ Access all admin features

---

## 🆘 Troubleshooting

### Can't Login?

1. **Check Email**
   - Make sure you're using the exact email from Supabase
   - Check for typos (case-sensitive)

2. **Check Password**
   - Make sure password is correct
   - Try resetting password in Supabase

3. **Check User Status**
   - Go to Supabase → Authentication → Users
   - Verify user is **Confirmed** (green checkmark)
   - Verify user is **Active**

4. **Check Auto Confirm**
   - If user is not confirmed, confirm manually:
     - Click on user in Supabase
     - Find "Confirm email" option
     - Or enable "Auto Confirm User" and recreate

5. **Clear Browser Cache**
   - Clear cookies and cache
   - Try incognito/private mode

### "User not found" Error?

- User wasn't created successfully
- Go back to Supabase and create the user again
- Make sure "Auto Confirm User" is checked

### "Invalid login credentials" Error?

- Email or password is incorrect
- Double-check both in Supabase Dashboard
- Try resetting password

### Redirected Back to Login?

- Session might have expired
- Clear browser cookies
- Login again
- Check Supabase project is active (not paused)

---

## 📞 Still Having Issues?

1. **Check Supabase Project Status**
   - Make sure your project is active
   - Free tier projects pause after inactivity

2. **Check Environment Variables**
   - Verify `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` are correct
   - Check Vercel environment variables (for production)

3. **Check Browser Console**
   - Press F12 to open developer tools
   - Look for error messages in Console tab

4. **Check Supabase Logs**
   - Go to Supabase Dashboard → Logs
   - Check Authentication logs for errors

---

## ✅ Quick Checklist

- [ ] Created user in Supabase Dashboard
- [ ] Enabled "Auto Confirm User"
- [ ] User shows as "Confirmed" in Supabase
- [ ] Tried logging in at `/login`
- [ ] Successfully accessed `/admin` dashboard
- [ ] Can see products and admin features

---

## 📝 Summary

**There are no default admin credentials!**

You need to:
1. Go to Supabase Dashboard → Authentication → Users
2. Click "Add user"
3. Enter email and password
4. Enable "Auto Confirm User"
5. Click "Create user"
6. Use those credentials to login at `/login`

That's it! 🎉

