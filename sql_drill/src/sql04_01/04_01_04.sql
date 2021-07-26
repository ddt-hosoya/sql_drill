■問題文
書籍情報テーブル（books）を新規に作成してみましょう。

■実行文
# 書籍情報テーブルを作成する
CREATE TABLE
	books
	# 列定義を下記のとおりとする、主キーはisbnとする
	(
		isbn CHAR(17) NOT NULL PRIMARY KEY,
		title VARCHAR(255) NULL,
		price INT NULL,
		publish VARCHAR(30) NULL,
		publish_date DATE NULL,
		category_id CHAR(5) NULL
	)
;

■返却値
mysql> CREATE TABLE
    -> books
    -> (
    -> isbn CHAR(17) NOT NULL PRIMARY KEY,
    -> title VARCHAR(255) NULL,
    -> price INT NULL,
    -> publish VARCHAR(30) NULL,
    -> publish_date DATE NULL,
    -> category_id CHAR(5) NULL
    -> )
    -> ;
Query OK, 0 rows affected (0.16 sec)