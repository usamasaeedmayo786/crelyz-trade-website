import { notFound } from 'next/navigation';
import { createClient } from '@/lib/supabase/server';
import EnquiryForm from '@/components/EnquiryForm';
import Link from 'next/link';

interface ProductDetailPageProps {
  params: { slug: string };
}

export default async function ProductDetailPage({ params }: ProductDetailPageProps) {
  const { slug } = params;
  const supabase = await createClient();

  const { data: product, error } = await (supabase as any)
    .from('products')
    .select('*, categories(*)')
    .eq('slug', slug)
    .eq('status', 'active')
    .single();

  if (error || !product) {
    notFound();
  }

  return (
    <div className="min-h-screen bg-gray-50 py-8">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <Link
          href="/products"
          className="text-blue-600 hover:text-blue-700 mb-4 inline-block"
        >
          ← Back to Products
        </Link>

        <div className="bg-white rounded-lg shadow-md overflow-hidden">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 p-8">
            {/* Product Images */}
            <div>
              {product.images && product.images.length > 0 ? (
                <div className="space-y-4">
                  <div className="aspect-w-1 aspect-h-1 w-full overflow-hidden bg-gray-200 rounded-lg">
                    <img
                      src={product.images[0]}
                      alt={product.name}
                      className="h-full w-full object-cover"
                    />
                  </div>
                  {product.images.length > 1 && (
                    <div className="grid grid-cols-4 gap-2">
                      {product.images.slice(1).map((image: string, index: number) => (
                        <div key={index} className="aspect-w-1 aspect-h-1 w-full overflow-hidden bg-gray-200 rounded">
                          <img
                            src={image}
                            alt={`${product.name} ${index + 2}`}
                            className="h-full w-full object-cover"
                          />
                        </div>
                      ))}
                    </div>
                  )}
                </div>
              ) : (
                <div className="aspect-w-1 aspect-h-1 w-full bg-gray-200 rounded-lg flex items-center justify-center">
                  <span className="text-gray-400">No Image Available</span>
                </div>
              )}
            </div>

            {/* Product Details */}
            <div>
              <h1 className="text-3xl font-bold text-gray-900 mb-4">{product.name}</h1>
              
              {product.categories && (
                <div className="mb-4">
                  <span className="inline-block bg-blue-100 text-blue-800 text-sm font-semibold px-3 py-1 rounded">
                    {product.categories.name}
                  </span>
                </div>
              )}

              {product.short_description && (
                <p className="text-lg text-gray-700 mb-4">{product.short_description}</p>
              )}

              <div className="border-t border-b border-gray-200 py-4 mb-4 space-y-2">
                <div className="flex justify-between">
                  <span className="text-gray-600">SKU:</span>
                  <span className="font-semibold">{product.sku}</span>
                </div>
                {product.price && (
                  <div className="flex justify-between">
                    <span className="text-gray-600">Price:</span>
                    <span className="text-2xl font-bold text-gray-900">${product.price.toFixed(2)} CAD</span>
                  </div>
                )}
                {product.stock_quantity !== null && (
                  <div className="flex justify-between">
                    <span className="text-gray-600">Stock:</span>
                    <span className="font-semibold">{product.stock_quantity} units</span>
                  </div>
                )}
              </div>

              {product.description && (
                <div className="mb-6">
                  <h2 className="text-xl font-semibold text-gray-900 mb-2">Description</h2>
                  <p className="text-gray-700 whitespace-pre-line">{product.description}</p>
                </div>
              )}
            </div>
          </div>
        </div>

        {/* Enquiry Form */}
        <div className="mt-8">
          <EnquiryForm product={product} />
        </div>
      </div>
    </div>
  );
}

