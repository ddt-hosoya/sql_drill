■問題文
問1のSQL命令を相関サブクエリを使って書き換えてみましょう。
DELETE FROM
	employee
WHERE
	[空欄①]
	(
		SELECT
			depart.depart_id
		FROM
			[空欄②]
		WHERE
			[空欄③]
	)
;

■実行文
# 社員テーブルからデータを削除する
DELETE FROM
	employee
# 所属部署が所属部署テーブルにない部署の場合のみ削除する
WHERE
	NOT EXISTS
	(
		SELECT
			depart.depart_id
		FROM
			depart
		WHERE
			depart.depart_id=employee.depart_id
	)
;

■返却値
mysql> # 社員テーブルからデータを削除する
mysql> DELETE FROM
    -> employee
    -> # 所属部署が所属部署テーブルにない部署の場合のみ削除する
    -> WHERE
    -> NOT EXISTS
    -> (
    -> SELECT
    -> depart.depart_id
    -> FROM
    -> depart
    -> WHERE
    -> depart.depart_id=employee.depart_id
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
2 rows in set (0.00 sec)

【After】
mysql> select count(*) from employee;
+----------+
| count(*) |
+----------+
|       24 |
+----------+
1 row in set (0.00 sec)

mysql>  select * from employee where depart_id not in (select depart_id from depart);
Empty set (0.00 sec)