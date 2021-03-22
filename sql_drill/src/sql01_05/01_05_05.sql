■問題
以下は書籍情報テーブル（books）から名前が「社」で終わる出版社の情報だけを取り出すSQL命令ですが、2点誤りがあります。
誤りを指摘してください。取り出す列は、title列とします。

SELECT
	title,
FROM
	books
WHERE
	publish LIKE '_社'
;

■回答・実行文
指摘１：取得列がひとつなのでtitleのうしろにカンマは不要
指摘２：'_社'だと社の前が一文字の場合しか取得出来ないため「社」で終わるすべての出版社を取得するためには'%社'が正しい。

# title列を取得
SELECT
	title
# 書籍情報テーブルから取得
FROM
	books
# 名前が「社」で終わる出版社という条件に当てはまる場合のみ取得
WHERE
	publish LIKE '%社'
;


■返却値
mysql> # title列を取得
mysql> SELECT
    -> title
    -> # 書籍情報テーブルから取得
    -> FROM
    -> books
    -> # 名前が「社」で終わる出版社という条件に当てはまる場合のみ取得
    -> WHERE
    -> publish LIKE '%社'
    -> ;
+----------+
| title    |
+----------+
| XML辞典  |
| PEAR入門 |
+----------+
2 rows in set (0.00 sec)
