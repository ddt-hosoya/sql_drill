■問題文
問1のSQL命令を相関サブクエリを使って書き換えてみましょう。

[空欄①]
	employee
SET
	depart_id='Z99'
WHERE
	[空欄②]
	(
		SELECT
		*
		FROM
			depart
		WHERE
			[空欄③]
	)
;

■実行文
# 社員テーブルを更新する
UPDATE
	employee
# 所属部署コードを「Z99（未登録）」に変更
SET
	depart_id='Z99'
# 所属部署テーブル（depart）にない所属部署を更新する
WHERE
	NOT EXISTS
	(
		SELECT
		*
		FROM
			depart
		WHERE
			depart.depart_id = employee.depart_id
	)
;


■返却値
mysql> # 社員テーブルを更新する
mysql> UPDATE
    -> employee
    -> # 所属部署コードを「Z99（未登録）」に変更
    -> SET
    -> depart_id='Z99'
    -> # 所属部署テーブル（depart）にない所属部署を更新する
    -> WHERE
    -> NOT EXISTS
    -> (
    -> SELECT
    -> *
    -> FROM
    -> depart
    -> WHERE
    -> depart.depart_id = employee.depart_id
    -> )
    -> ;
Query OK, 2 rows affected (0.06 sec)
Rows matched: 2  Changed: 2  Warnings: 0

【Before】
mysql> select s_id,depart_id from employee where depart_id not in (select depart_id from depart);
+---------+-----------+
| s_id    | depart_id |
+---------+-----------+
| NI00001 | B01       |
| NI00002 | B01       |
+---------+-----------+
2 rows in set (0.01 sec)

【After】
mysql> select s_id,depart_id from employee where depart_id not in (select depart_id from depart);
+---------+-----------+
| s_id    | depart_id |
+---------+-----------+
| NI00001 | Z99       |
| NI00002 | Z99       |
+---------+-----------+
2 rows in set (0.00 sec)