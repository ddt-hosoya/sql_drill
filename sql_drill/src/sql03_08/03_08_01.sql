■問題文
所属部署テーブル（depart）にない所属部署に属する社員を社員テーブル（employee）から削除してください。
以下の空欄を埋めて、SQL命令を完成させてください。

[空欄①]
	employee
WHERE
	depart_id
[空欄②]
	(
		SELECT
			depart_id
		FROM
			[空欄③]
	)
;

■実行文
# 社員テーブルからデータを削除する
DELETE FROM
	employee
# 所属部署が所属部署テーブルにない部署の場合のみ削除する
WHERE
	depart_id
NOT IN
	(
		SELECT
			depart_id
		FROM
			depart
	)
;

■返却値
mysql> DELETE FROM
    -> employee
    -> WHERE
    -> depart_id
    -> NOT IN
    -> (
    -> SELECT
    -> depart_id
    -> FROM
    -> depart
    -> )
    -> ;
Query OK, 2 rows affected (0.05 sec)

【Before】
mysql> select count(*) from employee;
+----------+
| count(*) |
+----------+
|       26 |
+----------+
1 row in set (0.00 sec)

mysql> select * from employee where depart_id not in (select depart_id from depart);
+---------+--------+--------+-------------+-------------+------+--------------+-----------+------+-------------+---------+
| s_id    | l_name | f_name | l_name_kana | f_name_kana | sex  | class        | depart_id | b_id | last_update | retired |
+---------+--------+--------+-------------+-------------+------+--------------+-----------+------+-------------+---------+
| NI00001 | 西     | 雄一   | ニシ        | ユウイチ    |    1 | アシスタント | Z99       | NULL | 2013-01-10  |       0 |
| NI00002 | 新渡戸 | 康治   | ニトベ      | コウジ      |    1 | アシスタント | Z99       | NULL | 2013-01-15  |       0 |
+---------+--------+--------+-------------+-------------+------+--------------+-----------+------+-------------+---------+
2 rows in set (0.06 sec)

【After】
mysql> select count(*) from employee;
+----------+
| count(*) |
+----------+
|       24 |
+----------+
1 row in set (0.00 sec)

mysql> select * from employee where depart_id not in (select depart_id from depart);
Empty set (0.00 sec)