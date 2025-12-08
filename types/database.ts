export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export interface Database {
  public: {
    Tables: {
      categories: {
        Row: {
          id: string
          name: string
          slug: string
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          created_at?: string
        }
      }
      products: {
        Row: {
          id: string
          name: string
          slug: string
          description: string | null
          short_description: string | null
          sku: string
          price: number | null
          stock_quantity: number | null
          status: 'active' | 'draft' | 'archived'
          images: string[]
          category_id: string | null
          created_at: string
          updated_at: string
        }
        Insert: {
          id?: string
          name: string
          slug: string
          description?: string | null
          short_description?: string | null
          sku: string
          price?: number | null
          stock_quantity?: number | null
          status?: 'active' | 'draft' | 'archived'
          images?: string[]
          category_id?: string | null
          created_at?: string
          updated_at?: string
        }
        Update: {
          id?: string
          name?: string
          slug?: string
          description?: string | null
          short_description?: string | null
          sku?: string
          price?: number | null
          stock_quantity?: number | null
          status?: 'active' | 'draft' | 'archived'
          images?: string[]
          category_id?: string | null
          created_at?: string
          updated_at?: string
        }
      }
      enquiries: {
        Row: {
          id: string
          name: string
          email: string
          company: string | null
          phone: string | null
          country: string | null
          product_id: string | null
          cart_items: Json | null
          message: string
          status: 'new' | 'contacted' | 'closed'
          created_at: string
        }
        Insert: {
          id?: string
          name: string
          email: string
          company?: string | null
          phone?: string | null
          country?: string | null
          product_id?: string | null
          cart_items?: Json | null
          message: string
          status?: 'new' | 'contacted' | 'closed'
          created_at?: string
        }
        Update: {
          id?: string
          name?: string
          email?: string
          company?: string | null
          phone?: string | null
          country?: string | null
          product_id?: string | null
          cart_items?: Json | null
          message?: string
          status?: 'new' | 'contacted' | 'closed'
          created_at?: string
        }
      }
    }
  }
}

export type Category = Database['public']['Tables']['categories']['Row']
export type Product = Database['public']['Tables']['products']['Row']
export type Enquiry = Database['public']['Tables']['enquiries']['Row']

export type ProductInsert = Database['public']['Tables']['products']['Insert']
export type ProductUpdate = Database['public']['Tables']['products']['Update']
export type EnquiryInsert = Database['public']['Tables']['enquiries']['Insert']

