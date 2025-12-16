-- Migration: Increase all product prices by $100
-- This migration adds $100 to the price of all active products

UPDATE products
SET price = price + 100.00
WHERE price IS NOT NULL
  AND status = 'active';

-- Verify the update
-- SELECT id, name, price, (price - 100.00) as old_price
-- FROM products
-- WHERE status = 'active'
-- ORDER BY created_at DESC;

