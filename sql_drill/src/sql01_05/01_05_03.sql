■問題
書籍情報テーブル(books)から書名が「SQL○○」(〇は１文字)である書籍の情報を取り出してみましょう。
取り出す対象はisbn, title, price列とします。

■実行文
# isbn, title, price列を取得
SELECT
	isbn,
	title,
	price
# 書籍情報テーブルから取得
FROM
	books
# 書名が「SQL○○」(〇は１文字)であるという条件に当てはまる場合のみ取得
WHERE
	title LIKE 'SQL__'
;


■返却値
mysql> # isbn, title, price列を取得
mysql> SELECT
    -> isbn,
    -> title,
    -> price
    -> # 書籍情報テーブルから取得
    -> FROM
    -> books
    -> # 書名が「SQL○○」(〇は１文字)であるという条件に当てはまる場合のみ取得
    -> WHERE
    -> title LIKE 'SQL__'
    -> ;
+---------------+---------+-------+
| isbn          | title   | price |
+---------------+---------+-------+
| 4-0010-0000-9 | SQL入門 |  5500 |
+---------------+---------+-------+
1 row in set (0.03 sec)

mysql>