import { notFound } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import EnquiryForm from '@/components/EnquiryForm';
import Link from 'next/link';
import ProductImage from '@/components/ProductImage';
import { Metadata } from 'next';

interface ProductDetailPageProps {
  params: Promise<{ slug: string }>;
}

export async function generateMetadata({ params }: ProductDetailPageProps): Promise<Metadata> {
  try {
    const { slug } = await params;
    const supabase = await createClient();

    const { data: product } = await (supabase as any)
      .from('products')
      .select('name, short_description, images')
      .eq('slug', slug)
      .eq('status', 'active')
      .single();

    const siteUrl = process.env.NEXT_PUBLIC_SITE_URL || 'https://crelyztradeinc.com';
    const canonicalUrl = `${siteUrl.replace(/\/$/, '')}/products/${slug}`;

    if (!product) {
      return {
        title: 'Product Not Found - Crelyz Trade Inc.',
      };
    }

    return {
      title: `${product.name} - Crelyz Trade Inc.`,
      description: product.short_description || product.name,
      alternates: {
        canonical: canonicalUrl,
      },
      openGraph: {
        title: product.name,
        description: product.short_description || product.name,
        images: product.images && product.images.length > 0 ? [product.images[0]] : [],
        url: canonicalUrl,
      },
    };
  } catch (error) {
    return {
      title: 'Product - Crelyz Trade Inc.',
    };
  }
}

export default async function ProductDetailPage({ params }: ProductDetailPageProps) {
  try {
    const { slug } = await params;
    const supabase = await createClient();

    const { data: product, error } = await (supabase as any)
      .from('products')
      .select('*, categories(*)')
      .eq('slug', slug)
      .eq('status', 'active')
      .single();

    if (error || !product) {
      console.error('Error fetching product:', error);
      notFound();
    }

    // Don't show products without images
    if (!product.images || !Array.isArray(product.images) || product.images.length === 0 || !product.images[0] || !product.images[0].trim()) {
      notFound();
    }

    const mainImage = product.images[0];
    const otherImages = product.images.slice(1);

    return (
    <div className="min-h-screen bg-gray-50">
      {/* Breadcrumb Navigation */}
      <div className="bg-white border-b border-gray-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <nav className="flex items-center space-x-2 text-sm">
            <Link href="/" className="text-gray-500 hover:text-gray-700">
              Home
            </Link>
            <span className="text-gray-400">/</span>
            <Link href="/products" className="text-gray-500 hover:text-gray-700">
              Products
            </Link>
            {product.categories && (
              <>
                <span className="text-gray-400">/</span>
                <Link 
                  href={`/products?category=${product.category_id}`}
                  className="text-gray-500 hover:text-gray-700"
                >
                  {product.categories.name}
                </Link>
              </>
            )}
            <span className="text-gray-400">/</span>
            <span className="text-gray-900 font-medium">{product.name}</span>
          </nav>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-12 p-6 lg:p-10">
            {/* Product Images Section */}
            <div className="space-y-4">
              {/* Main Image */}
              <div className="relative aspect-square w-full overflow-hidden bg-white border border-gray-200 rounded-lg group p-4">
                {mainImage ? (
                  <ProductImage
                    src={mainImage}
                    alt={product.name}
                    fill
                    className="object-contain group-hover:scale-105 transition-transform duration-300"
                    priority
                    sizes="(max-width: 768px) 100vw, 50vw"
                  />
                ) : (
                  <div className="w-full h-full flex items-center justify-center bg-gray-50 text-gray-500">
                    <span>No image available</span>
                  </div>
                )}
              </div>

              {/* Thumbnail Images */}
              {otherImages.length > 0 && (
                <div className="grid grid-cols-4 gap-3">
                  {otherImages.map((image: string, index: number) => (
                    <div 
                      key={index} 
                      className="relative aspect-square w-full overflow-hidden bg-white border border-gray-200 rounded-md cursor-pointer hover:border-blue-500 hover:ring-2 ring-blue-500 transition-all p-2"
                    >
                      <ProductImage
                        src={image}
                        alt={`${product.name} ${index + 2}`}
                        fill
                        className="object-contain"
                        sizes="(max-width: 768px) 25vw, 12.5vw"
                      />
                    </div>
                  ))}
                </div>
              )}
            </div>

            {/* Product Details Section */}
            <div className="space-y-6">
              {/* Category Badge */}
              {product.categories && (
                <div>
                  <Link
                    href={`/products?category=${product.category_id}`}
                    className="inline-block bg-blue-100 text-blue-800 text-sm font-semibold px-4 py-2 rounded-lg hover:bg-blue-200 transition-colors"
                  >
                    {product.categories.name}
                  </Link>
                </div>
              )}

              {/* Product Title */}
              <div>
                <h1 className="text-3xl lg:text-4xl font-bold text-gray-900 mb-3">
                  {product.name}
                </h1>
                {product.short_description && (
                  <p className="text-lg text-gray-600 leading-relaxed">
                    {product.short_description}
                  </p>
                )}
              </div>

              {/* Price and Stock Section */}
              <div className="border-t border-b border-gray-200 py-6 space-y-4">
                {product.price !== null && (
                  <div className="flex items-baseline space-x-3">
                    <span className="text-sm text-gray-600 font-medium">Price:</span>
                    <span className="text-4xl font-bold text-gray-900">
                      ${product.price.toFixed(2)}
                    </span>
                    <span className="text-lg text-gray-600">CAD</span>
                  </div>
                )}

                <div className="grid grid-cols-2 gap-4 pt-4">
                  <div>
                    <span className="text-sm text-gray-600 block mb-1">SKU:</span>
                    <span className="text-base font-semibold text-gray-900">{product.sku}</span>
                  </div>
                  {product.stock_quantity !== null && (
                    <div>
                      <span className="text-sm text-gray-600 block mb-1">Availability:</span>
                      <span className={`text-base font-semibold ${
                        product.stock_quantity > 0 ? 'text-green-600' : 'text-red-600'
                      }`}>
                        {product.stock_quantity > 0 
                          ? `In Stock (${product.stock_quantity} units)` 
                          : 'Out of Stock'}
                      </span>
                    </div>
                  )}
                </div>
              </div>

              {/* Key Features */}
              {product.description && (
                <div className="bg-gray-50 rounded-lg p-6">
                  <h2 className="text-xl font-bold text-gray-900 mb-4">Key Features</h2>
                  <div className="prose prose-sm max-w-none">
                    <p className="text-gray-700 leading-relaxed whitespace-pre-line">
                      {product.description}
                    </p>
                  </div>
                </div>
              )}

              {/* Call to Action */}
              <div className="pt-4">
                <div className="bg-blue-50 border border-blue-200 rounded-lg p-4">
                  <p className="text-sm text-blue-900 font-medium mb-2">
                    💼 Interested in bulk orders or wholesale pricing?
                  </p>
                  <p className="text-sm text-blue-800">
                    Submit an enquiry below to get a custom quote for your business needs.
                  </p>
                </div>
              </div>
            </div>
          </div>

          {/* Full Description Section */}
          {product.description && (
            <div className="border-t border-gray-200 px-6 lg:px-12 py-8">
              <h2 className="text-2xl font-bold text-gray-900 mb-4">Product Description</h2>
              <div className="prose prose-lg max-w-none">
                <div className="text-gray-700 leading-relaxed whitespace-pre-line">
                  {product.description}
                </div>
              </div>
            </div>
          )}

          {/* Specifications Section */}
          <div className="border-t border-gray-200 px-6 lg:px-12 py-8 bg-gray-50">
            <h2 className="text-2xl font-bold text-gray-900 mb-6">Product Specifications</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="space-y-4">
                <div className="flex justify-between py-2 border-b border-gray-200">
                  <span className="text-gray-600 font-medium">SKU:</span>
                  <span className="text-gray-900 font-semibold">{product.sku}</span>
                </div>
                {product.categories && (
                  <div className="flex justify-between py-2 border-b border-gray-200">
                    <span className="text-gray-600 font-medium">Category:</span>
                    <Link
                      href={`/products?category=${product.category_id}`}
                      className="text-blue-600 hover:text-blue-700 font-semibold"
                    >
                      {product.categories.name}
                    </Link>
                  </div>
                )}
                {product.price !== null && (
                  <div className="flex justify-between py-2 border-b border-gray-200">
                    <span className="text-gray-600 font-medium">Price:</span>
                    <span className="text-gray-900 font-semibold">${product.price.toFixed(2)} CAD</span>
                  </div>
                )}
              </div>
              <div className="space-y-4">
                {product.stock_quantity !== null && (
                  <div className="flex justify-between py-2 border-b border-gray-200">
                    <span className="text-gray-600 font-medium">Stock Quantity:</span>
                    <span className={`font-semibold ${
                      product.stock_quantity > 0 ? 'text-green-600' : 'text-red-600'
                    }`}>
                      {product.stock_quantity} units
                    </span>
                  </div>
                )}
                <div className="flex justify-between py-2 border-b border-gray-200">
                  <span className="text-gray-600 font-medium">Status:</span>
                  <span className="inline-block bg-green-100 text-green-800 text-sm font-semibold px-3 py-1 rounded">
                    {product.status.charAt(0).toUpperCase() + product.status.slice(1)}
                  </span>
                </div>
                {product.created_at && (
                  <div className="flex justify-between py-2 border-b border-gray-200">
                    <span className="text-gray-600 font-medium">Added:</span>
                    <span className="text-gray-900 font-semibold">
                      {new Date(product.created_at).toLocaleDateString('en-CA', {
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric'
                      })}
                    </span>
                  </div>
                )}
              </div>
            </div>
          </div>
        </div>

        {/* Enquiry Form Section */}
        <div className="mt-8">
          <EnquiryForm product={product} />
        </div>

        {/* Related Products Section - Can be added later */}
        {product.categories && (
          <div className="mt-12">
            <div className="text-center">
              <Link
                href={`/products?category=${product.category_id}`}
                className="inline-block bg-gray-900 text-white px-8 py-3 rounded-lg hover:bg-gray-800 transition-colors font-semibold text-lg"
              >
                View More {product.categories.name} Products
              </Link>
            </div>
          </div>
        )}
      </div>
    </div>
    );
  } catch (error) {
    console.error('Error in ProductDetailPage:', error);
    notFound();
  }
}
