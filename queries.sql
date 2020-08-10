/*	a. Для заданного списка товаров получить названия всех категорий, в которых   представлены товары;*/
SELECT DISTINCT ctg.id, ctg.name
FROM categories ctg
         LEFT JOIN category_product cp ON cp.category_id = ctg.id
WHERE cp.product_id IN (1, 2, 3);


/*	b. Для заданной категории получить список предложений всех товаров из этой категории и ее дочерних категорий; */
SELECT prd.id, prd.name
FROM products prd
         LEFT JOIN category_product cp ON cp.product_id = prd.id
WHERE cp.category_id = '2'
UNION
SELECT prd.id, prd.name
FROM products prd
         LEFT JOIN category_product cp ON cp.product_id = prd.id
WHERE cp.category_id IN (SELECT id FROM categories WHERE parent_id = '2');

/*	c. Для заданного списка категорий получить количество предложений товаров в каждой категории;  */
SELECT category_id, COUNT(product_id) p_count
FROM category_product
WHERE category_id IN ('7', '8')
GROUP BY category_id;

/*  d. Для заданного списка категорий получить общее количество уникальных предложений
товара;*/
SELECT SUM(p_count) p_sum
FROM (SELECT cp.category_id, COUNT(product_id) p_count
      FROM category_product cp
      WHERE cp.category_id IN ('7', '8')
        AND cp.product_id NOT IN (
          SELECT sub_cp.product_id
          FROM category_product sub_cp
          WHERE sub_cp.category_id IN ('7', '8')
            AND sub_cp.category_id != cp.category_id)
      GROUP BY category_id
     ) t1;


/*	e. Для заданной категории получить ее полный путь в дереве (breadcrumb, «хлебные  крошки»).*/
SELECT t2.id, t2.name, t1.lvl
FROM (
         SELECT
             @r AS _id,
             (
                 SELECT @r := parent_id FROM categories WHERE id = _id
             ) AS parent_id,
             @lvl := @lvl + 1 AS lvl
         FROM
             (SELECT @r := 5 , @lvl := 0) vars,
             categories h
         WHERE @r <> 0) t1
         JOIN  categories t2 ON t1._id = t2.id
ORDER BY t1.lvl DESC
