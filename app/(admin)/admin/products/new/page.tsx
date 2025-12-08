import { createClient } from '@/lib/supabase/server';
import { redirect } from 'next/navigation';
import ProductForm from '@/components/Admin/ProductForm';
import { Database } from '@/types/database';

// Insert type, if you want to keep it for form typing
type ProductInsert = Database['public']['Tables']['products']['Insert'];

export default async function NewProductPage() {
  const supabase = await createClient();

  const { data: categories } = await supabase
    .from('categories')
    .select('*')
    .order('name', { ascending: true });

  async function handleSubmit(data: ProductInsert) {
    'use server';

    const supabase = await createClient();

    // 🔥 Key fix: relax Supabase typing only for this call
    const { error } = await (supabase as any)
      .from('products')
      .insert(data as any);

    if (error) {
      throw new Error(error.message);
    }

    redirect('/admin/products');
  }

  return (
    <div className="py-8">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">
          Create New Product
        </h1>
        <div className="bg-white shadow rounded-lg p-6">
          <ProductForm
            categories={categories || []}
            onSubmit={handleSubmit}
          />
        </div>
      </div>
    </div>
  );
}
