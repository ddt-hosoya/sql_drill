■問題文
書籍情報テーブル（books）に対して、pages列（INT型、デフォルト値0）、rating列（CHAR(1)型、デフォルトは’B’）を新たに追加してみましょう。
追加先はテーブル定義の一番最後とします。空欄を埋めて、SQL命令を完成させてください。
[空欄①]
	books
ADD
	[空欄②],
ADD
	rating CHAR(1) DEFAULT 'B' NOT NULL
AFTER
	[空欄③]
;
■実行文
# 書籍情報テーブルのテーブル定義を変更する
ALTER TABLE
	books
# pages列（INT型、デフォルト値0）を追加する
ADD
	pages INT DEFAULT 0 NOT NULL,
# rating列（CHAR(1)型、デフォルトは’B’）を追加する
ADD
	rating CHAR(1) DEFAULT 'B' NOT NULL
# 追加先はテーブル定義の一番最後（category_idの後）とする
AFTER
	category_id
;

■返却値
mysql> ALTER TABLE
    -> books
    -> ADD
    -> pages INT DEFAULT 0 NOT NULL,
    -> ADD
    -> rating CHAR(1) DEFAULT 'B' NOT NULL
    -> AFTER
    -> category_id
    -> ;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>  desc books;
+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| isbn         | char(17)     | NO   | PRI | NULL    |       |
| title        | varchar(255) | YES  |     | NULL    |       |
| price        | int          | YES  |     | NULL    |       |
| publish      | varchar(30)  | YES  |     | NULL    |       |
| publish_date | date         | YES  |     | NULL    |       |
| category_id  | char(5)      | YES  |     | NULL    |       |
| rating       | char(1)      | NO   |     | B       |       |
| pages        | int          | NO   |     | 0       |       |
+--------------+--------------+------+-----+---------+-------+
8 rows in set (0.00 sec)