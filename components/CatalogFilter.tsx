'use client';

import { useState, useEffect, useRef } from 'react';
import { Category } from '@/types/database';

interface CatalogFilterProps {
  categories: Category[];
  onCategoryChange: (categoryId: string | null) => void;
  onSortChange: (sortBy: string) => void;
  onAvailabilityChange: (availability: string) => void;
  onPriceRangeChange: (min: number | null, max: number | null) => void;
  selectedCategory: string | null;
  productCount: number;
  products: any[]; // Products array to calculate max price
}

export default function CatalogFilter({
  categories,
  onCategoryChange,
  onSortChange,
  onAvailabilityChange,
  onPriceRangeChange,
  selectedCategory,
  productCount,
  products,
}: CatalogFilterProps) {
  const [showPriceFilter, setShowPriceFilter] = useState(false);
  const [availability, setAvailability] = useState<string>('');
  const [priceMin, setPriceMin] = useState<string>('');
  const [priceMax, setPriceMax] = useState<string>('');
  const [sortBy, setSortBy] = useState<string>('best_selling');
  const priceFilterRef = useRef<HTMLDivElement>(null);

  // Calculate max price from products
  const maxPrice = products.length > 0 
    ? Math.max(...products.map(p => p.price || 0))
    : 0;

  // Close price filter when clicking outside
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (priceFilterRef.current && !priceFilterRef.current.contains(event.target as Node)) {
        setShowPriceFilter(false);
      }
    };

    if (showPriceFilter) {
      document.addEventListener('mousedown', handleClickOutside);
    }

    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, [showPriceFilter]);

  const handleSortChange = (value: string) => {
    setSortBy(value);
    onSortChange(value);
  };

  const handleAvailabilityChange = (value: string) => {
    setAvailability(value);
    onAvailabilityChange(value);
  };

  const handlePriceApply = () => {
    const min = priceMin ? parseFloat(priceMin) : null;
    const max = priceMax ? parseFloat(priceMax) : null;
    onPriceRangeChange(min, max);
    setShowPriceFilter(false);
  };

  const handlePriceReset = () => {
    setPriceMin('');
    setPriceMax('');
    onPriceRangeChange(null, null);
    setShowPriceFilter(false);
  };

  const handleReset = () => {
    setAvailability('');
    setPriceMin('');
    setPriceMax('');
    onAvailabilityChange('');
    onPriceRangeChange(null, null);
  };

  const hasActiveFilters = availability || priceMin || priceMax;

  return (
    <div className="mb-6">
      {/* Desktop Filter and Sort Bar */}
      <div className="hidden md:flex items-center justify-between bg-white border-b border-gray-200 py-4 relative">
        <div className="flex items-center gap-4">
          <span className="text-sm font-medium text-gray-700">Filter:</span>
          
          {/* Availability Dropdown */}
          <div className="relative">
            <select
              value={availability}
              onChange={(e) => handleAvailabilityChange(e.target.value)}
              className="appearance-none bg-white border border-gray-300 rounded px-4 py-2 pr-8 text-sm text-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 cursor-pointer min-w-[140px]"
            >
              <option value="">Availability</option>
              <option value="in_stock">In stock</option>
              <option value="out_of_stock">Out of stock</option>
            </select>
            {availability && (
              <div className="absolute inset-y-0 left-2 flex items-center pointer-events-none">
                <svg className="w-4 h-4 text-gray-700" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                </svg>
              </div>
            )}
            <div className="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none">
              <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </div>
          </div>

          {/* Price Dropdown */}
          <div className="relative" ref={priceFilterRef}>
            <button
              onClick={() => setShowPriceFilter(!showPriceFilter)}
              className="appearance-none bg-white border border-gray-300 rounded px-4 py-2 pr-8 text-sm text-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 cursor-pointer min-w-[100px] text-left flex items-center justify-between"
            >
              <span>Price</span>
              <svg className="w-4 h-4 text-gray-500 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            
            {/* Price Filter Popup */}
            {showPriceFilter && (
              <div className="absolute top-full left-0 mt-2 bg-white border border-gray-300 rounded-lg shadow-lg p-4 z-50 min-w-[320px]">
                <div className="mb-3 flex items-center justify-between">
                  <p className="text-sm text-gray-700">
                    The highest price is ${maxPrice.toFixed(2)}
                  </p>
                  <button
                    onClick={handlePriceReset}
                    className="text-sm text-gray-600 hover:text-gray-900 underline"
                  >
                    Reset
                  </button>
                </div>
                <div className="flex gap-2">
                  <div className="flex-1">
                    <div className="relative">
                      <span className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-700 font-medium">$</span>
                      <input
                        type="number"
                        placeholder="From"
                        value={priceMin}
                        onChange={(e) => setPriceMin(e.target.value)}
                        className="w-full pl-7 pr-3 py-2.5 bg-white border-2 border-gray-300 rounded text-sm text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all"
                        min="0"
                        step="0.01"
                      />
                    </div>
                  </div>
                  <div className="flex-1">
                    <div className="relative">
                      <span className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-700 font-medium">$</span>
                      <input
                        type="number"
                        placeholder="To"
                        value={priceMax}
                        onChange={(e) => setPriceMax(e.target.value)}
                        className="w-full pl-7 pr-3 py-2.5 bg-white border-2 border-gray-300 rounded text-sm text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all"
                        min="0"
                        step="0.01"
                      />
                    </div>
                  </div>
                </div>
                <button
                  onClick={handlePriceApply}
                  className="mt-3 w-full bg-gray-900 text-white py-2 px-4 rounded text-sm font-medium hover:bg-gray-800 transition-colors"
                >
                  Apply
                </button>
              </div>
            )}
          </div>

          {hasActiveFilters && (
            <button
              onClick={handleReset}
              className="text-sm text-gray-600 hover:text-gray-900 underline"
            >
              Reset
            </button>
          )}
        </div>

        <div className="flex items-center gap-4">
          <span className="text-sm font-medium text-gray-700">Sort by:</span>
          <div className="relative">
            <select
              value={sortBy}
              onChange={(e) => handleSortChange(e.target.value)}
              className="appearance-none bg-white border border-gray-300 rounded px-4 py-2 pr-8 text-sm text-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 cursor-pointer min-w-[160px]"
            >
              <option value="best_selling">Best selling</option>
              <option value="featured">Featured</option>
              <option value="alphabetically_az">Alphabetically, A-Z</option>
              <option value="alphabetically_za">Alphabetically, Z-A</option>
              <option value="price_low_high">Price, low to high</option>
              <option value="price_high_low">Price, high to low</option>
              <option value="date_old_new">Date, old to new</option>
              <option value="date_new_old">Date, new to old</option>
            </select>
            <div className="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none">
              <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </div>
          </div>
          <span className="text-sm text-gray-600">{productCount} products</span>
        </div>
      </div>

      {/* Mobile Filter and Sort */}
      <div className="md:hidden bg-white border-b border-gray-200 py-4">
        <div className="flex items-center justify-between mb-4">
          <button
            onClick={() => setShowPriceFilter(!showPriceFilter)}
            className="text-sm font-medium text-gray-700"
          >
            Filter and sort
          </button>
          <span className="text-sm text-gray-600">{productCount} products</span>
        </div>
        {showPriceFilter && (
          <div className="space-y-4 pt-4 border-t border-gray-200">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Availability</label>
              <select
                value={availability}
                onChange={(e) => handleAvailabilityChange(e.target.value)}
                className="w-full border border-gray-300 rounded px-4 py-2 text-sm"
              >
                <option value="">All</option>
                <option value="in_stock">In stock</option>
                <option value="out_of_stock">Out of stock</option>
              </select>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Price</label>
              <div className="mb-2 text-sm text-gray-600">
                The highest price is ${maxPrice.toFixed(2)}
              </div>
              <div className="flex gap-2">
                <div className="flex-1 relative">
                  <span className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-700 font-medium">$</span>
                  <input
                    type="number"
                    placeholder="From"
                    value={priceMin}
                    onChange={(e) => setPriceMin(e.target.value)}
                    className="w-full pl-7 pr-3 py-2.5 bg-white border-2 border-gray-300 rounded text-sm text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all"
                    min="0"
                    step="0.01"
                  />
                </div>
                <div className="flex-1 relative">
                  <span className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-700 font-medium">$</span>
                  <input
                    type="number"
                    placeholder="To"
                    value={priceMax}
                    onChange={(e) => setPriceMax(e.target.value)}
                    className="w-full pl-7 pr-3 py-2.5 bg-white border-2 border-gray-300 rounded text-sm text-gray-900 placeholder-gray-500 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all"
                    min="0"
                    step="0.01"
                  />
                </div>
              </div>
              <button
                onClick={handlePriceApply}
                className="mt-2 w-full bg-gray-900 text-white py-2 px-4 rounded text-sm font-medium"
              >
                Apply
              </button>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Sort by</label>
              <select
                value={sortBy}
                onChange={(e) => handleSortChange(e.target.value)}
                className="w-full border border-gray-300 rounded px-4 py-2 text-sm"
              >
                <option value="best_selling">Best selling</option>
                <option value="featured">Featured</option>
                <option value="alphabetically_az">Alphabetically, A-Z</option>
                <option value="alphabetically_za">Alphabetically, Z-A</option>
                <option value="price_low_high">Price, low to high</option>
                <option value="price_high_low">Price, high to low</option>
                <option value="date_old_new">Date, old to new</option>
                <option value="date_new_old">Date, new to old</option>
              </select>
            </div>
            {hasActiveFilters && (
              <button
                onClick={handleReset}
                className="w-full text-sm text-gray-600 hover:text-gray-900 py-2"
              >
                Remove all
              </button>
            )}
          </div>
        )}
      </div>
    </div>
  );
}
