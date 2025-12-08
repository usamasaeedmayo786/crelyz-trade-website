'use client';

import Link from 'next/link';
import { useState } from 'react';
import { Product } from '@/types/database';

interface ProductCardProps {
  product: Product;
  isOnSale?: boolean;
  originalPrice?: number;
}

export default function ProductCard({ product, isOnSale = false, originalPrice }: ProductCardProps) {
  const [quantity, setQuantity] = useState(0);
  const mainImage = product.images && product.images.length > 0 ? product.images[0] : '/placeholder-product.jpg';
  const displayOriginalPrice = originalPrice || (product as any).original_price;
  
  return (
    <div className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300">
      <Link href={`/products/${product.slug}`} className="group block">
        <div className="relative w-full overflow-hidden bg-gray-200">
          <div className="h-64 w-full bg-gray-200 flex items-center justify-center relative">
            {product.images && product.images.length > 0 ? (
              <>
                <img
                  src={product.images[0]}
                  alt={product.name}
                  className="h-full w-full object-cover group-hover:scale-105 transition-transform duration-300"
                  loading="lazy"
                  onError={(e) => {
                    // Fallback if image fails to load
                    (e.target as HTMLImageElement).src = 'https://via.placeholder.com/800x800?text=Product+Image';
                  }}
                />
                {isOnSale && (
                  <div className="absolute top-2 left-2 bg-red-600 text-white px-3 py-1 rounded-md text-sm font-bold z-10">
                    Sale
                  </div>
                )}
              </>
            ) : (
              <div className="text-gray-400 flex items-center justify-center h-full">
                <span>No Image</span>
              </div>
            )}
          </div>
        </div>
      </Link>
      <div className="p-4 bg-white rounded-b-lg">
        <Link href={`/products/${product.slug}`}>
          <h3 className="text-base font-semibold text-gray-900 mb-2 hover:text-blue-600 transition-colors line-clamp-2 min-h-[3rem]">
            {product.name}
          </h3>
        </Link>
        
        {/* Price Section */}
        <div className="mb-3">
          {isOnSale && displayOriginalPrice ? (
            <div className="flex items-center gap-2">
              <span className="text-lg font-bold text-gray-900">
                ${product.price?.toFixed(2) || '0.00'} CAD
              </span>
              <span className="text-sm text-gray-500 line-through">
                ${displayOriginalPrice.toFixed(2)} CAD
              </span>
            </div>
          ) : (
            <div>
              <span className="text-lg font-bold text-gray-900">
                ${product.price?.toFixed(2) || '0.00'} CAD
              </span>
            </div>
          )}
        </div>

        {/* Quantity Selector */}
        <div className="flex items-center justify-between border border-gray-300 rounded-md mb-3">
          <button
            onClick={(e) => {
              e.preventDefault();
              setQuantity(Math.max(0, quantity - 1));
            }}
            className="px-3 py-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 transition-colors"
            disabled={quantity === 0}
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20 12H4" />
            </svg>
          </button>
          <span className="px-4 py-2 text-gray-900 font-medium">{quantity}</span>
          <button
            onClick={(e) => {
              e.preventDefault();
              setQuantity(quantity + 1);
            }}
            className="px-3 py-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 transition-colors"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
            </svg>
          </button>
        </div>
      </div>
    </div>
  );
}

