'use client';

import { useEffect, useState, useMemo } from 'react';
import { useSearchParams, useRouter } from 'next/navigation';
import ProductCard from '@/components/ProductCard';
import CatalogFilter from '@/components/CatalogFilter';
import { Product, Category } from '@/types/database';

// Category descriptions mapping
const categoryDescriptions: Record<string, string> = {
  'kitchen': 'We provide all kinds of kitchen essentials in Canada, available on demand. From cookware to modern kitchen setups, we bring everything you need for a functional and stylish kitchen.',
  'furniture': 'Discover our wide range of furniture collections in Canada. From modern living room sets to elegant dining furniture, we offer quality pieces that combine style and comfort.',
  'home-appliances': 'Find the best home appliances in Canada. We offer a comprehensive selection of household appliances to make your home more efficient and comfortable.',
  'wellness': 'Enhance your well-being with our wellness products available in Canada. Quality products for a healthier lifestyle.',
  'office': 'Complete your office setup with our office furniture and supplies in Canada. Ergonomic solutions for productive workspaces.',
  'outdoor': 'Explore our outdoor living collection in Canada. From patio furniture to outdoor accessories, create the perfect outdoor space for relaxation and entertainment.',
  'seasonal': 'Discover seasonal products for every time of year in Canada. From holiday decorations to seasonal essentials, find everything you need for special occasions.',
};

export default function ProductsPage() {
  const searchParams = useSearchParams();
  const router = useRouter();
  const [products, setProducts] = useState<Product[]>([]);
  const [categories, setCategories] = useState<Category[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedCategory, setSelectedCategory] = useState<string | null>(
    searchParams.get('category')
  );
  const [sortBy, setSortBy] = useState<string>('best_selling');
  const [availability, setAvailability] = useState<string>('');
  const [priceRange, setPriceRange] = useState<{ min: number | null; max: number | null }>({
    min: null,
    max: null,
  });

  // Watch for URL changes and update selected category
  useEffect(() => {
    const categoryParam = searchParams.get('category');
    setSelectedCategory(categoryParam);
  }, [searchParams]);

  // Update URL when category changes programmatically
  const handleCategoryChange = (categoryId: string | null) => {
    setSelectedCategory(categoryId);
    const params = new URLSearchParams(searchParams.toString());
    if (categoryId) {
      params.set('category', categoryId);
    } else {
      params.delete('category');
    }
    router.push(`/products?${params.toString()}`);
  };

  useEffect(() => {
    fetchCategories();
  }, []);

  useEffect(() => {
    fetchProducts();
  }, [selectedCategory]);

  const fetchCategories = async () => {
    try {
      const response = await fetch('/api/categories');
      if (response.ok) {
        const data = await response.json();
        setCategories(data);
      }
    } catch (error) {
      console.error('Error fetching categories:', error);
    }
  };

  const fetchProducts = async () => {
    setLoading(true);
    try {
      const params = new URLSearchParams();
      if (selectedCategory) params.append('category', selectedCategory);

      const response = await fetch(`/api/products?${params.toString()}`);
      if (response.ok) {
        const data = await response.json();
        // Show all products - ProductImage component will handle broken images with fallback
        setProducts(data || []);
      } else {
        console.error('Failed to fetch products:', response.statusText);
        setProducts([]);
      }
    } catch (error) {
      console.error('Error fetching products:', error);
      setProducts([]);
    } finally {
      setLoading(false);
    }
  };

  // Get selected category details
  const selectedCategoryData = useMemo(() => {
    if (!selectedCategory) return null;
    return categories.find(cat => cat.id === selectedCategory);
  }, [selectedCategory, categories]);

  // Filter and sort products
  const filteredAndSortedProducts = useMemo(() => {
    // Show all products - ProductImage component handles missing/broken images
    let filtered = [...products];

    // Filter by availability
    if (availability === 'in_stock') {
      filtered = filtered.filter((p) => (p.stock_quantity ?? 0) > 0);
    } else if (availability === 'out_of_stock') {
      filtered = filtered.filter((p) => (p.stock_quantity ?? 0) === 0);
    }

    // Filter by price range
    if (priceRange.min !== null) {
      filtered = filtered.filter((p) => (p.price ?? 0) >= priceRange.min!);
    }
    if (priceRange.max !== null) {
      filtered = filtered.filter((p) => (p.price ?? 0) <= priceRange.max!);
    }

    // Sort products
    switch (sortBy) {
      case 'alphabetically_az':
        filtered.sort((a, b) => a.name.localeCompare(b.name));
        break;
      case 'alphabetically_za':
        filtered.sort((a, b) => b.name.localeCompare(a.name));
        break;
      case 'price_low_high':
        filtered.sort((a, b) => (a.price ?? 0) - (b.price ?? 0));
        break;
      case 'price_high_low':
        filtered.sort((a, b) => (b.price ?? 0) - (a.price ?? 0));
        break;
      case 'date_old_new':
        filtered.sort((a, b) => new Date(a.created_at).getTime() - new Date(b.created_at).getTime());
        break;
      case 'date_new_old':
        filtered.sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime());
        break;
      case 'best_selling':
        // For now, sort by creation date (newest first) as we don't have sales data
        filtered.sort((a, b) => new Date(b.created_at).getTime() - new Date(a.created_at).getTime());
        break;
      case 'featured':
      default:
        // Keep original order (already sorted by created_at desc from API)
        break;
    }

    return filtered;
  }, [products, availability, priceRange, sortBy]);

  return (
    <div className="min-h-screen bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        {/* Category Header */}
        {selectedCategoryData ? (
          <div className="mb-8">
            <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              {selectedCategoryData.name}
            </h1>
            <p className="text-gray-600 text-lg max-w-3xl">
              {categoryDescriptions[selectedCategoryData.slug] || 
               `Explore our ${selectedCategoryData.name.toLowerCase()} collection. Quality products available on demand in Canada.`}
            </p>
          </div>
        ) : (
          <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-8">Products</h1>
        )}

        <CatalogFilter
          categories={categories}
          onCategoryChange={handleCategoryChange}
          onSortChange={setSortBy}
          onAvailabilityChange={setAvailability}
          onPriceRangeChange={(min, max) => setPriceRange({ min, max })}
          selectedCategory={selectedCategory}
          productCount={filteredAndSortedProducts.length}
          products={products}
        />

        {loading ? (
          <div className="text-center py-12">
            <p className="text-gray-500">Loading products...</p>
          </div>
        ) : filteredAndSortedProducts.length > 0 ? (
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
            {filteredAndSortedProducts.map((product, index) => (
              <ProductCard 
                key={product.id} 
                product={product}
                priority={index < 4} // Prioritize first 4 products (above the fold)
              />
            ))}
          </div>
        ) : (
          <div className="text-center py-16 bg-white rounded-lg border border-gray-200">
            <p className="text-gray-500 text-lg">No products found matching your criteria.</p>
            <p className="text-gray-400 text-sm mt-2">Try adjusting your filters or browse all products.</p>
          </div>
        )}
      </div>
    </div>
  );
}
