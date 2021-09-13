■問題文
書籍情報テーブル（books）のcategory_idの後方にsales列（INT型）を追加してみましょう。

■実行文
# 書籍情報テーブルのテーブル定義を変更する
ALTER TABLE
	books
# sales列（INT型）を追加する
ADD
	sales INT
# 追加先はcategory_id列の後方とする
AFTER
	category_id
;

■返却値
mysql> ALTER TABLE
    -> books
    -> ADD
    -> sales INT
    -> AFTER
    -> category_id
    -> ;
Query OK, 0 rows affected (0.23 sec)
Records: 0  Duplicates: 0  Warnings: 0

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
9 rows in set (0.04 sec)