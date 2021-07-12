■問題文
以下は、書籍情報テーブル（books）上で分類IDが「Z9999(未分類)」であるか、
NULLである書籍を削除するSQLですが、誤りが2点あります。誤りを指摘してください。
DELETE
	books
WHERE
	category_id='Z9999'
	AND
	category_id IS NULL
;

■回答・実行文
指摘１：DELETEの後ろに「FROM」が必要
指摘２：WHERE句の条件はANDではなくORが正しい

# 書籍情報テーブルからデータを削除する
DELETE FROM
	books
# 分類IDが「Z9999(未分類)」であるか、NULLである場合のみ削除する
WHERE
	category_id='Z9999'
	OR
	category_id IS NULL
;

■返却値
mysql> DELETE FROM
    -> books
    -> WHERE
    -> category_id='Z9999'
    -> OR
    -> category_id IS NULL
    -> ;
Query OK, 2 rows affected (0.05 sec)

【Before】
mysql> select count(*) from books;
+----------+
| count(*) |
+----------+
|       15 |
+----------+
1 row in set (0.03 sec)

mysql> select * from books where category_id='Z9999' or category_id is null;
+---------------+------------------------+-------+-----------+--------------+-------------+
| isbn          | title                  | price | publish   | publish_date | category_id |
+---------------+------------------------+-------+-----------+--------------+-------------+
| 4-0010-0000-4 | フェレットの観察未分類 |   909 | WINGS出版 | 2012-10-26   | Z9999       |
| 4-0010-0000-5 | らくだの観察日記未分類 |  1000 | WINGS出版 | 2012-12-24   | Z9999       |
+---------------+------------------------+-------+-----------+--------------+-------------+
2 rows in set (0.00 sec)

【After】
mysql> select count(*) from books;
+----------+
| count(*) |
+----------+
|       13 |
+----------+
1 row in set (0.00 sec)

mysql> select * from books where category_id='Z9999' or category_id is null;
Empty set (0.00 sec)
