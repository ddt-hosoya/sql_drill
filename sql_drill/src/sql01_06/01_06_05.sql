■問題
以下は、書籍情報テーブルから出版社（publish列）が「秀和システム」または「日経BP」であり、
かつ、価格（price列）が3000円未満の書籍を取り出すためのＳＱＬ命令です。2点誤りがあります。誤りを指摘してください。
SELECT
	isbn,
	title
FROM
	books
WHERE
	publish='秀和システム'
	AND
	publish='日経BP'
	OR
	price < 3000


■実行文
指摘１：出版社の条件は「秀和システム」または「日経BP」なのでANDでなくOR演算子が正しい。そしてORよりANDが優先されるため括弧で括る必要がある。
指摘２：出版社の条件と価格の条件はどちらも満たす必要があるためORでなくAND演算子で接続するのが正しい。

# isbn, title列を取得
SELECT
	isbn,
	title
# 著者情報テーブルから取得
FROM
	books
# 出版社（publish列）が「秀和システム」または「日経BP」であり、かつ、価格（price列）が3000円未満という条件に当てはまる場合のみ取得
WHERE
	( publish='秀和システム' OR publish='日経BP' )
	AND
	price < 3000
;


■返却値
mysql> # isbn, title列を取得
mysql> SELECT
    -> isbn,
    -> title
    -> # 著者情報テーブルから取得
    -> FROM
    -> books
    -> # 出版社（publish列）が「秀和システム」または「日経BP」であり、かつ、価格（price列）が3000円未満という条件に当てはまる場合のみ取得
    -> WHERE
    -> ( publish='秀和システム' OR publish='日経BP' )
    -> AND
    -> price < 3000
    -> ;
+---------------+-----------------+
| isbn          | title           |
+---------------+-----------------+
| 4-7980-0522-3 | JSPリファレンス |
| 4-8833-0000-1 | SQLリファレンス |
| 4-8833-0000-2 | SQLプチブック   |
+---------------+-----------------+
3 rows in set (0.00 sec)