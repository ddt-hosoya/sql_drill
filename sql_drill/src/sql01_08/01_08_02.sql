■問題
アンケート回答テーブル（quest）から回答日付が新しい物を先頭から10件取り出してみましょう。
取得列は、name, answer1, answer2列とします。以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	name,
	answer1,
	answer2
FROM
	quest
ORDER BY
	[①空欄]
LIMIT
	[②空欄],10
;

■実行文
# name, answer1, answer2列を取得
SELECT
	name,
	answer1,
	answer2
# アンケート回答テーブルから取得
FROM
	quest
# 回答日付が新しい順に並べる
ORDER BY
	answered DESC
# 取得する行は先頭から10件
LIMIT
	0, 10
;


■返却値
mysql> # name, answer1, answer2列を取得
mysql> SELECT
    -> name,
    -> answer1,
    -> answer2
    -> # アンケート回答テーブルから取得
    -> FROM
    -> quest
    -> # 回答日付が新しい順に並べる
    -> ORDER BY
    -> answered DESC
    -> # 取得する行は先頭から10件
    -> LIMIT
    -> 0, 10
    -> ;
+------------+---------+------------------+
| name       | answer1 | answer2          |
+------------+---------+------------------+
| 根岸亜由美 |       3 | 絵がかわいい。   |
| 西島泰治   |       3 | 読みやすいです。 |
| 森本雄二   |       1 | NULL             |
| 村井聡     |       3 | 文字が小さい。   |
| 南幸一     |       2 |                  |
| 清水一郎   |       2 | NULL             |
| 和田駿     |       1 | NULL             |
| 吉岡毅     |       3 | NULL             |
| 有木守     |       3 | 買ってよかった。 |
| 矢口一樹   |       2 | NULL             |
+------------+---------+------------------+
10 rows in set (0.00 sec)