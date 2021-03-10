■問題
アンケート集計テーブル（quest）から回答日時が「2013-01-01」以降の情報のみを取り出してみましょう。
取り出す列は、 name, answer1, answer2 列とします。

■実行文
# name, answer1, answer2 列を取り出す
SELECT
	name,
	answer1,
	answer2
# アンケート集計テーブルから取得
FROM
	quest
# 回答日時が「2013-01-01」以降の情報のみ取得
WHERE
	answered >= '2013-01-01'
;

■返却値
mysql> SELECT
    -> name,
    -> answer1,
    -> answer2
    -> FROM
    -> quest
    -> WHERE
    -> answered >= '2013-01-01'
    -> ;
+------------+---------+------------------+
| name       | answer1 | answer2          |
+------------+---------+------------------+
| 森本雄二   |       1 | NULL             |
| 西島泰治   |       3 | 読みやすいです。 |
| 根岸亜由美 |       3 | 絵がかわいい。   |
+------------+---------+------------------+
3 rows in set (0.01 sec)