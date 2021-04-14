■問題
著者ー書籍テーブル（author_books）で著者ごとの書籍数を求め、登録数が３冊以上の情報だけを取り出しましょう。

■実行文

SELECT
# 著者、著者ごとの書籍数を取得
	author_id,
	count(*)
# 著者ー書籍テーブルから取得
FROM
	author_books
# 著者ごとに集計する
GROUP by
	author_id
# 著者ごとに集計した結果書籍数が3冊以上の条件に当てはまる場合のみ取得
HAVING
	count(*) >= 3
;
■返却値
mysql> SELECT
    -> author_id,
    -> count(*)
    -> from
    -> author_books
    -> GROUP by
    -> author_id
    -> HAVING
    -> count(*) >= 3
    -> ;
+-----------+----------+
| author_id | count(*) |
+-----------+----------+
| Y0002     |        4 |
+-----------+----------+
1 row in set (0.00 sec)