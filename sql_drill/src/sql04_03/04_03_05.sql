■問題文
以下は、社員テーブル（employee）のdepart_id列の後方に「email列（VARCHAR(255)型）」を追加するSQL命令ですが、2点誤りがあります。
誤りを指摘してください。

ALTER TABLE
	employee
ADD TO
	email VARCHAR(255) NOT NULL
BEFORE
	depart_id
;

■回答・実行文
指摘１：ADD TO ではなく ADD が正しい
指摘２：BEFORE ではなくAFTERが正しい

# 社員テーブルのテーブル定義を変更する
ALTER TABLE
	employee
# email列（VARCHAR(255)型）を追加する
ADD
	email VARCHAR(255) NOT NULL
# 追加先はdepart_id列の後方とする
AFTER
	depart_id
;

■返却値
mysql> ALTER TABLE
    -> employee
    -> ADD
    -> email VARCHAR(255) NOT NULL
    -> AFTER
    -> depart_id
    -> ;
Query OK, 0 rows affected (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| s_id        | char(7)      | NO   | PRI |         |       |
| l_name      | varchar(20)  | YES  |     | NULL    |       |
| f_name      | varchar(20)  | YES  |     | NULL    |       |
| l_name_kana | varchar(100) | YES  |     | NULL    |       |
| f_name_kana | varchar(100) | YES  |     | NULL    |       |
| sex         | smallint     | YES  |     | NULL    |       |
| class       | varchar(20)  | YES  |     | NULL    |       |
| depart_id   | char(3)      | YES  |     | NULL    |       |
| email       | varchar(255) | NO   |     | NULL    |       |
| b_id        | char(7)      | YES  |     | NULL    |       |
| last_update | date         | YES  |     | NULL    |       |
| retired     | smallint     | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
12 rows in set (0.04 sec)