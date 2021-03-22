■問題
ユーザーテーブル（usr）から東京都在住で、かつ、E-Mailアドレスのドメインが「examples.com」のユーザーの情報を取り出してみましょう。

SELECT
	l_name,
	f_name,
	email
FROM
	usr
WHERE
	[①空欄]
	AND
	[②空欄]
;


■実行文
# l_name,f_name,email列を取得
SELECT
	l_name,
	f_name,
	email
# ユーザー情報テーブルから取得
FROM
	usr
# 東京都在住で、かつ、E-Mailアドレスのドメインが「example.com」という条件に当てはまる場合のみ取得
WHERE
	prefecture = '東京都'
	AND
	email LIKE '%@examples.com'
;


■返却値
mysql> # l_name,f_name,email列を取得
mysql> SELECT
    -> l_name,
    -> f_name,
    -> email
    -> # ユーザー情報テーブルから取得
    -> FROM
    -> usr
    -> # 東京都在住で、かつ、E-Mailアドレスのドメインが「example.com」という条件に当てはまる場合のみ取得
    -> WHERE
    -> prefecture = '東京都'
    -> AND
    -> email LIKE '%@examples.com'
    -> ;
+--------+--------+------------------+
| l_name | f_name | email            |
+--------+--------+------------------+
| 小野   | 雄二   | ono@examples.com |
+--------+--------+------------------+
1 row in set (0.03 sec)

mysql>