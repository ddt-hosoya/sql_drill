■問題文
社員テーブル（employee）上、社員の氏・名定義をいずれも「VARCHAR(50) NULLを許可しない」に変更してみましょう。
以下の空欄を埋めて、SQL命令を完成させてください。
ALTER TABLE
	[空欄①]
[空欄②]
	l_name VARCHAR(50) NOT NULL,
[空欄③]
;
■実行文
# 社員テーブル定義を変更する
ALTER TABLE
	employee
# 社員の氏の列定義をVARCHAR(50) NULLを許可しないに変更する
MODIFY
	l_name VARCHAR(50) NOT NULL,
# 社員の名の列定義をVARCHAR(50) NULLを許可しないに変更する
MODIFY
	f_name VARCHAR(50) NOT NULL
;

■返却値
【Before】
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
12 rows in set (0.00 sec)

【After】
mysql> ALTER TABLE
    -> employee
    -> MODIFY
    -> l_name VARCHAR(50) NOT NULL,
    -> MODIFY
    -> f_name VARCHAR(50) NOT NULL
    -> ;
Query OK, 0 rows affected (0.27 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| s_id        | char(7)      | NO   | PRI |         |       |
| l_name      | varchar(50)  | NO   |     | NULL    |       |
| f_name      | varchar(50)  | NO   |     | NULL    |       |
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
12 rows in set (0.01 sec)