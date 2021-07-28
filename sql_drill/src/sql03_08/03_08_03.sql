■問題文
店舗テーブル（shop）に登録されていない店舗に関する情報を、月間売上テーブル（sales）から削除してください。

■実行文
# 月間売上テーブルのデータを削除する
DELETE FROM
	sales
# 店舗テーブルに登録されていない店舗の場合のみ削除する
WHERE
	s_id
	NOT IN
	(
		SELECT
			s_id
		FROM
			shop
	)
;

■返却値
mysql> DELETE FROM
    -> sales
    -> WHERE
    -> s_id
    -> NOT IN
    -> (
    -> SELECT
    -> s_id
    -> FROM
    -> shop
    -> )
    -> ;
Query OK, 2 rows affected (0.05 sec)

【Before】
mysql> select count(*) from sales;
+----------+
| count(*) |
+----------+
|       16 |
+----------+
1 row in set (0.00 sec)

mysql> select * from sales where s_id not in (select s_id from shop);
+-------+---------+---------+
| s_id  | s_date  | s_value |
+-------+---------+---------+
| N0001 | 2012-11 |    9965 |
| N0001 | 2012-12 |   11023 |
+-------+---------+---------+
2 rows in set (0.00 sec)

【After】
mysql> select count(*) from sales;
+----------+
| count(*) |
+----------+
|       14 |
+----------+
1 row in set (0.00 sec)

mysql> select * from sales where s_id not in (select s_id from shop);
Empty set (0.00 sec)