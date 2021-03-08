■問題
書籍情報テーブル（books）から出版社が「日経BP」「翔泳社」である書籍情報だけを取り出してみましょう。
なお取り出す列はisbn,title,publish列とします。

SELECT
	isbn,
	title,
	publish
FROM
	[①空欄]
WHERE
	publish [②空欄] ('日経BP','翔泳社')
;

■実行文
# isbn,title,publish列を取り出す
SELECT
	isbn,
	title,
	publish
# 書籍情報テーブルから取得
FROM
	books
# 出版社が「日経BP」「翔泳社」である書籍情報だけ取得
WHERE
	publish in ('日経BP','翔泳社')
;


■返却値

mysql> SELECT
    -> isbn,
    -> title,
    -> publish
    -> FROM
    -> books
    -> WHERE
    -> publish in ('日経BP','翔泳社')
    -> ;
+---------------+-----------------+---------+
| isbn          | title           | publish |
+---------------+-----------------+---------+
| 4-7981-0722-0 | XML辞典         | 翔泳社  |
| 4-7981-0959-2 | PEAR入門        | 翔泳社  |
| 4-8833-0000-1 | SQLリファレンス | 日経BP  |
| 4-8833-0000-2 | SQLプチブック   | 日経BP  |
| 4-8833-0000-3 | XMLリファレンス | 日経BP  |
+---------------+-----------------+---------+
5 rows in set (0.00 sec)