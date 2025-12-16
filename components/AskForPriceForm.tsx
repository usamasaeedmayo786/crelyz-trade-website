'use client';

import { useState } from 'react';

export default function AskForPriceForm() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    phone: '',
    comment: '',
  });
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [submitStatus, setSubmitStatus] = useState<'idle' | 'success' | 'error'>('idle');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setIsSubmitting(true);
    setSubmitStatus('idle');

    try {
      const response = await fetch('/api/enquiries', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name: formData.name,
          email: formData.email,
          phone: formData.phone || null,
          message: formData.comment || 'Request for better price',
          product_id: null,
        }),
      });

      if (!response.ok) {
        throw new Error('Failed to submit request');
      }

      setSubmitStatus('success');
      setFormData({
        name: '',
        email: '',
        phone: '',
        comment: '',
      });
    } catch (error) {
      setSubmitStatus('error');
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="bg-gray-800 rounded-lg p-8 max-w-2xl mx-auto border-2 border-gray-700">
      <h2 className="text-3xl font-bold text-white mb-6 text-center">Ask For Better Price</h2>
      <form onSubmit={handleSubmit} className="space-y-6">
        {/* First Row: Name and Email side by side */}
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <input
              type="text"
              id="name"
              required
              value={formData.name}
              onChange={(e) => setFormData({ ...formData, name: e.target.value })}
              className="w-full px-4 py-3 bg-gray-900 border-2 border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-white focus:border-white transition-all text-base"
              placeholder="Name"
            />
          </div>
          <div>
            <input
              type="email"
              id="email"
              required
              value={formData.email}
              onChange={(e) => setFormData({ ...formData, email: e.target.value })}
              className="w-full px-4 py-3 bg-gray-900 border-2 border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-white focus:border-white transition-all text-base"
              placeholder="Email *"
            />
          </div>
        </div>

        {/* Second Row: Phone number */}
        <div>
          <input
            type="tel"
            id="phone"
            value={formData.phone}
            onChange={(e) => setFormData({ ...formData, phone: e.target.value })}
            className="w-full px-4 py-3 bg-gray-900 border-2 border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-white focus:border-white transition-all text-base"
            placeholder="Phone number"
          />
        </div>

        {/* Third Row: Comment textarea */}
        <div>
          <textarea
            id="comment"
            rows={4}
            value={formData.comment}
            onChange={(e) => setFormData({ ...formData, comment: e.target.value })}
            className="w-full px-4 py-3 bg-gray-900 border-2 border-gray-600 rounded-md text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-white focus:border-white resize-none transition-all text-base"
            placeholder="Comment"
          />
        </div>

        {submitStatus === 'success' && (
          <div className="bg-green-900 border-2 border-green-700 text-green-100 px-4 py-3 rounded-md font-medium">
            ✓ Thank you! We'll get back to you with a better price soon.
          </div>
        )}

        {submitStatus === 'error' && (
          <div className="bg-red-900 border-2 border-red-700 text-red-100 px-4 py-3 rounded-md font-medium">
            ✗ There was an error submitting your request. Please try again.
          </div>
        )}

        {/* Send Button */}
        <button
          type="submit"
          disabled={isSubmitting}
          className="w-full bg-white text-gray-900 py-3 px-6 rounded-md hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800 disabled:opacity-50 disabled:cursor-not-allowed font-semibold text-lg transition-all shadow-lg hover:shadow-xl"
        >
          {isSubmitting ? 'Sending...' : 'Send'}
        </button>
      </form>
    </div>
  );
}
