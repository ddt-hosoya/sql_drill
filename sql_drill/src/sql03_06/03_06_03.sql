■問題文
書籍情報テーブル（books）上、書名の後方に分類名を付加してみましょう。
以下の空欄を埋めて、SQL命令を完成させてください。
UPDATE
	books
SET
	[空欄①]
=
	CONCAT(
		[空欄②],
		(
			SELECT
				[空欄③]
			FROM
				category
			WHERE
				[空欄④]
		)
	)
;

■実行文
# 書籍情報テーブルを更新する
UPDATE
	books
# 書名の後方に分類名を付加して更新する
SET
	title
=
	CONCAT(
		title,
		CASE
			# 分類名が登録されていない場合は書名を更新しない
			WHEN (
				SELECT
					category_name
				FROM
					category
				WHERE
					books.category_id=category.category_id
			) IS NULL THEN ''
		ELSE (
			SELECT
					category_name
				FROM
					category
				WHERE
					books.category_id=category.category_id
			)
		END
	)
;

■返却値
mysql> # 書籍情報テーブルを更新する
mysql> UPDATE
    -> books
    -> # 書名の後方に分類名を付加して更新する
    -> SET
    -> title
    -> =
    -> CONCAT(
    -> title,
    -> CASE
    -> WHEN (
    -> SELECT
    -> category_name
    -> FROM
    -> category
    -> WHERE
    -> books.category_id=category.category_id
    -> ) IS NULL THEN ''
    -> ELSE (
    -> SELECT
    -> category_name
    -> FROM
    -> category
    -> WHERE
    -> books.category_id=category.category_id
    -> )
    -> END
    -> )
    -> ;
Query OK, 13 rows affected (0.05 sec)
Rows matched: 15  Changed: 13  Warnings: 0

【Before】
mysql> select isbn,title,category_id from books;
+---------------+------------------+-------------+
| isbn          | title            | category_id |
+---------------+------------------+-------------+
| 4-0010-0000-0 | ハムスターの観察 | Z9999       |
| 4-0010-0000-1 | PHPドリル        | P1111       |
| 4-0010-0000-4 | フェレットの観察 | Z9999       |
| 4-0010-0000-5 | らくだの観察日記 | Z9999       |
| 4-0010-0000-6 | あひるの観察日記 | A9999       |
| 4-0010-0000-7 | かえるの観察日記 | H9999       |
| 4-0010-0000-9 | SQL入門          | S2222       |
| 4-7980-0522-3 | JSPリファレンス  | J4444       |
| 4-7980-0945-8 | PHP5サンプル集   | P1111       |
| 4-7981-0722-0 | XML辞典          | X3333       |
| 4-7981-0959-2 | PEAR入門         | P1111       |
| 4-8833-0000-1 | SQLリファレンス  | S2222       |
| 4-8833-0000-2 | SQLプチブック    | S2222       |
| 4-8833-0000-3 | XMLリファレンス  | X3333       |
| 4-8833-0000-4 | SQLミニ          | S2222       |
+---------------+------------------+-------------+
15 rows in set (0.00 sec)

【After】
mysql> select isbn,title,category_id from books;
+---------------+------------------------+-------------+
| isbn          | title                  | category_id |
+---------------+------------------------+-------------+
| 4-0010-0000-0 | ハムスターの観察未分類 | Z9999       |
| 4-0010-0000-1 | PHPドリルPHP           | P1111       |
| 4-0010-0000-4 | フェレットの観察未分類 | Z9999       |
| 4-0010-0000-5 | らくだの観察日記未分類 | Z9999       |
| 4-0010-0000-6 | あひるの観察日記       | A9999       |
| 4-0010-0000-7 | かえるの観察日記       | H9999       |
| 4-0010-0000-9 | SQL入門SQL             | S2222       |
| 4-7980-0522-3 | JSPリファレンスJava    | J4444       |
| 4-7980-0945-8 | PHP5サンプル集PHP      | P1111       |
| 4-7981-0722-0 | XML辞典XML             | X3333       |
| 4-7981-0959-2 | PEAR入門PHP            | P1111       |
| 4-8833-0000-1 | SQLリファレンスSQL     | S2222       |
| 4-8833-0000-2 | SQLプチブックSQL       | S2222       |
| 4-8833-0000-3 | XMLリファレンスXML     | X3333       |
| 4-8833-0000-4 | SQLミニSQL             | S2222       |
+---------------+------------------------+-------------+
15 rows in set (0.00 sec)
