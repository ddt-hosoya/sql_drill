■問題
貸出記録テーブル（rental）から未返却のもので貸出日が古いものを先頭から5件取り出してみましょう。
取得列は、user_id, isbn, rental_date列とします。

■実行文
# user_id, isbn, rental_date列を取得
SELECT
	user_id,
	isbn,
	rental_date
# 貸出記録テーブルから取得
FROM
	rental
# 未返却であるという条件に当てはまる場合取得
WHERE
	returned = 0
# 貸出日が古い順に並べる
ORDER BY
	rental_date
# 取得する行は先頭から5件
LIMIT
	5
;


■返却値
mysql> # user_id, isbn, rental_date列を取得
mysql> SELECT
    -> user_id,
    -> isbn,
    -> rental_date
    -> # 貸出記録テーブルから取得
    -> FROM
    -> rental
    -> # 未返却であるという条件に当てはまる場合取得
    -> WHERE
    -> returned = 0
    -> # 貸出日が古い順に並べる
    -> ORDER BY
    -> rental_date
    -> # 取得する行は先頭から5件
    -> LIMIT
    -> 5
    -> ;
+---------+---------------+-------------+
| user_id | isbn          | rental_date |
+---------+---------------+-------------+
| A200402 | 4-8833-0000-2 | 2012-02-22  |
| B200504 | 4-0010-0000-0 | 2012-03-20  |
| A200405 | 4-0010-0000-0 | 2012-06-14  |
| B200404 | 4-8833-0000-2 | 2012-12-10  |
| A200405 | 4-8833-0000-3 | 2012-12-22  |
+---------+---------------+-------------+
5 rows in set (0.03 sec)