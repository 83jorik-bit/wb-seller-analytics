SELECT
    p.category,
    SUM(s.revenue) AS total_revenue,
    COUNT(DISTINCT s.sku) AS sku_count
FROM sales s
JOIN products p ON s.sku = p.sku
GROUP BY p.category
ORDER BY total_revenue DESC;
