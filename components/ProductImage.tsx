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
  loading?: 'lazy' | 'eager';
}

// Default placeholder image - optimized low-quality placeholder
const DEFAULT_PLACEHOLDER = 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=50';

export default function ProductImage({ 
  src, 
  alt, 
  fill = false,
  className = '',
  priority = false,
  sizes,
  width,
  height,
  loading
}: ProductImageProps) {
  const [imgSrc, setImgSrc] = useState(src || DEFAULT_PLACEHOLDER);
  const [hasError, setHasError] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const [shouldLoad, setShouldLoad] = useState(priority || false);

  useEffect(() => {
    if (src) {
      setImgSrc(src);
      setHasError(false);
      setIsLoading(true);
      setShouldLoad(true);
    } else {
      setImgSrc(DEFAULT_PLACEHOLDER);
      setHasError(false);
      setShouldLoad(true);
    }
  }, [src]);

  // Lazy load images that are below the fold
  useEffect(() => {
    if (priority || shouldLoad || typeof window === 'undefined') return;

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            setShouldLoad(true);
            observer.disconnect();
          }
        });
      },
      { rootMargin: '50px' } // Start loading 50px before image enters viewport
    );

    // Use setTimeout to ensure DOM is ready
    const timer = setTimeout(() => {
      const imageId = `product-image-${src?.slice(-20)?.replace(/[^a-zA-Z0-9]/g, '') || Math.random().toString(36).slice(2)}`;
      const element = document.getElementById(imageId);
      if (element) {
        observer.observe(element);
      }
    }, 0);

    return () => {
      clearTimeout(timer);
      observer.disconnect();
    };
  }, [priority, shouldLoad, src]);

  const handleError = () => {
    if (!hasError) {
      setHasError(true);
      setImgSrc(DEFAULT_PLACEHOLDER);
      setIsLoading(false);
    }
  };

  const handleLoad = () => {
    setIsLoading(false);
  };

  // Check if image source needs to be unoptimized
  const isAmazonImage = imgSrc?.includes('m.media-amazon.com');
  const isPlaceholder = imgSrc?.includes('placeholder') || imgSrc === DEFAULT_PLACEHOLDER;
  const isExternalCDN = imgSrc?.includes('cdn') || imgSrc?.includes('storage') || imgSrc?.includes('amazonaws');
  
  // Only unoptimize if necessary - try to use Next.js optimization when possible
  const isUnoptimized = isAmazonImage || isPlaceholder || hasError || !imgSrc;

  // Generate a stable ID for the image container
  const imageId = `product-image-${src?.slice(-20)?.replace(/[^a-zA-Z0-9]/g, '') || Math.random().toString(36).slice(2)}`;

  // Don't render until it's time to load (for lazy loading)
  // Always render on server-side (SSR) to avoid hydration issues
  if (!shouldLoad && !priority && typeof window !== 'undefined') {
    return (
      <div 
        id={imageId}
        className={`relative w-full h-full bg-gray-100 ${fill ? '' : className}`}
        style={fill ? {} : { minHeight: height || 800 }}
      >
        <div className="absolute inset-0 bg-gray-100 animate-pulse flex items-center justify-center">
          <svg className="w-12 h-12 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
          </svg>
        </div>
      </div>
    );
  }

  if (fill) {
    return (
      <div 
        id={imageId}
        className="relative w-full h-full"
      >
        {isLoading && !hasError && (
          <div className="absolute inset-0 bg-gray-100 animate-pulse flex items-center justify-center z-0">
            <svg className="w-12 h-12 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg>
          </div>
        )}
        <Image
          src={imgSrc || DEFAULT_PLACEHOLDER}
          alt={alt || 'Product image'}
          fill
          className={`${className} ${isLoading ? 'opacity-0' : 'opacity-100'} transition-opacity duration-200`}
          priority={priority}
          sizes={sizes || '(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw'}
          onError={handleError}
          onLoad={handleLoad}
          unoptimized={isUnoptimized}
          loading={loading || (priority ? 'eager' : 'lazy')}
          quality={isUnoptimized ? undefined : 85}
        />
      </div>
    );
  }

  return (
    <div 
      id={imageId}
      className="relative"
    >
      {isLoading && !hasError && (
        <div className="absolute inset-0 bg-gray-100 animate-pulse flex items-center justify-center z-0">
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
        className={`${className} ${isLoading ? 'opacity-0' : 'opacity-100'} transition-opacity duration-200`}
        priority={priority}
        onError={handleError}
        onLoad={handleLoad}
        unoptimized={isUnoptimized}
        loading={loading || (priority ? 'eager' : 'lazy')}
        quality={isUnoptimized ? undefined : 85}
      />
    </div>
  );
}

