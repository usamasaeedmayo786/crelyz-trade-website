import { createClient } from '@/lib/supabase/server';
import { redirect, notFound } from 'next/navigation';
import ProductForm from '@/components/Admin/ProductForm';
import { Database } from '@/types/database';

// Create a clean update type
type ProductUpdate = Database['public']['Tables']['products']['Update'];

interface EditProductPageProps {
  params: { id: string };
}

export default async function EditProductPage({ params }: EditProductPageProps) {
  const { id } = params;
  const supabase = await createClient();

  const { data: product } = await (supabase as any)
    .from('products')
    .select('*')
    .eq('id', id)
    .single();

  if (!product) {
    notFound();
  }

  const { data: categories } = await (supabase as any)
    .from('categories')
    .select('*')
    .order('name', { ascending: true });

  async function handleSubmit(data: ProductUpdate) {
    'use server';
    const supabase = await createClient();

    const { error } = await (supabase as any)
      .from('products')
      .update(data as any)
      .eq('id', id);

    if (error) {
      throw new Error(error.message);
    }

    redirect('/admin/products');
  }

  return (
    <div className="py-8">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-8">Edit Product</h1>
        <div className="bg-white shadow rounded-lg p-6">
          <ProductForm
            product={product}
            categories={categories || []}
            onSubmit={handleSubmit as any}
          />
        </div>
      </div>
    </div>
  );
}
