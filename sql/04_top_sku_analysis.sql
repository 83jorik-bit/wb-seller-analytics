SELECT
    p.sku,
    p.category,
    p.brand,
    SUM(s.revenue) AS total_revenue,
    SUM(s.revenue - s.commission - s.logistics) AS net_revenue
FROM sales s
JOIN products p ON s.sku = p.sku
GROUP BY p.sku, p.category, p.brand
ORDER BY total_revenue DESC
LIMIT 20;