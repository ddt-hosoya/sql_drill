■問題文
社員テーブル（employee）と所属部署テーブル（depart）を結合し、所属社員が1人もいない「幽霊」部署を洗い出してみましょう。
以下の空欄を埋めてSQL命令を完成させましょう。
SELECT
	d.depart_id,
	d.depart_name
FROM
	depart AS d
[空欄①]
	employee AS e
ON
	[空欄②]
WHERE
	[空欄③]
;
■実行文
# 部署IDと部署名を出力
SELECT
	d.depart_id,
	d.depart_name
# 所属部署テーブルと社員テーブルを左外部結合したデータから取得する
FROM
	depart AS d
LEFT JOIN
	employee AS e
# 所属部署テーブルと社員テーブルを左外部結合する条件は部署IDが一致すること
ON
	d.depart_id = e.depart_id
# 外部結合したデータで社員テーブルに一致するデータがなかった部署IDのみ出力
WHERE
	e.depart_id IS NULL
;
■返却値
mysql> SELECT
    -> d.depart_id,
    -> d.depart_name
    -> FROM
    -> depart AS d
    -> LEFT JOIN
    -> employee AS e
    -> ON
    -> d.depart_id = e.depart_id
    -> WHERE
    -> e.depart_id IS NULL
    -> ;
+-----------+-------------+
| depart_id | depart_name |
+-----------+-------------+
| E02       | 第二営業部  |
+-----------+-------------+
1 row in set (0.04 sec)