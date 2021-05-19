■問題文
所属部署テーブル（depart）から社員テーブル（employee）で使われていない部署コード、部署名を取り出しましょう。
以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	depart_id,
	depart_name
FROM
	[空欄①]
WHERE
	[空欄②]
	(
	SELECT
		*
	FROM
		employee
	WHERE
		[空欄③]
	)
;
■実行文
# 部署コード、部署名を取得
SELECT
	depart_id,
	depart_name
# 所属部署テーブルから取得
FROM
	depart
# 社員テーブルの部署コードにない所属部署テーブルの部署コードがあれば取得する
WHERE
	NOT EXISTS
	(
	SELECT
		*
	FROM
		employee
	WHERE
		employee.depart_id  = depart.depart_id
	)
;
■返却値

mysql> SELECT
    -> depart_id,
    -> depart_name
    -> FROM
    -> depart
    -> WHERE
    -> NOT EXISTS
    -> (
    -> SELECT
    -> *
    -> FROM
    -> employee
    -> WHERE
    -> employee.depart_id  = depart.depart_id
    -> )
    -> ;
+-----------+-------------+
| depart_id | depart_name |
+-----------+-------------+
| E02       | 第二営業部  |
+-----------+-------------+
1 row in set (0.01 sec)