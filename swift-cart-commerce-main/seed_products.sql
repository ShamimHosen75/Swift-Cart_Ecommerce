-- =============================================
-- SAMPLE PRODUCTS - Run this after the main migration
-- =============================================

-- Get category IDs for reference
DO $$
DECLARE
    electronics_id UUID;
    fashion_id UUID;
    home_living_id UUID;
    sports_id UUID;
BEGIN
    SELECT id INTO electronics_id FROM public.categories WHERE slug = 'electronics' LIMIT 1;
    SELECT id INTO fashion_id FROM public.categories WHERE slug = 'fashion' LIMIT 1;
    SELECT id INTO home_living_id FROM public.categories WHERE slug = 'home-living' LIMIT 1;
    SELECT id INTO sports_id FROM public.categories WHERE slug = 'sports' LIMIT 1;

    -- Insert sample products
    INSERT INTO public.products (name, slug, price, sale_price, category_id, stock, sku, short_description, description, images, is_new, is_best_seller, is_featured, is_active) VALUES
    -- Electronics
    ('Wireless Noise-Canceling Headphones', 'wireless-headphones', 299, 249, electronics_id, 15, 'WH-1000XM4', 
     'Premium wireless headphones with industry-leading noise cancellation.',
     'Experience the next level of silence with these premium wireless headphones. Featuring advanced noise-canceling technology, exceptional sound quality, and up to 30 hours of battery life. Perfect for travel, work, or relaxation.',
     ARRAY['https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=800&q=80', 'https://images.unsplash.com/photo-1484704849700-f032a568e944?w=800&q=80', 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?w=800&q=80'],
     true, false, true, true),
    
    ('Smart Home Speaker', 'smart-speaker', 149, 119, electronics_id, 20, 'SHS-360',
     'Voice-controlled smart speaker with 360° sound.',
     'Fill your room with rich, immersive sound. This smart speaker features voice control, multi-room audio support, and seamless integration with your smart home devices.',
     ARRAY['https://images.unsplash.com/photo-1543512214-318c7553f230?w=800&q=80', 'https://images.unsplash.com/photo-1558089687-f282ffcbc126?w=800&q=80'],
     false, true, false, true),
    
    ('Wireless Earbuds Pro', 'wireless-earbuds-pro', 199, NULL, electronics_id, 30, 'WEB-PRO-2024',
     'Premium wireless earbuds with active noise cancellation.',
     'Immerse yourself in your music with these premium wireless earbuds. Features include active noise cancellation, transparency mode, and 8 hours of battery life with 24 hours total with charging case.',
     ARRAY['https://images.unsplash.com/photo-1590658268037-6bf12165a8df?w=800&q=80', 'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=800&q=80'],
     true, false, true, true),

    -- Fashion
    ('Minimalist Leather Watch', 'leather-watch', 189, NULL, fashion_id, 25, 'MW-2024',
     'Elegant timepiece with genuine leather strap.',
     'A beautiful minimalist watch crafted with premium materials. Features a sleek dial design, genuine Italian leather strap, and Japanese quartz movement. Water-resistant up to 30 meters.',
     ARRAY['https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800&q=80', 'https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=800&q=80'],
     false, true, true, true),
    
    ('Cotton Linen Blend Shirt', 'linen-shirt', 89, NULL, fashion_id, 40, 'LS-001',
     'Breathable summer shirt in neutral tones.',
     'Stay cool and stylish with this premium cotton-linen blend shirt. Features a relaxed fit, mother-of-pearl buttons, and a subtle texture. Perfect for warm weather.',
     ARRAY['https://images.unsplash.com/photo-1596755094514-f87e34085b2c?w=800&q=80', 'https://images.unsplash.com/photo-1603252109303-2751441dd157?w=800&q=80'],
     true, false, false, true),

    ('Classic Denim Jacket', 'classic-denim-jacket', 129, 99, fashion_id, 18, 'DJ-CLASSIC-01',
     'Timeless denim jacket for all seasons.',
     'A wardrobe essential that never goes out of style. Made from premium denim with a comfortable fit. Perfect for layering in any season.',
     ARRAY['https://images.unsplash.com/photo-1576995853123-5a10305d93c0?w=800&q=80'],
     false, true, false, true),

    -- Home & Living
    ('Modern Ceramic Vase Set', 'ceramic-vase-set', 79, 59, home_living_id, 30, 'CV-SET3',
     'Set of 3 handcrafted ceramic vases.',
     'Transform your space with this elegant set of three ceramic vases. Each piece is handcrafted with attention to detail, featuring a matte finish and organic shapes. Perfect for fresh or dried flowers.',
     ARRAY['https://images.unsplash.com/photo-1578500494198-246f612d3b3d?w=800&q=80', 'https://images.unsplash.com/photo-1612196808214-b8e1d6145a8c?w=800&q=80'],
     true, false, false, true),
    
    ('Scented Candle Collection', 'scented-candles', 45, NULL, home_living_id, 60, 'SC-TRIO',
     'Trio of hand-poured soy wax candles.',
     'Create the perfect ambiance with our collection of three hand-poured soy candles. Features notes of sandalwood, vanilla, and fresh linen. 40+ hours burn time each.',
     ARRAY['https://images.unsplash.com/photo-1602028915047-37269d1a73f7?w=800&q=80', 'https://images.unsplash.com/photo-1603006905003-be475563bc59?w=800&q=80'],
     false, true, true, true),

    ('Minimalist Desk Lamp', 'minimalist-desk-lamp', 65, NULL, home_living_id, 22, 'MDL-2024',
     'Sleek LED desk lamp with adjustable brightness.',
     'Illuminate your workspace with this modern LED desk lamp. Features touch-sensitive controls, 3 color temperatures, and a sleek aluminum body.',
     ARRAY['https://images.unsplash.com/photo-1507473885765-e6ed057f782c?w=800&q=80'],
     true, false, true, true),

    -- Sports
    ('Premium Yoga Mat', 'yoga-mat', 69, NULL, sports_id, 50, 'YM-PRO',
     'Eco-friendly non-slip yoga mat with alignment lines.',
     'Elevate your practice with this premium eco-friendly yoga mat. Features alignment lines, superior grip, and optimal cushioning for joints. Made from natural rubber and TPE.',
     ARRAY['https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?w=800&q=80', 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=800&q=80'],
     false, false, true, true),
    
    ('Running Shoes Pro', 'running-shoes', 159, 129, sports_id, 35, 'RS-PRO',
     'Lightweight performance running shoes.',
     'Engineered for speed and comfort. These running shoes feature responsive cushioning, breathable mesh upper, and durable rubber outsole. Perfect for both training and race day.',
     ARRAY['https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&q=80', 'https://images.unsplash.com/photo-1460353581641-37baddab0fa2?w=800&q=80'],
     true, false, true, true),

    ('Resistance Bands Set', 'resistance-bands-set', 29, NULL, sports_id, 100, 'RBS-5PACK',
     'Set of 5 resistance bands for home workouts.',
     'Complete your home gym with this set of 5 resistance bands. Different resistance levels from light to extra heavy. Perfect for strength training, stretching, and rehabilitation.',
     ARRAY['https://images.unsplash.com/photo-1598289431512-b97b0917affc?w=800&q=80'],
     false, true, false, true);

    RAISE NOTICE 'Successfully inserted 12 sample products!';
END $$;
