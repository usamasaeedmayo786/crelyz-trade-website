'use client';

import { useState } from 'react';
import { Category } from '@/types/database';

interface CatalogFilterProps {
  categories: Category[];
  onCategoryChange: (categoryId: string | null) => void;
  onSortChange: (sortBy: string) => void;
  onAvailabilityChange: (availability: string) => void;
  onPriceRangeChange: (min: number | null, max: number | null) => void;
  selectedCategory: string | null;
  productCount: number;
}

export default function CatalogFilter({
  categories,
  onCategoryChange,
  onSortChange,
  onAvailabilityChange,
  onPriceRangeChange,
  selectedCategory,
  productCount,
}: CatalogFilterProps) {
  const [showFilters, setShowFilters] = useState(false);
  const [availability, setAvailability] = useState<string>('');
  const [priceMin, setPriceMin] = useState<string>('');
  const [priceMax, setPriceMax] = useState<string>('');
  const [sortBy, setSortBy] = useState<string>('featured');

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
  };

  const handleReset = () => {
    setAvailability('');
    setPriceMin('');
    setPriceMax('');
    onAvailabilityChange('');
    onPriceRangeChange(null, null);
  };

  return (
    <div className="mb-6">
      {/* Desktop Filter and Sort Bar */}
      <div className="hidden md:flex items-center justify-between bg-white border-b border-gray-200 py-4">
        <div className="flex items-center gap-4">
          <span className="text-sm font-medium text-gray-700">Filter:</span>
          
          {/* Availability Dropdown */}
          <div className="relative">
            <select
              value={availability}
              onChange={(e) => handleAvailabilityChange(e.target.value)}
              className="appearance-none bg-white border border-gray-300 rounded px-4 py-2 pr-8 text-sm text-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 cursor-pointer"
            >
              <option value="">Availability</option>
              <option value="in_stock">In stock</option>
              <option value="out_of_stock">Out of stock</option>
            </select>
            <div className="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none">
              <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </div>
          </div>

          {/* Price Dropdown */}
          <div className="relative">
            <select
              className="appearance-none bg-white border border-gray-300 rounded px-4 py-2 pr-8 text-sm text-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 cursor-pointer"
              onClick={() => setShowFilters(!showFilters)}
            >
              <option>Price</option>
            </select>
            <div className="absolute inset-y-0 right-0 flex items-center pr-2 pointer-events-none">
              <svg className="w-4 h-4 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </div>
          </div>

          {(availability || priceMin || priceMax) && (
            <button
              onClick={handleReset}
              className="text-sm text-gray-600 hover:text-gray-900"
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
              className="appearance-none bg-white border border-gray-300 rounded px-4 py-2 pr-8 text-sm text-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500 cursor-pointer"
            >
              <option value="featured">Featured</option>
              <option value="best_selling">Best selling</option>
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
            onClick={() => setShowFilters(!showFilters)}
            className="text-sm font-medium text-gray-700"
          >
            Filter and sort
          </button>
          <span className="text-sm text-gray-600">{productCount} products</span>
        </div>
        {showFilters && (
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
              <div className="flex gap-2">
                <input
                  type="number"
                  placeholder="From"
                  value={priceMin}
                  onChange={(e) => setPriceMin(e.target.value)}
                  className="flex-1 border border-gray-300 rounded px-4 py-2 text-sm"
                />
                <input
                  type="number"
                  placeholder="To"
                  value={priceMax}
                  onChange={(e) => setPriceMax(e.target.value)}
                  className="flex-1 border border-gray-300 rounded px-4 py-2 text-sm"
                />
                <button
                  onClick={handlePriceApply}
                  className="px-4 py-2 bg-gray-900 text-white rounded text-sm"
                >
                  Apply
                </button>
              </div>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Sort by</label>
              <select
                value={sortBy}
                onChange={(e) => handleSortChange(e.target.value)}
                className="w-full border border-gray-300 rounded px-4 py-2 text-sm"
              >
                <option value="featured">Featured</option>
                <option value="best_selling">Best selling</option>
                <option value="alphabetically_az">Alphabetically, A-Z</option>
                <option value="alphabetically_za">Alphabetically, Z-A</option>
                <option value="price_low_high">Price, low to high</option>
                <option value="price_high_low">Price, high to low</option>
                <option value="date_old_new">Date, old to new</option>
                <option value="date_new_old">Date, new to old</option>
              </select>
            </div>
            {(availability || priceMin || priceMax) && (
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

