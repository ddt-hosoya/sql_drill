■問題文
貸し出し記録テーブル（rental）上、returned列が9（紛失）であるレコードについて、
対応する書籍情報テーブル（books）上の書籍情報を削除してみましょう。

■実行文
# 書籍情報テーブルのデータを削除する
DELETE FROM
	books
# 貸し出し記録テーブル上returned列が9（紛失）である書籍情報の場合のみ削除する
WHERE
	isbn IN
	(
		SELECT
			isbn
		FROM
			rental
		WHERE
			returned = '9'
	)
;

■返却値
mysql> DELETE FROM
    -> books
    -> WHERE
    -> isbn IN
    -> (
    -> SELECT
    -> isbn
    -> FROM
    -> rental
    -> WHERE
    -> returned = '9'
    -> )
    -> ;
Query OK, 2 rows affected (0.06 sec)

【Before】
mysql> select count(*) from books;
+----------+
| count(*) |
+----------+
|       13 |
+----------+
1 row in set (0.03 sec)

mysql> select * from books where isbn in (select isbn from rental where returned='9');
+---------------+------------------------+-------+-----------+--------------+-------------+
| isbn          | title                  | price | publish   | publish_date | category_id |
+---------------+------------------------+-------+-----------+--------------+-------------+
| 4-0010-0000-0 | ハムスターの観察未分類 |   818 | WINGS出版 | 2010-11-01   | XXXXX       |
| 4-8833-0000-2 | SQLプチブックSQL       |  1310 | 日経BP    | 2010-11-30   | XXXXX       |
+---------------+------------------------+-------+-----------+--------------+-------------+
2 rows in set (0.03 sec)

【After】
mysql> select count(*) from books;
+----------+
| count(*) |
+----------+
|       11 |
+----------+
1 row in set (0.00 sec)

mysql> select * from books where isbn in (select isbn from rental where returned='9');
Empty set (0.00 sec)