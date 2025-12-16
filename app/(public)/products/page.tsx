'use client';

import { useEffect, useState, useMemo } from 'react';
import { useSearchParams } from 'next/navigation';
import ProductCard from '@/components/ProductCard';
import CatalogFilter from '@/components/CatalogFilter';
import { Product, Category } from '@/types/database';

// Category descriptions mapping
const categoryDescriptions: Record<string, string> = {
  'kitchen': 'We provide all kinds of kitchen essentials in Canada, available on demand. From cookware to modern kitchen setups, we bring everything you need for a functional and stylish kitchen.',
  'furniture': 'Discover our wide range of furniture collections in Canada. From modern living room sets to elegant dining furniture, we offer quality pieces that combine style and comfort.',
  'home-appliances': 'Find the best home appliances in Canada. We offer a comprehensive selection of household appliances to make your home more efficient and comfortable.',
  'tools': 'Professional and DIY tools available in Canada. From power tools to hand tools, we provide everything you need for your projects.',
  'fitness': 'Transform your fitness journey with our range of fitness equipment in Canada. From home gym essentials to professional-grade equipment.',
  'wellness': 'Enhance your well-being with our wellness products available in Canada. Quality products for a healthier lifestyle.',
  'office': 'Complete your office setup with our office furniture and supplies in Canada. Ergonomic solutions for productive workspaces.',
};

export default function ProductsPage() {
  const searchParams = useSearchParams();
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
        // Ensure we only set products with valid images
        const validProducts = (data || []).filter((p: Product) => 
          p.images && 
          Array.isArray(p.images) && 
          p.images.length > 0 && 
          p.images[0] && 
          p.images[0].trim() !== ''
        );
        setProducts(validProducts);
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
    // First, filter out products without images
    let filtered = products.filter((p) => 
      p.images && 
      Array.isArray(p.images) && 
      p.images.length > 0 && 
      p.images[0] && 
      p.images[0].trim() !== ''
    );

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
    <div className="min-h-screen bg-white">
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
          onCategoryChange={setSelectedCategory}
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
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
            {filteredAndSortedProducts.map((product) => (
              <ProductCard key={product.id} product={product} />
            ))}
          </div>
        ) : (
          <div className="text-center py-12 bg-white">
            <p className="text-gray-500">No products found matching your criteria.</p>
          </div>
        )}
      </div>
    </div>
  );
}
