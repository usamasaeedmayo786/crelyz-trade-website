'use client';

import Image from 'next/image';
import { useState, useEffect } from 'react';

interface ProductImageProps {
  src: string;
  alt: string;
  fill?: boolean;
  className?: string;
  priority?: boolean;
  sizes?: string;
  width?: number;
  height?: number;
}

// Default placeholder image - a simple product placeholder from Unsplash
const DEFAULT_PLACEHOLDER = 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80';

export default function ProductImage({ 
  src, 
  alt, 
  fill = false,
  className = '',
  priority = false,
  sizes,
  width,
  height
}: ProductImageProps) {
  const [imgSrc, setImgSrc] = useState(src || DEFAULT_PLACEHOLDER);
  const [hasError, setHasError] = useState(false);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    if (src) {
      setImgSrc(src);
      setHasError(false);
      setIsLoading(true);
    } else {
      setImgSrc(DEFAULT_PLACEHOLDER);
      setHasError(false);
    }
  }, [src]);

  const handleError = () => {
    if (!hasError) {
      setHasError(true);
      setImgSrc(DEFAULT_PLACEHOLDER);
    }
    setIsLoading(false);
  };

  const handleLoad = () => {
    setIsLoading(false);
  };

  // Check if image is from Amazon or needs unoptimized
  const isAmazonImage = imgSrc?.includes('m.media-amazon.com');
  const isPlaceholder = imgSrc?.includes('placeholder') || imgSrc === DEFAULT_PLACEHOLDER;
  const isUnoptimized = imgSrc?.includes('unsplash.com') || isPlaceholder || isAmazonImage || hasError;

  if (fill) {
    return (
      <div className="relative w-full h-full">
        {isLoading && !hasError && (
          <div className="absolute inset-0 bg-gray-100 animate-pulse flex items-center justify-center">
            <svg className="w-12 h-12 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg>
          </div>
        )}
        <Image
          src={imgSrc || DEFAULT_PLACEHOLDER}
          alt={alt || 'Product image'}
          fill
          className={`${className} ${isLoading ? 'opacity-0' : 'opacity-100'} transition-opacity duration-300`}
          priority={priority}
          sizes={sizes}
          onError={handleError}
          onLoad={handleLoad}
          unoptimized={isUnoptimized}
        />
      </div>
    );
  }

  return (
    <div className="relative">
      {isLoading && !hasError && (
        <div className="absolute inset-0 bg-gray-100 animate-pulse flex items-center justify-center">
          <svg className="w-12 h-12 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
          </svg>
        </div>
      )}
      <Image
        src={imgSrc || DEFAULT_PLACEHOLDER}
        alt={alt || 'Product image'}
        width={width || 800}
        height={height || 800}
        className={`${className} ${isLoading ? 'opacity-0' : 'opacity-100'} transition-opacity duration-300`}
        priority={priority}
        onError={handleError}
        onLoad={handleLoad}
        unoptimized={isUnoptimized}
      />
    </div>
  );
}

