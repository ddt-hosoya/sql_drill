■問題文
月間売上テーブル（sales）を新規に作成してみましょう。

■実行文
# 月間売上テーブルを作成する
CREATE TABLE
	sales
# 列定義を下記のとおりとする、主キーはs_idとs_dateとする
	(
		s_id CHAR(5),
		s_date CHAR(7) DEFAULT '0000-00',
		s_value INT NULL,
		PRIMARY KEY(s_id, s_date)
	);

■返却値
mysql> CREATE TABLE
    -> sales
    -> (
    -> s_id CHAR(5),
    -> s_date CHAR(7) DEFAULT '0000-00',
    -> s_value INT NULL,
    -> PRIMARY KEY(s_id, s_date)
    -> );
Query OK, 0 rows affected (0.05 sec)