■問題文
ユーザーテーブル（usr）のf_name_kana列の後方に以下の列を追加してみましょう。
・sex列（VARCHAR(5)型、デフォルト値は男）
・job列（VARCHAR(30)型）

■実行文
# ユーザーテーブルの定義を変更する
ALTER TABLE
	usr
# sex列（VARCHAR(5)型、デフォルト値は男）を追加する
ADD
	sex VARCHAR(5) DEFAULT '男' NOT NULL
# sex列の追加先はf_name_kana列の後方とする
AFTER
	f_name_kana,
# job列（VARCHAR(30)型）を追加する
ADD
	job VARCHAR(30)
# job列の追加先はsex列の後方とする
AFTER
	sex
;


■返却値
mysql> ALTER TABLE
    -> usr
    -> ADD
    -> sex VARCHAR(5) DEFAULT '男' NOT NULL
    -> AFTER
    -> f_name_kana,
    -> ADD
    -> job VARCHAR(30)
    -> AFTER
    -> sex
    -> ;
Query OK, 0 rows affected (0.32 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc usr;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| user_id     | char(7)      | NO   | PRI |         |       |
| l_name      | varchar(20)  | YES  |     | NULL    |       |
| f_name      | varchar(20)  | YES  |     | NULL    |       |
| l_name_kana | varchar(100) | YES  |     | NULL    |       |
| f_name_kana | varchar(100) | YES  |     | NULL    |       |
| sex         | varchar(5)   | NO   |     | 男      |       |
| job         | varchar(30)  | YES  |     | NULL    |       |
| prefecture  | varchar(15)  | YES  | MUL | NULL    |       |
| city        | varchar(20)  | YES  |     | NULL    |       |
| o_address   | varchar(100) | YES  |     | NULL    |       |
| tel         | varchar(20)  | YES  |     | NULL    |       |
| email       | varchar(255) | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
12 rows in set (0.00 sec)
