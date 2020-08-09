# store

Товары на сайт интернет-магазина сгруппированы по категориям. Категории организованы в
древовидную структуру с уровнем вложенности до 4 включительно. Значимые атрибуты категории:
название. Значимые атрибуты товара: название и цена. Один продукт может относиться к нескольким
категориям.
1. Разработать структуру базы данных MySQL для хранения дерева категорий, списка продуктов и
информации о принадлежности продуктов к категориям.
2. Заполнить таблицы тестовыми данными.
3. Написать SQL-запросы для получения следующих данных:
a. Для заданного списка товаров получить названия всех категорий, в которых
представлены товары;
b. Для заданной категории получить список предложений всех товаров из этой категории и
ее дочерних категорий;
c. Для заданного списка категорий получить количество предложений товаров в каждой
категории;d. Для заданного списка категорий получить общее количество уникальных предложений
товара;
e. Для заданной категории получить ее полный путь в дереве (breadcrumb, «хлебные
крошки»).
4. Проверить и обосновать оптимальность запросов.
Предоставить дамп базы и sql-файл с заданиями согласно задаче и текстами запросов решений.
