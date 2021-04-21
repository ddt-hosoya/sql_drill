■問題
アクセス記録テーブル（access_log）からリンク元ごとのアクセス数を求め、
10件未満を「C」、10件以上50件未満を「B」、50件以上を「A」とするランク列を取得してみましょう。
また、データはアクセス数が3件以上の物を多い順に並べるものとします。
■実行文
# リンク元、リンク元ごとのアクセス数、アクセス数に応じたランク付けを出力
SELECT
	referer,
	COUNT(*) AS アクセス数,
	CASE
		WHEN COUNT(*) < 10 THEN 'C'
		WHEN COUNT(*) <50 THEN 'B'
		ELSE 'A'
	END AS ランク
# アクセス記録テーブルから取得
FROM
	access_log
# リンク元ごとに集計する
GROUP BY
	referer
# アクセス数が3件以上のもののみ出力する
HAVING
	COUNT(*) >= 3
# アクセス数が多い順に出力する
ORDER BY
	COUNT(*) DESC
;

■返却値
mysql> SELECT
    -> referer,
    -> COUNT(*) AS アクセス数,
    -> CASE
    -> WHEN COUNT(*) < 10 THEN 'C'
    -> WHEN COUNT(*) <50 THEN 'B'
    -> ELSE 'A'
    -> END AS ランク
    -> FROM
    -> access_log
    -> GROUP BY
    -> referer
    -> HAVING
    -> COUNT(*) >= 3
    -> ORDER BY
    -> COUNT(*) DESC
    -> ;
+---------------------------+------------+--------+
| referer                   | アクセス数 | ランク |
+---------------------------+------------+--------+
| http://wings.msn.to/hamu/ |        100 | A      |
| http://wings.msn.to/neko/ |         11 | B      |
| http://wings.msn.to/saru/ |          4 | C      |
| http://wings.msn.to/inu/  |          3 | C      |
| http://wings.msn.to/tori/ |          3 | C      |
| http://wings.msn.to/kame/ |          3 | C      |
+---------------------------+------------+--------+
6 rows in set (0.00 sec)

mysql>