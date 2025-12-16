'use client';

import Image from 'next/image';
import { useState } from 'react';

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
  const [imgSrc, setImgSrc] = useState(src);
  const [hasError, setHasError] = useState(false);

  const handleError = () => {
    if (!hasError) {
      setHasError(true);
      setImgSrc('https://via.placeholder.com/800x800?text=Product+Image');
    }
  };

  if (fill) {
    return (
      <Image
        src={imgSrc}
        alt={alt}
        fill
        className={className}
        priority={priority}
        sizes={sizes}
        onError={handleError}
        unoptimized={imgSrc.includes('unsplash.com') || imgSrc.includes('placeholder')}
      />
    );
  }

  return (
    <Image
      src={imgSrc}
      alt={alt}
      width={width || 800}
      height={height || 800}
      className={className}
      priority={priority}
      onError={handleError}
      unoptimized={imgSrc.includes('unsplash.com') || imgSrc.includes('placeholder')}
    />
  );
}

