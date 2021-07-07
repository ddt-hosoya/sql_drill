■問題文
所属部署テーブル（depart）にない所属部署に属する社員を社員テーブル（employee）から抽出し、
所属部署コードを「Z99（未登録）」に変更しましょう。
以下の空欄を埋めて、SQL命令を完成させてください。
UPDATE
	employee
SET
	[空欄①]
WHERE
	depart_id
[空欄②]
	(
		SELECT
			[空欄③]
		FROM
			depart
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
mysql> # 社員テーブルを更新する
mysql> UPDATE
    -> employee
    -> # 所属部署コードを「Z99（未登録）」に変更
    -> SET
    -> depart_id='Z99'
    -> # 所属部署テーブル（depart）にない所属部署を更新する
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
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

【Before】
mysql> select s_id,depart_id from employee where depart_id not in (select depart_id from depart);
+---------+-----------+
| s_id    | depart_id |
+---------+-----------+
| NI00001 | B01       |
| NI00002 | B01       |
+---------+-----------+
2 rows in set (0.03 sec)

【After】
mysql> select s_id,depart_id from employee where depart_id not in (select depart_id from depart);
+---------+-----------+
| s_id    | depart_id |
+---------+-----------+
| NI00001 | Z99       |
| NI00002 | Z99       |
+---------+-----------+
2 rows in set (0.00 sec)