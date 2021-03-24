■問題
アンケート回答テーブル（quest）から都道府県、性別ごとに本書の評価の平均値を取得してみましょう。
以下の空欄を埋めて、SQL命令を完成させてください。
SELECT
	[空欄①]
FROM
	quest
GROUP BY
	[空欄②]
;
■実行文
# 都道府県、性別、本書の評価の平均値を取得
SELECT
	prefecture,
	sex,
	AVG(answer1)
# アンケート回答テーブルから取得
FROM
	quest
# 都道府県、性別ごとに取得
GROUP BY
	prefecture,
	sex
;

■返却値
mysql> SELECT
    -> prefecture,
    -> sex,
    -> AVG(answer1)
    -> FROM
    -> quest
    -> GROUP BY
    -> prefecture,
    -> sex
    -> ;
+------------+-----+--------------+
| prefecture | sex | AVG(answer1) |
+------------+-----+--------------+
| 東京都     | 男  |       1.6000 |
| 神奈川県   | 女  |       2.0000 |
| 茨城県     | 女  |       1.0000 |
| 東京都     | 女  |       3.0000 |
| 茨城県     | 男  |       2.5000 |
| 千葉県     | 男  |       3.0000 |
| 埼玉県     | 男  |       3.0000 |
| 神奈川県   | 男  |       2.5000 |
| 千葉県     | 女  |       3.0000 |
+------------+-----+--------------+
9 rows in set (0.01 sec)