■問題文
著者情報テーブル（author）上、著者名の定義を「VARCHAR(100) デフォルト値は空文字列」に変更してみましょう。

■実行文
# 著者情報テーブルの列定義を変更する
ALTER TABLE
	author
# 著者名の定義を「VARCHAR(100) デフォルト値は空文字列」とする
MODIFY name VARCHAR(100) DEFAULT ''
;

■返却値
【Before】
mysql> desc author;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| author_id | char(5)      | NO   | PRI | NULL    |       |
| name      | varchar(30)  | YES  |     | NULL    |       |
| name_kana | varchar(100) | YES  |     | NULL    |       |
| birth     | date         | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.12 sec)


【After】
mysql> ALTER TABLE
    -> author
    -> MODIFY name VARCHAR(100) DEFAULT ''
    -> ;
Query OK, 0 rows affected (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc author;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| author_id | char(5)      | NO   | PRI | NULL    |       |
| name      | varchar(100) | YES  |     |         |       |
| name_kana | varchar(100) | YES  |     | NULL    |       |
| birth     | date         | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)