■問題文
以下は、貸し出し記録テーブル（rental）を新規に作成するためのSQL命令ですが、誤りが2点あります。誤りを指摘してください。
CREATE TABLE INTO
	rental
	(
		id INT AUTO_INCREMENT, PRIMARY KEY,
		user_id CHAR(7),
		isbn CHAR(13),
		rental_date DATE,
		returned SMALLINT DEFAULT 0
	)
;

■回答・実行文
指摘１：CREATE文に「INTO」は不要。
指摘２：列フラグ「AUTO_INCREMENT」のうしろのカンマは不要。
# 貸し出し記録テーブルを作成する
CREATE TABLE
	rental
	# 列定義は下記の通りにする、主キーはidとする
	(
		id INT AUTO_INCREMENT PRIMARY KEY,
		user_id CHAR(7),
		isbn CHAR(13),
		rental_date DATE,
		returned SMALLINT DEFAULT 0
	)
;

■返却値
mysql> CREATE TABLE
    -> rental
    -> (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> user_id CHAR(7),
    -> isbn CHAR(13),
    -> rental_date DATE,
    -> returned SMALLINT DEFAULT 0
    -> )
    -> ;
Query OK, 0 rows affected (0.17 sec)