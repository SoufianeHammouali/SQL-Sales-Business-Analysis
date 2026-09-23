# Analyse des performances commerciales avec SQL

## Présentation du projet

Ce projet SQL analyse les performances commerciales d'une entreprise à partir de deux tables relationnelles : `customers` et `sales`.

L'objectif est de transformer des données transactionnelles en informations utiles pour suivre le chiffre d'affaires, le profit, les produits, les catégories, les segments clients et les canaux de vente.

## Objectifs

- Analyser le chiffre d'affaires et le profit par catégorie et par produit.
- Identifier les clients et produits les plus contributeurs.
- Comparer les performances des segments clients et des canaux de vente.
- Étudier l'évolution mensuelle des ventes.
- Classer les produits et catégories selon leurs performances.
- Mettre en pratique des requêtes SQL de niveau débutant à avancé.

## Base de données

Le projet utilise SQLite et contient deux tables :

### `customers`

Informations sur les clients :
- `customer_id`
- `customer_name`
- `age`
- `city`
- `segment`

### `sales`

Informations sur les commandes :
- `order_id`
- `order_date`
- `customer_id`
- `category`
- `product`
- `quantity`
- `net_revenue`
- `profit`
- `sales_channel`

La relation entre les deux tables est basée sur `customer_id`.

## Analyses réalisées

1. Performance par catégorie.
2. Produits générant au moins 10 000 de chiffre d'affaires.
3. Performance commerciale par client.
4. Classification des catégories selon leur profit.
5. Ventes supérieures à la vente moyenne.
6. Performance par canal de vente avec une CTE.
7. Classement des produits par chiffre d'affaires avec `DENSE_RANK()`.
8. Analyse mensuelle du chiffre d'affaires, du profit et du nombre de commandes.
9. Performance par segment client avec classification du niveau de profit.
10. Analyse avancée des catégories pour les clients Premium âgés de 30 ans ou plus.
11. Bonus : classement des produits à l'intérieur de chaque catégorie avec `PARTITION BY`.

## Compétences SQL utilisées

- `SELECT`, `WHERE`, `ORDER BY`
- `GROUP BY` et `HAVING`
- Fonctions d'agrégation : `SUM()`, `COUNT()`, `AVG()`
- `INNER JOIN`
- `CASE WHEN`
- Sous-requêtes
- CTE (`WITH`)
- Fonctions de fenêtre
- `DENSE_RANK()`
- `PARTITION BY`
- Analyse de dates avec `STRFTIME()`

## Fichiers du projet

- `database_setup.sql` : création des tables et insertion des données.
- `analysis_queries.sql` : ensemble des requêtes d'analyse SQL.

## Outils

- SQLite
- SQLiteOnline
- GitHub

## Conclusion

Ce projet démontre une démarche d'analyse SQL allant de requêtes d'agrégation simples à des analyses plus avancées utilisant les jointures, les CTE, les sous-requêtes et les fonctions de fenêtre.
