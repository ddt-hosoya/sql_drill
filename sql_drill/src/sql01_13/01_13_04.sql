■問題
著者ー書籍情報テーブル（author_books）で、著者ごとの書籍数を求めてみましょう。
その際、書籍数が４冊以上の著者は「多い」、２冊以上4冊未満の著者は「普通」、２冊未満の著者は「少ない」と出力します。
また、出力列の名前は先頭から「著者ID」「カウント数」「評価」とします。
■実行文
# author_id,author_idごとの書籍数、書籍数に応じた評価を、「著者ID」「カウント数」「評価」として取得
SELECT
	author_id AS 著者ID,
	COUNT(*) AS カウント数,
	CASE
		WHEN COUNT(*) >= 4 THEN '多い'
		WHEN COUNT(*) >= 2 THEN '普通'
		ELSE '少ない'
	END AS 評価
# 著者ー書籍情報テーブルから取得
FROM
	author_books
# 著者ごとに集計する
GROUP BY
	author_id
;

■返却値
mysql> SELECT
    -> author_id AS 著者ID,
    -> COUNT(*) AS カウント数,
    -> CASE
    -> WHEN COUNT(*) >= 4 THEN '多い'
    -> WHEN COUNT(*) >= 2 THEN '普通'
    -> ELSE '少ない'
    -> END AS 評価
    -> FROM
    -> author_books
    -> GROUP BY
    -> author_id
    -> ;
+--------+------------+--------+
| 著者ID | カウント数 | 評価   |
+--------+------------+--------+
| Y0001  |          2 | 普通   |
| A0001  |          1 | 少ない |
| M0001  |          1 | 少ない |
| Y0002  |          4 | 多い   |
| S0001  |          1 | 少ない |
| K0001  |          1 | 少ない |
| T0001  |          1 | 少ない |
+--------+------------+--------+
7 rows in set (0.00 sec)