■問題
書籍情報テーブル（books）で、出版社ごとの書籍価格の最大値を求めてみましょう。

■実行文
# 出版社ごとの書籍価格の最大値を取得
SELECT
	publish,
	MAX(price)
# 書籍情報テーブルから取得
FROM
	books
# 出版社ごとに取得
GROUP by
	publish
;

■返却値
mysql> SELECT
    -> publish,
    -> MAX(price)
    -> FROM
    -> books
    -> GROUP by
    -> publish
    -> ;
+--------------+------------+
| publish      | MAX(price) |
+--------------+------------+
| 山田出版     |       5500 |
| 秀和システム |       3000 |
| 翔泳社       |       3300 |
| 日経BP       |       3200 |
+--------------+------------+
4 rows in set (0.00 sec)