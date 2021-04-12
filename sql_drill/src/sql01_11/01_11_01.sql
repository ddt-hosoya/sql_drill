■問題
アンケート回答テーブル（quest）から都道府県別の評価の平均値を求めてみましょう。
その際平均値は小数点以下を四捨五入します。以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	prefecture,
	[空欄①] AS 評価平均
FROM
	quest
GROUP by
	[空欄②]
;

■実行文
# 都道府県別の評価の平均値(小数点以下を四捨五入)を取得
SELECT
	prefecture,
	ROUND(AVG(answer1)) AS 評価平均
# アンケート回答テーブルから取得
FROM
	quest
# 都道府県別に値を算出
GROUP by
	prefecture
;

■返却値
mysql> SELECT
    -> prefecture,
    -> ROUND(AVG(answer1)) AS 評価平均
    -> FROM
    -> quest
    -> GROUP by
    -> prefecture
    -> ;
+------------+----------+
| prefecture | 評価平均 |
+------------+----------+
| 東京都     |        2 |
| 神奈川県   |        2 |
| 茨城県     |        2 |
| 千葉県     |        3 |
| 埼玉県     |        3 |
+------------+----------+
5 rows in set (0.01 sec)