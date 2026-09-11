SELECT
    p.sku,
    p.category,
    AVG(CASE WHEN s.status = 'delivered' THEN 1 ELSE 0 END) AS buyout_rate
FROM sales s
JOIN products p ON s.sku = p.sku
GROUP BY p.sku, p.category
HAVING AVG(CASE WHEN s.status = 'delivered' THEN 1 ELSE 0 END) < 0.7
ORDER BY buyout_rate ASC;