# Crelyz Trade Inc. - B2B Ecommerce Website

A production-ready B2B product catalog website with enquiry/RFQ functionality and admin panel, cloned from [crelyztradeinc.com](https://crelyztradeinc.com/).

## Tech Stack

- **Next.js 16** (App Router)
- **TypeScript**
- **Tailwind CSS**
- **Supabase** (PostgreSQL + Auth)
- **Vercel** (deployment)

## Features

### Public Website
- Product catalog with search and category filtering
- Product detail pages with slug-based URLs
- Enquiry/RFQ submission form
- "Ask For Better Price" form
- About and Contact pages
- Responsive design matching crelyztradeinc.com

### Admin Panel
- Secure authentication via Supabase Auth
- Product management (CRUD operations)
- Enquiry management with status tracking
- Dashboard with statistics

## Getting Started

### Prerequisites

- Node.js 18+ installed
- A Supabase account and project

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd E_Commerce_Automation_Curosr
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
   - Copy `.env.local.example` to `.env.local` (or use the existing `.env.local`)
   - Fill in your Supabase credentials:
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

4. Set up the database:
   - In your Supabase project, go to SQL Editor
   - Run the migration files in order:
     1. `supabase/migrations/001_initial_schema.sql` - Creates tables and RLS policies
     2. `supabase/migrations/002_seed_data.sql` - Seeds categories and products from crelyztradeinc.com
   - This will create all necessary tables, indexes, RLS policies, and populate initial data

5. Create an admin user:
   - In Supabase Dashboard, go to Authentication > Users
   - Create a new user with email/password
   - This user will be able to access the admin panel

6. Run the development server:
```bash
npm run dev
```

7. Open [http://localhost:3000](http://localhost:3000) in your browser

## Project Structure

```
├── app/
│   ├── (public)/              # Public routes
│   │   ├── page.tsx          # Homepage (matching crelyztradeinc.com)
│   │   ├── products/         # Product pages
│   │   ├── about/           # About page
│   │   └── contact/         # Contact page
│   ├── (admin)/              # Admin routes (protected)
│   │   └── admin/           # Admin panel pages
│   ├── login/               # Admin login
│   └── api/                 # API routes
├── components/              # React components
│   ├── Admin/              # Admin components
│   ├── ProductCard.tsx
│   ├── ProductFilter.tsx
│   ├── EnquiryForm.tsx
│   └── AskForPriceForm.tsx
├── lib/                    # Utility functions
│   ├── supabase/          # Supabase clients
│   └── utils.ts
├── types/                  # TypeScript types
│   └── database.ts
└── supabase/
    └── migrations/         # Database migrations
        ├── 001_initial_schema.sql
        └── 002_seed_data.sql
```

## Database Schema

### Tables

- **categories**: Product categories (Furniture, Kitchen, Tools, etc.)
- **products**: Product catalog with extended fields (slug, price, status, etc.)
- **enquiries**: Customer enquiries with support for single and multi-product RFQs

### Seeded Data

The `002_seed_data.sql` migration includes:
- 7 categories from crelyztradeinc.com
- 9 products from crelyztradeinc.com including:
  - 4 Pieces Rustic Dining Table Set
  - 19 Piece Silicone Kitchenware Utensil Set
  - Techwood Indoor Grill
  - 7-PC Patio Wicker Sectional Dining Set
  - And more...

### Key Features

- Row Level Security (RLS) enabled
- Public can view active products and submit enquiries
- Only authenticated admins can manage products and view enquiries
- Slug-based URLs for SEO-friendly product pages

## Deployment

### Vercel

1. Push your code to GitHub
2. Import the project in Vercel
3. Add environment variables in Vercel dashboard
4. Deploy

The site will be automatically deployed on every push to the main branch.

## Admin Access

1. Navigate to `/login`
2. Sign in with the admin user credentials created in Supabase
3. Access the admin panel at `/admin`

## Development

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run start` - Start production server
- `npm run lint` - Run ESLint

## Notes

- Product images in the seed data use placeholder URLs from Unsplash. Replace these with actual product images.
- Prices are in CAD (Canadian Dollars) to match the original site.
- The design closely matches the original crelyztradeinc.com site structure and layout.

## License

Copyright © 2024 Crelyz Trade Inc. All rights reserved.
