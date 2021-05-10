■問題文
店舗テーブル（shop）と月間売上テーブル（sales）から2012年12月の売り上げを売上高の高い順に出力してみましょう。
SELECT
	sh.s_name,
	sl.s_value
FROM
	[空欄①]
INNER JOIN
	[空欄②]
ON
	[空欄③]
WHERE
	[空欄④]
ORDER BY
	[空欄⑤]
;
■実行文
# 対象のテーブルから店舗名と2012年12月の売上高を出力
SELECT
	sh.s_name,
	sl.s_value
# 対象のテーブルは店舗テーブルに月間売上テーブルを内部結合したもの
FROM
	shop AS sh
INNER JOIN
	sales AS sl
# 店舗テーブルに月間売上テーブルを内部結合する条件は店舗IDが一致すること
ON
	sh.s_id = sl.s_id
# 月が2012年12のデータのみを出力
WHERE
	sl.s_date = '2012-12'
# 売上高が高い順に出力
ORDER BY
	sl.s_value DESC
;
■返却値
mysql> SELECT
    -> sh.s_name,
    -> sl.s_value
    -> FROM
    -> shop AS sh
    -> INNER JOIN
    -> sales AS sl
    -> ON
    -> sh.s_id = sl.s_id
    -> WHERE
    -> sl.s_date = '2012-12'
    -> ORDER BY
    -> sl.s_value DESC
    -> ;
+--------------+---------+
| s_name       | s_value |
+--------------+---------+
| 北花町駅前店 |   11234 |
| 三吉町店     |   11145 |
| 北花町東店   |   10456 |
| 東桜町店     |    9861 |
+--------------+---------+
4 rows in set (0.01 sec)