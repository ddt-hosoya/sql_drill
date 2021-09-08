■問題文
以下は、アクセス記録テーブル（access_log）に対して、既存のreferer列の定義を
「データ型VARCHAR(200)、NULL値を許可」で置き換えるためのSQL命令ですが、
2点誤りがあります。誤りを指摘してください。
ALTER TABLE
	access_log
MODIFY WITH
	referer,VARCHAR(200),NULL
;
■実行文
指摘１：MODIFYの後ろにWITHは不要
指摘２：referer,VARCHAR(200),NULLのカンマではなくスペースが正しい

# アクセス記録テーブルのテーブル定義を変更する
ALTER TABLE
	access_log
# referer列の定義をデータ型VARCHAR(200)、NULL値を許可に変更する
MODIFY
	referer VARCHAR(200) NULL
;
■返却値
【Before】
mysql> desc access_log;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| log_id      | int          | NO   | PRI | NULL    | auto_increment |
| page_id     | char(5)      | YES  |     | NULL    |                |
| referer     | varchar(255) | YES  |     | NULL    |                |
| ip_address  | char(15)     | YES  |     | NULL    |                |
| access_date | datetime     | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
5 rows in set (0.04 sec)


【After】
mysql> # アクセス記録テーブルのテーブル定義を変更する
mysql> ALTER TABLE
    -> access_log
    -> # referer列の定義をデータ型VARCHAR(200)、NULL値を許可に変更する
    -> MODIFY
    -> referer VARCHAR(200) NULL
    -> ;
Query OK, 111 rows affected (0.24 sec)
Records: 111  Duplicates: 0  Warnings: 0

mysql> desc access_log;
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| log_id      | int          | NO   | PRI | NULL    | auto_increment |
| page_id     | char(5)      | YES  |     | NULL    |                |
| referer     | varchar(200) | YES  |     | NULL    |                |
| ip_address  | char(15)     | YES  |     | NULL    |                |
| access_date | datetime     | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+
5 rows in set (0.04 sec)