SELECT
    s.sku,
    p.category,
    p.price,
    SUM(s.revenue) AS current_revenue,
    SUM(s.revenue) * 2 AS estimated_lost_revenue
FROM sales s
JOIN products p ON s.sku = p.sku
JOIN stock st ON s.sku = st.sku AND st.quantity = 0
GROUP BY s.sku, p.category, p.price
ORDER BY estimated_lost_revenue DESC;