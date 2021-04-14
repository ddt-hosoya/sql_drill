■問題
アンケート回答テーブル（quest）から都道府県ごとに年齢の平均値を求め、35歳以上50歳未満のデータのみを取り出してみましょう。
以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	[空欄①]
FROM
	quest
GROUP by
	prefecture
HAVING
	[空欄②]
;
■実行文
# 都道府県ごとの年齢の平均値を取得
SELECT
	prefecture,
	AVG(age)
# アンケート回答テーブルから取得
FROM
	quest
# 都道府県ごとに集計する
GROUP by
	prefecture
# 都道府県ごとに集計した年齢の平均値が35歳以上50歳未満の条件に当てはまる場合のみ取得
HAVING
	AVG(age) >= 35
	AND
	AVG(age) < 50
;

■返却値
mysql> SELECT
    -> prefecture,
    -> AVG(age)
    -> FROM
    -> quest
    -> GROUP by
    -> prefecture
    -> HAVING
    -> AVG(age) >= 35
    -> AND
    -> AVG(age) < 50
    -> ;
+------------+----------+
| prefecture | AVG(age) |
+------------+----------+
| 茨城県     |  38.6667 |
+------------+----------+
1 row in set (0.00 sec)