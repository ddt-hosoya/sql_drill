■問題文
書籍テーブル（books）上、publish列の定義を「VARCHAR(100) NULLを許可」で変更してみましょう。
以下の空欄を埋めて、SQL命令を完成させてください。
[空欄①]
	books
MODIFY
	[空欄②]
;
■実行文
# 書籍テーブルのテーブル定義を変更する
ALTER TABLE
	books
# publish列の定義をVARCHAR(100) NULLを許可に変更する
MODIFY
	publish VARCHAR(100) NULL
;

■返却値
【Before】
mysql> desc books;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| isbn         | char(17)     | NO   | PRI | NULL    |       |
| title        | varchar(255) | YES  |     | NULL    |       |
| price        | int          | YES  |     | NULL    |       |
| publish      | varchar(30)  | YES  |     | NULL    |       |
| publish_date | date         | YES  |     | NULL    |       |
| category_id  | char(5)      | YES  |     | NULL    |       |
| sales        | int          | YES  |     | NULL    |       |
| rating       | char(1)      | NO   |     | B       |       |
| pages        | int          | NO   |     | 0       |       |
+--------------+--------------+------+-----+---------+-------+
9 rows in set (0.03 sec)

【After】
mysql> ALTER TABLE
    -> books
    -> MODIFY
    -> publish VARCHAR(100) NULL
    -> ;
Query OK, 0 rows affected (0.75 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc books;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| isbn         | char(17)     | NO   | PRI | NULL    |       |
| title        | varchar(255) | YES  |     | NULL    |       |
| price        | int          | YES  |     | NULL    |       |
| publish      | varchar(100) | YES  |     | NULL    |       |
| publish_date | date         | YES  |     | NULL    |       |
| category_id  | char(5)      | YES  |     | NULL    |       |
| sales        | int          | YES  |     | NULL    |       |
| rating       | char(1)      | NO   |     | B       |       |
| pages        | int          | NO   |     | 0       |       |
+--------------+--------------+------+-----+---------+-------+
9 rows in set (0.05 sec)