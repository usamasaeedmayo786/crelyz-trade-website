import { createClient } from '@/lib/supabase/server';
import { redirect } from 'next/navigation';
import ProductForm from '@/components/Admin/ProductForm';
import { ProductInsert } from '@/types/database';

export default async function NewProductPage() {
  const supabase = await createClient();

  const { data: categories } = await supabase
    .from('categories')
    .select('*')
    .order('name', { ascending: true });

  async function handleSubmit(data: ProductInsert) {
    'use server';

    const supabase = await createClient();
    const { error } = await supabase
      .from('products')
      .insert(data);

    if (error) {
      throw new Error(error.message);
    }

    redirect('/admin/products');
  }

  return (
    <div className="py-8">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Create New Product</h1>
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

