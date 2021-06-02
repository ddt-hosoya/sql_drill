■問題文
店舗テーブル（shop）と月間売上テーブル（sales）から
2012年12月の売上高が店舗売上平均（2012年12月の平均）を下回っている店舗名とその売上高をあげてみましょう。

■実行文
#店舗名とその売上高を取得
SELECT
	sh.s_name,
	sa.s_value
# 月間売上テーブルに店舗テーブルを結合する
FROM
	sales AS sa
INNER JOIN
	shop AS sh
# 月間売上テーブルに店舗テーブルを結合する結合条件は店舗コードが一致していること
ON
	sh.s_id = sa.s_id
# 2012年12月の売上高が店舗売上平均（2012年12月の平均）を下回っている場合取得
WHERE
	sa.s_value
	<
	(
		SELECT
			AVG(s_value)
		FROM
			sales
		WHERE
			s_date='2012-12'
	)
AND
	sa.s_date='2012-12'
;

■返却値
mysql> SELECT
    -> sh.s_name,
    -> sa.s_value
    -> FROM
    -> sales AS sa
    -> INNER JOIN
    -> shop AS sh
    -> ON
    -> sh.s_id = sa.s_id
    -> WHERE
    -> sa.s_value
    -> <
    -> (
    -> SELECT
    -> AVG(s_value)
    -> FROM
    -> sales
    -> WHERE
    -> s_date='2012-12'
    -> )
    -> AND
    -> sa.s_date='2012-12'
    -> ;
+------------+---------+
| s_name     | s_value |
+------------+---------+
| 東桜町店   |    9861 |
| 北花町東店 |   10456 |
+------------+---------+
2 rows in set (0.00 sec)