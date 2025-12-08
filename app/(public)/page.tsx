import Link from 'next/link';
import { createClient } from '@/lib/supabase/server';
import ProductCard from '@/components/ProductCard';
import AskForPriceForm from '@/components/AskForPriceForm';
import { Product, Category } from '@/types/database';

// Blog posts data (static for now)
const blogPosts = [
  {
    id: 1,
    title: 'Home Kitchen in Canada: Style, Function, and Modern Living',
    excerpt: 'The kitchen has always been called the "heart of the home," and in Canada, this couldn\'t be more true. Whether it\'s preparing a quick weekday dinner, hosting a holiday gathering...',
    image: 'https://images.unsplash.com/photo-1556911220-bff31c812dba?w=800',
    date: 'August 22, 2025',
  },
  {
    id: 2,
    title: 'Tools in Canada: Quality, Durability, and Smart Choices for Every Project',
    excerpt: 'Canada is a country that thrives on both innovation and practicality. Whether it\'s home renovation, professional construction, or simple DIY projects, tools are an essential part of daily life...',
    image: 'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=800',
    date: 'August 22, 2025',
  },
  {
    id: 3,
    title: 'Furniture in Canada: Style, Comfort, and Trends for Modern Homes',
    excerpt: 'When it comes to furnishing a home, Canadians have a unique sense of style that blends practicality with comfort. Whether you live in a cozy Toronto condo, a suburban...',
    image: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800',
    date: 'August 22, 2025',
  },
];

export default async function HomePage() {
  const supabase = await createClient();
  
  // Fetch proven bestsellers (3 products)
  const { data: bestsellers } = await supabase
    .from('products')
    .select('*')
    .eq('status', 'active')
    .order('created_at', { ascending: false })
    .limit(3);

  // Fetch new arrivals (4 most recent products)
  const { data: newArrivals } = await supabase
    .from('products')
    .select('*')
    .eq('status', 'active')
    .order('created_at', { ascending: false })
    .limit(4);

  // Fetch specific categories for "Shop our top categories" section
  const { data: topCategories } = await supabase
    .from('categories')
    .select('*')
    .in('slug', ['kitchen', 'office', 'furniture', 'home-appliances', 'tools'])
    .order('name', { ascending: true });

  // Type assertions to help TypeScript
  const bestsellersArray: Product[] = bestsellers || [];
  const newArrivalsArray: Product[] = newArrivals || [];
  const topCategoriesArray: Category[] = topCategories || [];

  const categoryDescriptions: Record<string, string> = {
    'kitchen': 'We provide all kinds of kitchen essentials in Canada, available on demand. From cookware to appliances, find everything you need for your culinary space.',
    'office': 'We deal in all kinds of office furniture in Canada, available on demand. Create productive workspaces with our quality office solutions.',
    'furniture': 'We offer a wide range of furniture in Canada, available on demand. Transform your living spaces with our curated selection of quality pieces.',
    'home-appliances': 'We offer all kinds of home appliances in Canada, available on demand. Modern appliances to make your home life easier and more efficient.',
    'tools': 'We provide all kinds of tools in Canada, available on demand. From hand tools to power tools, find everything for your projects.',
  };

  return (
    <div className="min-h-screen">
      {/* Hero Section with Two Images */}
      <section className="relative w-full">
        <div className="grid grid-cols-1 md:grid-cols-2 h-[600px] md:h-[700px]">
          {/* Left Image - Packaging/Shipping (person with tape dispenser) */}
          <div className="relative h-full w-full overflow-hidden">
            <img
              src="https://images.unsplash.com/photo-1605745341112-85968b19335b?w=1200&q=80"
              alt="Packaging and shipping"
              className="w-full h-full object-cover"
            />
            <div className="absolute inset-0 bg-black opacity-10"></div>
          </div>
          
          {/* Right Image - Warehouse with Overlay Text */}
          <div className="relative h-full w-full overflow-hidden">
            <img
              src="https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=1200&q=80"
              alt="Warehouse storage with shelves and products"
              className="w-full h-full object-cover"
            />
            <div className="absolute inset-0 bg-gradient-to-b from-black/40 via-black/30 to-black/50"></div>
            <div className="absolute inset-0 flex items-center justify-center md:justify-start md:items-end md:p-8 lg:p-12">
              <h2 className="text-3xl md:text-4xl lg:text-5xl xl:text-6xl font-extrabold text-white drop-shadow-[0_4px_8px_rgba(0,0,0,0.8)] px-4 md:px-0 text-center md:text-left leading-tight uppercase tracking-tight">
                DESIGN YOUR HOUSE WITH WHOLESALE RATES
              </h2>
            </div>
          </div>
        </div>
        
        {/* Bottom Banner */}
        <div className="bg-gray-700 text-white py-4">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="flex flex-wrap justify-center items-center gap-4 md:gap-8 text-sm md:text-base">
              <span>Outstanding service</span>
              <span className="hidden md:inline">|</span>
              <span>Exclusive pricing</span>
              <span className="hidden md:inline">|</span>
              <span>Industry expertise</span>
            </div>
          </div>
        </div>
      </section>

      {/* Proven Bestsellers Section - Right after hero */}
      <section className="py-12 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-8">Proven bestsellers</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 mb-8">
            {bestsellersArray.length > 0 ? (
              bestsellersArray.map((product) => (
                <ProductCard key={product.id} product={product} />
              ))
            ) : (
              <>
                {/* Demo Products - Will be replaced when real products are added */}
                {(() => {
                  const demo1: Product = {
                    id: 'demo-1',
                    name: '4 Pieces Rustic Dining Table Set',
                    slug: '4-pieces-rustic-dining-table-set',
                    description: null,
                    short_description: 'Beautiful rustic dining set perfect for your home',
                    sku: 'CRZ-FUR-RTABLE-4PC',
                    price: 149.99,
                    stock_quantity: 25,
                    status: 'active',
                    images: ['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop&q=80'],
                    category_id: null,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString(),
                  };
                  const demo2: Product = {
                    id: 'demo-2',
                    name: '19 Piece Silicone Kitchenware Utensil Set',
                    slug: '19-piece-silicone-kitchenware-utensil-set',
                    description: null,
                    short_description: 'Heat resistant non-stick cooking tool set with wooden handles',
                    sku: 'CRZ-KIT-SILICON-19',
                    price: 105.00,
                    stock_quantity: 80,
                    status: 'active',
                    images: ['https://images.unsplash.com/photo-1556910103-2c02749b6c16?w=800&h=800&fit=crop&q=80'],
                    category_id: null,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString(),
                  };
                  const demo3: Product = {
                    id: 'demo-3',
                    name: 'Techwood Indoor Grill Smokeless Grill',
                    slug: 'techwood-indoor-grill-smokeless-grill',
                    description: null,
                    short_description: '1500W Indoor Korean BBQ Electric Tabletop Grill with Tempered Glass Lid',
                    sku: 'CRZ-APP-GRILL-1500',
                    price: 160.00,
                    stock_quantity: 40,
                    status: 'active',
                    images: ['https://images.unsplash.com/photo-1556911220-bff31c812dba?w=800&h=800&fit=crop&q=80'],
                    category_id: null,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString(),
                  };
                  return (
                    <>
                      <ProductCard product={demo1} />
                      <ProductCard product={demo2} isOnSale={true} originalPrice={115.00} />
                      <ProductCard product={demo3} isOnSale={true} originalPrice={180.00} />
                    </>
                  );
                })()}
              </>
            )}
          </div>
          <div className="text-center">
            <Link
              href="/products"
              className="inline-block border border-gray-300 bg-gray-100 text-gray-900 px-8 py-3 rounded-md hover:bg-gray-200 transition-colors font-medium"
            >
              View all
            </Link>
          </div>
        </div>
      </section>

      {/* Shop Top Categories Section */}
      <section className="py-16 bg-gray-800">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-white mb-8">Shop our top categories</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
            {topCategoriesArray.length > 0 ? (
              topCategoriesArray.map((category) => {
                // Category images matching the Shopify design
                const categoryImages: Record<string, string> = {
                  'kitchen': 'https://images.unsplash.com/photo-1556911220-bff31c812dba?w=800',
                  'office': 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=800',
                  'furniture': 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800',
                  'home-appliances': 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
                  'tools': 'https://images.unsplash.com/photo-1504148455328-c376907d081c?w=800',
                };
                
                return (
                  <Link
                    key={category.id}
                    href={`/products?category=${category.id}`}
                    className="bg-white rounded-lg overflow-hidden hover:shadow-xl transition-shadow group"
                  >
                    <div className="aspect-w-16 aspect-h-9 w-full h-48 bg-gray-200 overflow-hidden">
                      <img
                        src={categoryImages[category.slug] || 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800'}
                        alt={category.name}
                        className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                      />
                    </div>
                    <div className="p-4 bg-white">
                      <h3 className="text-lg font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">
                        {category.name} →
                      </h3>
                    </div>
                  </Link>
                );
              })
            ) : (
              // Demo categories if none exist
              <>
                <Link href="/products?category=demo" className="bg-white rounded-lg overflow-hidden hover:shadow-xl transition-shadow group">
                  <div className="aspect-w-16 aspect-h-9 w-full h-48 bg-gray-200 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1556911220-bff31c812dba?w=800" alt="Kitchen" className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
                  </div>
                  <div className="p-4 bg-white">
                    <h3 className="text-lg font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">Kitchen →</h3>
                  </div>
                </Link>
                <Link href="/products?category=demo" className="bg-white rounded-lg overflow-hidden hover:shadow-xl transition-shadow group">
                  <div className="aspect-w-16 aspect-h-9 w-full h-48 bg-gray-200 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1497366216548-37526070297c?w=800" alt="Office Furniture" className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
                  </div>
                  <div className="p-4 bg-white">
                    <h3 className="text-lg font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">Office Furniture →</h3>
                  </div>
                </Link>
                <Link href="/products?category=demo" className="bg-white rounded-lg overflow-hidden hover:shadow-xl transition-shadow group">
                  <div className="aspect-w-16 aspect-h-9 w-full h-48 bg-gray-200 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800" alt="Furniture" className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
                  </div>
                  <div className="p-4 bg-white">
                    <h3 className="text-lg font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">Furniture →</h3>
                  </div>
                </Link>
                <Link href="/products?category=demo" className="bg-white rounded-lg overflow-hidden hover:shadow-xl transition-shadow group">
                  <div className="aspect-w-16 aspect-h-9 w-full h-48 bg-gray-200 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800" alt="Home Appliance" className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
                  </div>
                  <div className="p-4 bg-white">
                    <h3 className="text-lg font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">Home Appliance →</h3>
                  </div>
                </Link>
                <Link href="/products?category=demo" className="bg-white rounded-lg overflow-hidden hover:shadow-xl transition-shadow group">
                  <div className="aspect-w-16 aspect-h-9 w-full h-48 bg-gray-200 overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1504148455328-c376907d081c?w=800" alt="Tools" className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
                  </div>
                  <div className="p-4 bg-white">
                    <h3 className="text-lg font-semibold text-gray-900 group-hover:text-blue-600 transition-colors">Tools →</h3>
                  </div>
                </Link>
              </>
            )}
          </div>
        </div>
      </section>

      {/* New Arrivals Section */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-8 text-center">New Arrivals</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {newArrivalsArray.length > 0 ? (
              newArrivalsArray.map((product) => (
                <ProductCard key={product.id} product={product} />
              ))
            ) : (
              <>
                {/* Demo New Arrivals - Will be replaced when real products are added */}
                {(() => {
                  const newDemo1: Product = {
                    id: 'new-demo-1',
                    name: '7-PC Patio Wicker Sectional Dining Set - Gray',
                    slug: '7pc-patio-wicker-sectional-dining-set-gray',
                    description: null,
                    short_description: 'Spacious outdoor wicker dining set with sectional seating',
                    sku: 'CRZ-FUR-PATIO-7PC',
                    price: 777.77,
                    stock_quantity: 10,
                    status: 'active',
                    images: ['https://images.unsplash.com/photo-1538688525198-9b88f6f53126?w=800&h=800&fit=crop&q=80'],
                    category_id: null,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString(),
                  };
                  const newDemo2: Product = {
                    id: 'new-demo-2',
                    name: '3-Seater Corduroy Sofa - Beige',
                    slug: '3-seater-corduroy-sofa-beige',
                    description: null,
                    short_description: 'Comfortable three-seater sofa in soft beige corduroy fabric',
                    sku: 'CRZ-FUR-SOFA-3CORD',
                    price: 399.00,
                    stock_quantity: 15,
                    status: 'active',
                    images: ['https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800&h=800&fit=crop&q=80'],
                    category_id: null,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString(),
                  };
                  const newDemo3: Product = {
                    id: 'new-demo-3',
                    name: 'Grey Fabric Reversible Sofabed Sectional',
                    slug: 'grey-fabric-reversible-sofabed-sectional',
                    description: null,
                    short_description: 'Large lift up storage sectional sofabed in grey fabric',
                    sku: 'CRZ-FUR-SOFABED-GREY',
                    price: 999.99,
                    stock_quantity: 8,
                    status: 'active',
                    images: ['https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800&h=800&fit=crop&q=80'],
                    category_id: null,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString(),
                  };
                  const newDemo4: Product = {
                    id: 'new-demo-4',
                    name: 'Set of 2 Nightstand with Drawer',
                    slug: 'set-of-2-nightstand-with-drawer',
                    description: null,
                    short_description: 'Pair of nightstands with drawers for bedroom',
                    sku: 'CRZ-FUR-NIGHTSTAND-2',
                    price: 99.99,
                    stock_quantity: 30,
                    status: 'active',
                    images: ['https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=800&fit=crop&q=80'],
                    category_id: null,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString(),
                  };
                  return (
                    <>
                      <ProductCard product={newDemo1} />
                      <ProductCard product={newDemo2} />
                      <ProductCard product={newDemo3} />
                      <ProductCard product={newDemo4} />
                    </>
                  );
                })()}
              </>
            )}
          </div>
        </div>
      </section>

      {/* Ask For Better Price Section */}
      <section className="py-16 bg-gray-50">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <AskForPriceForm />
        </div>
      </section>

      {/* Blog Teaser Section */}
      <section className="py-16 bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold text-gray-900 mb-8 text-center">From our blog</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {blogPosts.map((post) => (
              <article key={post.id} className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow">
                <div className="aspect-w-16 aspect-h-9 w-full h-48 bg-gray-200 overflow-hidden">
                  <img
                    src={post.image}
                    alt={post.title}
                    className="w-full h-full object-cover"
                  />
                </div>
                <div className="p-6">
                  <p className="text-sm text-gray-500 mb-2">{post.date}</p>
                  <h3 className="text-xl font-semibold text-gray-900 mb-3">{post.title}</h3>
                  <p className="text-gray-600 text-sm line-clamp-3">{post.excerpt}</p>
                </div>
              </article>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
