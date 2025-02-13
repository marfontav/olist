-- SQLite -- Agregando por vendedor - Qtd Produtos, Qtd_pedidos, Receita e Última venda
SELECT T2.seller_id,
    SUM( T2.price ) AS receita_total,
    COUNT(DISTINCT T1.order_id) AS qtd_pedidos,
    COUNT(T2.product_id) AS qtd_produtos,
    COUNT(DISTINCT T2.product_id) AS dist_qtd_produtos,
    MIN( julianday('2018-06-01') - julianday(T1.order_approved_at) ) AS qtd_dias_ult_venda,
    MAX( T1.order_approved_at ) AS dt_ult_venda

FROM tb_orders AS T1
LEFT JOIN tb_order_items AS T2
ON T1.order_id = T2.order_id
WHERE T1.order_approved_at BETWEEN '2017-06-01' AND '2018-06-01'
GROUP BY T2.seller_id;