export default function AboutPage() {
  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="bg-white rounded-lg shadow-md p-8">
          <h1 className="text-4xl font-bold text-gray-900 mb-6">About Crelyz Trade Inc.</h1>
          
          <div className="prose prose-lg max-w-none">
            <p className="text-gray-700 mb-4">
              Crelyz Trade Inc. is a leading B2B ecommerce and product sourcing company dedicated to 
              connecting businesses with high-quality products and reliable suppliers.
            </p>
            
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">Our Mission</h2>
            <p className="text-gray-700 mb-4">
              We strive to simplify the B2B procurement process by providing a comprehensive product 
              catalog and streamlined enquiry system that helps businesses find exactly what they need.
            </p>
            
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">What We Do</h2>
            <ul className="list-disc list-inside text-gray-700 space-y-2 mb-4">
              <li>Product sourcing and procurement services</li>
              <li>B2B ecommerce solutions</li>
              <li>Supply chain management</li>
              <li>Custom product inquiries and RFQ processing</li>
            </ul>
            
            <h2 className="text-2xl font-semibold text-gray-900 mt-8 mb-4">Why Choose Us</h2>
            <p className="text-gray-700">
              With years of experience in the industry, Crelyz Trade Inc. has built a reputation for 
              reliability, quality, and exceptional customer service. We understand the unique needs 
              of B2B transactions and work closely with our clients to ensure their requirements are met.
            </p>
          </div>
        </div>
      </div>
    </div>
  );
}

