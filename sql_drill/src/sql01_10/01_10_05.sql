■問題
以下はアンケート回答テーブル（quest）から都道府県、性別ごとに評価平均を求める為のSQL命令ですが、
2点誤りがあります。誤りを指摘してください。
SELECT
	prefecture,
	sex,
	age,
	AVG(answer1) IS 評価平均
FROM
	quest
GROUP BY
	prefecture,
	sex
;
■指摘・実行文
指摘１：別名を設定する場合はISではなくASを使用する必要がある
指摘２：グループ化を行う場合取得列には集計対象となる列しか指定できないためageは取得列に指定できない

# 都道府県、性別ごとに評価平均値を評価平均と別名をつけ取得
SELECT
	prefecture,
	sex,
	AVG(answer1) AS 評価平均
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
    -> AVG(answer1) AS 評価平均
    -> FROM
    -> quest
    -> GROUP BY
    -> prefecture,
    -> sex
    -> ;
+------------+-----+----------+
| prefecture | sex | 評価平均 |
+------------+-----+----------+
| 東京都     | 男  |   1.6000 |
| 神奈川県   | 女  |   2.0000 |
| 茨城県     | 女  |   1.0000 |
| 東京都     | 女  |   3.0000 |
| 茨城県     | 男  |   2.5000 |
| 千葉県     | 男  |   3.0000 |
| 埼玉県     | 男  |   3.0000 |
| 神奈川県   | 男  |   2.5000 |
| 千葉県     | 女  |   3.0000 |
+------------+-----+----------+
9 rows in set (0.00 sec)