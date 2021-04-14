■問題
書籍情報テーブル（books）から出版社、分類IDごとに登録数を求め、登録数が３冊未満の情報だけを取り出してみましょう。

■実行文
# 分類ID,分類IDごとの登録数を取得
SELECT
	category_id,
	count(*)
# 書籍情報テーブルから取得
FROM
	books
# 分類IDごとに集計
GROUP BY
	category_id
# 分類IDごとに集計した結果登録数が3冊未満の条件に当てはまる情報のみ取得
HAVING
	count(*) < 3
;


■返却値

mysql> SELECT
    -> category_id,
    -> count(*)
    -> FROM
    -> books
    -> GROUP BY
    -> category_id
    -> HAVING
    -> count(*) < 3
    -> ;
+-------------+----------+
| category_id | count(*) |
+-------------+----------+
| A9999       |        1 |
| H9999       |        1 |
| J4444       |        1 |
| X3333       |        2 |
+-------------+----------+
4 rows in set (0.00 sec)