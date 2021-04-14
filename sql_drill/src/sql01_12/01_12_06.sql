■問題
アクセス記録テーブル（access_log）からアクセス日付が2013/01/01以降のものについて、
リンク元URLごとにアクセス数を算出してみましょう。その際アクセス数が５件未満のもののみアクセス数降順で出力してください。
以下の空欄を埋めて、SQL命令を完成させてみましょう。
SELECT
	referer,
	[空欄①]
FROM
	access_log
WHERE
	[空欄②]
GROUP BY
	referer
[空欄③]
	[空欄①] < 5
ORDER BY
	[空欄①] [空欄④]
;

■実行文
# リンク元URLとリンク元URLごとに集計したアクセス数を取得
SELECT
	referer,
	COUNT(*) AS アクセス数
# アクセス記録テーブルからデータを取得
FROM
	access_log
# 集計するデータはアクセス日付が2013/01/01以降という条件に当てはまるデータのみ
WHERE
	access_date >=  '2013-01-01'
# リンク元URLごとに集計
GROUP BY
	referer
# リンク元URLごとにアクセス数を算出しアクセス数が５件未満のもののみ出力
HAVING
	COUNT(*) < 5
# アクセス数降順で出力
ORDER BY
	COUNT(*) DESC
;
■返却値

mysql> SELECT
    -> referer,
    -> COUNT(*) AS アクセス数
    -> FROM
    -> access_log
    -> WHERE
    -> access_date >=  '2013-01-01'
    -> GROUP BY
    -> referer
    -> HAVING
    -> COUNT(*) < 5
    -> ORDER BY
    -> COUNT(*) DESC
    -> ;
+---------------------------+------------+
| referer                   | アクセス数 |
+---------------------------+------------+
| http://wings.msn.to/neko/ |          3 |
| http://wings.msn.to/tori/ |          1 |
| http://wings.msn.to/saru/ |          1 |
| http://wings.msn.to/kame/ |          1 |
+---------------------------+------------+
4 rows in set (0.04 sec)