import { createClient } from '@/lib/supabase/server';
import { redirect, notFound } from 'next/navigation';
import ProductForm from '@/components/Admin/ProductForm';
import { ProductInsert } from '@/types/database';

interface EditProductPageProps {
  params: Promise<{ id: string }>;
}

export default async function EditProductPage({ params }: EditProductPageProps) {
  const { id } = await params;
  const supabase = await createClient();

  const { data: product } = await supabase
    .from('products')
    .select('*')
    .eq('id', id)
    .single();

  if (!product) {
    notFound();
  }

  const { data: categories } = await supabase
    .from('categories')
    .select('*')
    .order('name', { ascending: true });

  async function handleSubmit(data: ProductInsert) {
    'use server';

    const supabase = await createClient();
    const { error } = await supabase
      .from('products')
      .update(data)
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
            onSubmit={handleSubmit}
          />
        </div>
      </div>
    </div>
  );
}

