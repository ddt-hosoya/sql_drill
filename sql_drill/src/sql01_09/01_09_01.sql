■問題
アンケート回答テーブル（quest）から性別ごとにそれぞれの年齢の最大/最小値を取り出してみましょう。
以下の空欄を埋めて、SQL命令を完成させてください。
SELECT
	[空欄①]
FROM
	quest
[空欄②]
	sex
;

■実行文
# 性別、年齢の最大値、年齢の最小値を取得
SELECT
	sex,
	MAX(age),
	MIN(age)
# アンケート回答テーブルから取得
FROM
	quest
# 性別ごとに取得
GROUP BY
	sex
;

■返却値
mysql> SELECT
    -> sex,
    -> MAX(age),
    -> MIN(age)
    -> FROM
    -> quest
    -> GROUP BY
    -> sex
    -> ;
+-----+----------+----------+
| sex | MAX(age) | MIN(age) |
+-----+----------+----------+
| 男  |       64 |       18 |
| 女  |       40 |       25 |
+-----+----------+----------+
2 rows in set (0.02 sec)