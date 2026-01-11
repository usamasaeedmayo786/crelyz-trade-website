'use client';

import Link from 'next/link';
import { useState } from 'react';
import { Product } from '@/types/database';
import ProductImage from '@/components/ProductImage';

interface ProductCardProps {
  product: Product;
  isOnSale?: boolean;
  originalPrice?: number;
}

export default function ProductCard({ product, isOnSale = false, originalPrice }: ProductCardProps) {
  const [quantity, setQuantity] = useState(0);
  const mainImage = product.images && product.images.length > 0 ? product.images[0] : null;
  const displayOriginalPrice = originalPrice || (product as any).original_price;
  
  return (
    <div className="bg-white rounded-lg shadow-sm border border-gray-100 overflow-hidden hover:shadow-md hover:border-gray-300 transition-all duration-300">
      <Link href={`/products/${product.slug}`} className="group block">
        <div className="relative w-full overflow-hidden bg-white">
          <div className="h-52 w-full bg-gray-50 flex items-center justify-center relative p-4">
            {mainImage && mainImage.trim() ? (
              <>
                <ProductImage
                  src={mainImage}
                  alt={product.name}
                  fill
                  className="object-contain group-hover:scale-105 transition-transform duration-300"
                  sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 25vw"
                />
                {isOnSale && (
                  <div className="absolute bottom-2 left-2 bg-black text-white px-2.5 py-1 rounded text-xs font-semibold z-10 shadow-md">
                    Sale
                  </div>
                )}
              </>
            ) : (
              <>
                <ProductImage
                  src=""
                  alt={product.name}
                  fill
                  className="object-cover"
                  sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 25vw"
                />
                {isOnSale && (
                  <div className="absolute bottom-2 left-2 bg-black text-white px-2.5 py-1 rounded text-xs font-semibold z-10 shadow-md">
                    Sale
                  </div>
                )}
              </>
            )}
          </div>
        </div>
      </Link>
      <div className="p-4 bg-white">
        <Link href={`/products/${product.slug}`}>
          <h3 className="text-sm font-medium text-gray-900 mb-2.5 hover:text-blue-600 transition-colors line-clamp-2 min-h-[2.5rem] leading-tight">
            {product.name}
          </h3>
        </Link>
        
        {/* Price Section */}
        <div className="mb-3">
          {isOnSale && displayOriginalPrice ? (
            <div className="flex items-center gap-2 flex-wrap">
              <span className="text-base font-semibold text-gray-900">
                ${product.price?.toFixed(2) || '0.00'} CAD
              </span>
              <span className="text-xs text-gray-500 line-through">
                ${displayOriginalPrice.toFixed(2)} CAD
              </span>
            </div>
          ) : (
            <div>
              <span className="text-base font-semibold text-gray-900">
                ${product.price?.toFixed(2) || '0.00'} CAD
              </span>
            </div>
          )}
        </div>

        {/* Quantity Selector */}
        <div className="flex items-center justify-between border border-gray-200 rounded-md">
          <button
            onClick={(e) => {
              e.preventDefault();
              setQuantity(Math.max(0, quantity - 1));
            }}
            className="px-3 py-2 text-gray-600 hover:text-gray-900 hover:bg-gray-50 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            disabled={quantity === 0}
          >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20 12H4" />
            </svg>
          </button>
          <span className="px-4 py-2 text-gray-900 font-medium text-sm">{quantity}</span>
          <button
            onClick={(e) => {
              e.preventDefault();
              setQuantity(quantity + 1);
            }}
            className="px-3 py-2 text-gray-600 hover:text-gray-900 hover:bg-gray-50 transition-colors"
          >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  );
}

