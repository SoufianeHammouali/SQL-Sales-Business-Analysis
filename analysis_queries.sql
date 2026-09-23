-- Projet : Analyse des performances commerciales avec SQL

-- 01. Performance par catégorie
SELECT category, SUM(net_revenue) AS Total_Revenue, SUM(profit) AS Total_Profit
FROM sales
GROUP BY category
ORDER BY Total_Revenue DESC;

-- 02. Produits générant au moins 10 000 de chiffre d'affaires
SELECT product, COUNT(*) AS Number_Of_Sales,
       SUM(net_revenue) AS Total_Revenue, SUM(profit) AS Total_Profit
FROM sales
GROUP BY product
HAVING SUM(net_revenue) >= 10000
ORDER BY Total_Profit DESC;

-- 03. Performance commerciale par client
SELECT C.customer_name, C.segment, COUNT(*) AS Number_Of_Orders,
       SUM(S.net_revenue) AS Total_Revenue, SUM(S.profit) AS Total_Profit
FROM sales AS S
INNER JOIN customers AS C ON C.customer_id = S.customer_id
GROUP BY C.customer_id, C.customer_name, C.segment
HAVING SUM(S.net_revenue) >= 10000
ORDER BY Total_Revenue DESC;

-- 04. Classification des catégories selon leur profit
SELECT category, SUM(net_revenue) AS Total_Revenue, SUM(profit) AS Total_Profit,
       CASE
           WHEN SUM(profit) >= 7000 THEN 'High'
           WHEN SUM(profit) >= 4000 THEN 'Medium'
           ELSE 'Low'
       END AS Performance_Level
FROM sales
GROUP BY category
ORDER BY Total_Profit DESC;

-- 05. Ventes supérieures à la vente moyenne
SELECT order_id, product, category, net_revenue
FROM sales
WHERE net_revenue > (SELECT AVG(net_revenue) FROM sales)
ORDER BY net_revenue DESC;

-- 06. Performance par canal de vente avec CTE
WITH sales_summary AS (
    SELECT sales_channel, SUM(net_revenue) AS Total_Revenue,
           SUM(profit) AS Total_Profit, COUNT(*) AS Number_Of_Orders
    FROM sales
    GROUP BY sales_channel
)
SELECT *
FROM sales_summary
WHERE Total_Revenue >= 30000
ORDER BY Total_Revenue DESC;

-- 07. Classement des produits par chiffre d'affaires
SELECT product, SUM(net_revenue) AS Total_Revenue, SUM(profit) AS Total_Profit,
       DENSE_RANK() OVER (ORDER BY SUM(net_revenue) DESC) AS Revenue_Rank
FROM sales
GROUP BY product
ORDER BY Revenue_Rank ASC;

-- 08. Analyse mensuelle des ventes
SELECT STRFTIME('%m', order_date) AS Month,
       SUM(net_revenue) AS Total_Revenue, SUM(profit) AS Total_Profit,
       COUNT(*) AS Number_Of_Orders
FROM sales
GROUP BY STRFTIME('%m', order_date)
ORDER BY Month ASC;

-- 09. Performance par segment client
SELECT C.segment, COUNT(*) AS Number_Of_Orders,
       SUM(S.net_revenue) AS Total_Revenue, SUM(S.profit) AS Total_Profit,
       CASE
           WHEN SUM(S.profit) >= 8000 THEN 'High'
           WHEN SUM(S.profit) >= 5000 THEN 'Medium'
           ELSE 'Low'
       END AS Profit_Level
FROM sales AS S
INNER JOIN customers AS C ON C.customer_id = S.customer_id
GROUP BY C.segment
ORDER BY Total_Profit DESC;

-- 10. Analyse avancée : clients Premium âgés de 30 ans ou plus
WITH summary_sales AS (
    SELECT S.category, COUNT(*) AS Number_Of_Orders,
           SUM(S.net_revenue) AS Total_Revenue, SUM(S.profit) AS Total_Profit
    FROM sales AS S
    INNER JOIN customers AS C ON S.customer_id = C.customer_id
    WHERE C.segment = 'Premium' AND C.age >= 30
    GROUP BY S.category
    HAVING SUM(S.net_revenue) >= 10000
)
SELECT *,
       CASE
           WHEN Total_Profit >= 6000 THEN 'Excellent'
           WHEN Total_Profit >= 3000 THEN 'Good'
           ELSE 'Low'
       END AS Performance_Level,
       DENSE_RANK() OVER (ORDER BY Total_Revenue DESC) AS Revenue_Rank
FROM summary_sales
ORDER BY Revenue_Rank ASC;

-- Bonus : classement des produits à l'intérieur de chaque catégorie
SELECT category, product, SUM(net_revenue) AS Total_Revenue,
       DENSE_RANK() OVER (
           PARTITION BY category
           ORDER BY SUM(net_revenue) DESC
       ) AS Product_Rank
FROM sales
GROUP BY category, product
ORDER BY category, Product_Rank;
