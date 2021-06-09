■問題文
店舗テーブル（shop）からすべての店舗コードを抜き出し、月間売上テーブル（sales）に対して挿入してみましょう。
その際、売上対象年月には今月の日付（YYYY-MM）を、売上高には０を固定値でセットするものとします。


■実行文
# 月間売上テーブルにデータを挿入する
INSERT INTO
	sales
# データを挿入する項目は、店舗コード、日付、売上高
(
	s_id,
	s_date,
	s_value
)
# 月間売上テーブルに挿入する値は店舗テーブルに存在する店舗で、日付は当月、売上高は０で固定したデータ
SELECT
	s_id,
	DATE_FORMAT(CURRENT_DATE, '%Y-%m'),
	0
FROM
	shop
;

■返却値
mysql> INSERT INTO
    -> sales
    -> (
    -> s_id,
    -> s_date,
    -> s_value
    -> )
    -> SELECT
    -> s_id,
    -> DATE_FORMAT(CURRENT_DATE, '%Y-%m'),
    -> 0
    -> FROM
    -> shop
    -> ;
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from sales where s_value=0;
+-------+---------+---------+
| s_id  | s_date  | s_value |
+-------+---------+---------+
| H0001 | 2021-06 |       0 |
| K0001 | 2021-06 |       0 |
| K0002 | 2021-06 |       0 |
| M0001 | 2021-06 |       0 |
| M0002 | 2021-06 |       0 |
+-------+---------+---------+
5 rows in set (0.00 sec)