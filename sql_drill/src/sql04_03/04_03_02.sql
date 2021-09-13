■問題文
月間売上テーブル（sales）を主キーのない状態でまず作成してみましょう。
これに対して、後から主キーを追加します。以下の空欄を埋めて、SQL命令を完成させてください。

[空欄①]
	sales
	(
		[空欄②],
		s_date DATE NOT NULL,
		s_value INT DEFAULT 0
	)
;

[空欄③]
	sales
ADD
	[空欄④]
;

■実行文
# 月間売上テーブルを作成する
CREATE TABLE
	sales
	# 列定義を下記の通りにする（主キーは設定しない）
	(
		s_id CHAR(5) NOT NULL,
		s_date DATE NOT NULL,
		s_value INT DEFAULT 0
	)
;
＃ 月間売上テーブルのテーブル定義を変更する
ALTER TABLE
	sales
# s_idとs_dateを主キーに設定する
ADD
	PRIMARY KEY (s_id, s_date)
;

■返却値
mysql> CREATE TABLE
    -> sales
    -> (
    -> s_id CHAR(5) NOT NULL,
    -> s_date DATE NOT NULL,
    -> s_value INT DEFAULT 0
    -> )
    -> ;
Query OK, 0 rows affected (0.11 sec)

mysql> desc sales;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| s_id    | char(5) | NO   |     | NULL    |       |
| s_date  | date    | NO   |     | NULL    |       |
| s_value | int     | YES  |     | 0       |       |
+---------+---------+------+-----+---------+-------+
3 rows in set (0.05 sec)

mysql>
mysql> ALTER TABLE
    -> sales
    -> ADD
    -> PRIMARY KEY (s_id, s_date)
    -> ;
Query OK, 0 rows affected (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc sales;
+---------+---------+------+-----+---------+-------+
| Field   | Type    | Null | Key | Default | Extra |
+---------+---------+------+-----+---------+-------+
| s_id    | char(5) | NO   | PRI | NULL    |       |
| s_date  | date    | NO   | PRI | NULL    |       |
| s_value | int     | YES  |     | 0       |       |
+---------+---------+------+-----+---------+-------+
3 rows in set (0.00 sec)