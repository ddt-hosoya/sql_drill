■問題
書籍情報テーブル（books）から価格が2500～3500円の範囲の書籍を価格が安い順に取り出してみましょう。
取り出す列はtitle, price列であるものとします。
SELECT
	title,
	price
FROM
	books
WHERE
	[①空欄]
ORDER BY
	[②空欄]
;

■実行文
# title, price列を取得
SELECT
	title,
	price
# 書籍情報テーブルから取得
FROM
	books
# 価格が2500～3500円の範囲という条件に当てはまる場合のみ取得
WHERE
	price >= 2500
	AND
	price <= 3000
# 取得結果を価格が安い順に並べる
ORDER BY
	price ASC
;


■返却値
mysql> # title, price列を取得
mysql> SELECT
    -> title,
    -> price
    -> # 書籍情報テーブルから取得
    -> FROM
    -> books
    -> # 価格が2500～3500円の範囲という条件に当てはまる場合のみ取得
    -> WHERE
    -> price >= 2500
    -> AND
    -> price <= 3000
    -> # 取得結果を価格が安い順に並べる
    -> ORDER BY
    -> price ASC
    -> ;
+-----------------+-------+
| title           | price |
+-----------------+-------+
| SQLリファレンス |  2500 |
| PHP5サンプル集  |  3000 |
| PEAR入門        |  3000 |
+-----------------+-------+
3 rows in set (0.00 sec)