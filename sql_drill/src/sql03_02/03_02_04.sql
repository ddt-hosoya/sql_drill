■問題文
以下は、社員テーブル（employee）に対して、表のデータを挿入するためのSQL命令ですが、２点誤りがあります。誤りを指摘してください。
--------------------------------------
【挿入対象のデータ】
項目	：	値
社員コード	：	WA00001
社員名(氏)	：	和田
所属部署コード	：	J01
最終更新日	：	(今日の日付)
--------------------------------------
INSERT into
	employee
(
	s_id
	l_name
	depart_id
	last_update
)
VALUE
(
	'WA00001',
	'和田',
	'J01',
	CURRENT_DATE
)
;

■回答・実行文
指摘１：テーブルの列名を指定する括弧内にカンマが必要
指摘２：VALUEではなくVALUESが正しい

# 社員テーブルにデータを挿入する
INSERT into
	employee
# 挿入する項目は社員コード、社員名（氏）、所属部署コード、最終更新日
(
	s_id,
	l_name,
	depart_id,
	last_update
)
VALUES
(
	'WA00001',
	'和田',
	'J01',
	CURRENT_DATE
)
;

■返却値
mysql> INSERT into
    -> employee
    -> (
    -> s_id,
    -> l_name,
    -> depart_id,
    -> last_update
    -> )
    -> VALUES
    -> (
    -> 'WA00001',
    -> '和田',
    -> 'J01',
    -> CURRENT_DATE
    -> )
    -> ;
Query OK, 1 row affected (0.03 sec)

mysql> select * from employee where s_id='WA00001';
+---------+--------+--------+-------------+-------------+------+-------+-----------+------+-------------+---------+
| s_id    | l_name | f_name | l_name_kana | f_name_kana | sex  | class | depart_id | b_id | last_update | retired |
+---------+--------+--------+-------------+-------------+------+-------+-----------+------+-------------+---------+
| WA00001 | 和田   | NULL   | NULL        | NULL        | NULL | NULL  | J01       | NULL | 2021-06-09  |    NULL |
+---------+--------+--------+-------------+-------------+------+-------+-----------+------+-------------+---------+
1 row in set (0.00 sec)