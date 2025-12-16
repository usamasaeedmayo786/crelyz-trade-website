import type { Metadata } from "next";
import "./globals.css";
import Link from "next/link";
import Image from "next/image";
import { createClient } from '@/lib/supabase/server';
import CategoriesDropdown from '@/components/CategoriesDropdown';

export const metadata: Metadata = {
  title: "Crelyz Trade Inc. - Your Best Trade Partner Globally",
  description: "Welcome to Crelyz. Your Best Trade Partner Globally. Outstanding service, exclusive pricing, and industry expertise.",
};

export default async function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  const supabase = await createClient();
  const { data: categories } = await supabase
    .from('categories')
    .select('*')
    .order('name', { ascending: true });

  return (
    <html lang="en">
      <body>
        {/* Top Banner */}
        <div className="bg-gray-800 text-white py-2">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <p className="text-sm">Welcome to Crelyz. Your Best Trade Partner Globally</p>
          </div>
        </div>
        
        {/* Main Navigation */}
        <nav className="bg-gray-800 text-white sticky top-0 z-40">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="flex justify-between items-center h-16">
              <div className="flex items-center">
                <Link href="/" className="flex items-center px-2 py-2 text-xl font-bold text-white">
                  Crelyz Trade Inc.
                </Link>
                <div className="hidden sm:ml-6 sm:flex sm:space-x-8">
                  {categories && categories.length > 0 && (
                    <CategoriesDropdown categories={categories} />
                  )}
                  <Link href="/products" className="text-gray-300 hover:text-white inline-flex items-center px-1 pt-1 border-b-2 border-transparent hover:border-white text-sm font-medium">
                    Catalog
                  </Link>
                  <Link href="/contact" className="text-gray-300 hover:text-white inline-flex items-center px-1 pt-1 border-b-2 border-transparent hover:border-white text-sm font-medium">
                    Contact
                  </Link>
                </div>
              </div>
              <div className="flex items-center space-x-4">
                <Link href="/products" className="text-gray-300 hover:text-white p-2">
                  <svg className="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </Link>
                <Link href="/login" className="text-gray-300 hover:text-white p-2">
                  <svg className="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                  </svg>
                </Link>
                <Link href="/contact" className="text-gray-300 hover:text-white p-2">
                  <svg className="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
                  </svg>
                </Link>
              </div>
            </div>
          </div>
        </nav>
        <main>{children}</main>
        <footer className="bg-gray-900 text-white border-t border-gray-800 mt-16">
          <div className="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
            {/* Quick Links Section */}
            <div className="text-center mb-8">
              <h3 className="font-semibold text-white mb-6">Quick links</h3>
              <div className="flex justify-center items-center space-x-6 flex-wrap gap-4">
                <Link href="/products" className="text-white hover:text-gray-300 transition-colors">
                  Search
                </Link>
                <Link href="/privacy" className="text-white hover:text-gray-300 transition-colors">
                  Privacy Policy
                </Link>
                <Link href="/about" className="text-white hover:text-gray-300 transition-colors">
                  About Us
                </Link>
              </div>
            </div>

            {/* PayPal Logo */}
            <div className="flex justify-center mb-8">
              <div className="bg-white rounded-lg p-3 inline-block">
                <Image 
                  src="https://www.paypalobjects.com/webstatic/mktg/logo/pp_cc_mark_111x69.jpg" 
                  alt="PayPal" 
                  width={111}
                  height={69}
                  className="h-8 w-auto"
                />
              </div>
            </div>

            {/* Copyright */}
            <div className="text-left text-sm text-white border-t border-gray-800 pt-6">
              <p>&copy; {new Date().getFullYear()}, Crelyz Trade Inc. Powered by Shopify <Link href="/privacy" className="hover:text-gray-300 underline">Privacy policy</Link></p>
            </div>
          </div>
        </footer>
      </body>
    </html>
  );
}

