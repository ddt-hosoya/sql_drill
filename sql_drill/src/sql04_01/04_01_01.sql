■問題文
著者情報テーブル（author）を新規に作成してみましょう。
以下の空欄を埋めて、SQL命令を完成させてください。
CREATE TABLE
	[空欄①]
	(
		author_id CHAR(5) [空欄②],
		name VARCHAR(30),
		name_kana VARCHAR(100),
		birth [空欄③]
	)
;

■実行文
# 著者情報テーブルを作成する
CREATE TABLE
	author
# 列定義を下記のとおりとする、主キーは著者IDとする
	(
		author_id CHAR(5) PRIMARY KEY,
		name VARCHAR(30),
		name_kana VARCHAR(100),
		birth DATE
	)
;

■返却値
mysql> CREATE TABLE
    -> author
    -> (
    -> author_id CHAR(5) PRIMARY KEY,
    -> name VARCHAR(30),
    -> name_kana VARCHAR(100),
    -> birth DATE
    -> )
    -> ;
Query OK, 0 rows affected (0.12 sec)