■問題文
社員テーブル（employee）上、名前が「山田 奈美」さんの役職を「主任」に、最終更新日を今日の日付にしてみましょう。
空欄を埋めて、SQL命令を完成させてください。
UPDATE
	employee
SET
	[空欄①],
	[空欄②]
WHERE
	[空欄③]
;

■実行文
# 社員テーブルを更新する
UPDATE
	employee
# 役職を主任に更新し、最終更新日も本日の日付に更新する
SET
	class = '主任',
	last_update = CURRENT_DATE
# 山田奈美さんのレコードのみ更新する
WHERE
	l_name = '山田' and f_name = '奈美'
;

■返却値
mysql> UPDATE
    -> employee
    -> SET
    -> class = '主任',
    -> last_update = CURRENT_DATE
    -> WHERE
    -> l_name = '山田' and f_name = '奈美'
    -> ;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

【Before】
mysql> select * from employee where s_id='YA00001';
+---------+--------+--------+-------------+-------------+------+------------+-----------+---------+-------------+---------+
| s_id    | l_name | f_name | l_name_kana | f_name_kana | sex  | class      | depart_id | b_id    | last_update | retired |
+---------+--------+--------+-------------+-------------+------+------------+-----------+---------+-------------+---------+
| YA00001 | 山田   | 奈美   | ヤマダ      | ナミ        |    2 | マネージャ | S01       | SA00001 | 2012-10-15  |       0 |
+---------+--------+--------+-------------+-------------+------+------------+-----------+---------+-------------+---------+
1 row in set (0.00 sec)

【After】
mysql> select * from employee where s_id='YA00001';
+---------+--------+--------+-------------+-------------+------+-------+-----------+---------+-------------+---------+
| s_id    | l_name | f_name | l_name_kana | f_name_kana | sex  | class | depart_id | b_id    | last_update | retired |
+---------+--------+--------+-------------+-------------+------+-------+-----------+---------+-------------+---------+
| YA00001 | 山田   | 奈美   | ヤマダ      | ナミ        |    2 | 主任  | S01       | SA00001 | 2021-06-14  |       0 |
+---------+--------+--------+-------------+-------------+------+-------+-----------+---------+-------------+---------+
1 row in set (0.00 sec)