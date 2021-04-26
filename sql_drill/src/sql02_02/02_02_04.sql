■問題文
社員テーブル（employee）とタイムカードテーブル（time_card）を結合し、
社員ごとの勤務時間平均を平均時間の多い順に出力してみましょう。その際、タイムカードへの記録がない社員の情報についても出力することにします。
出力列は社員氏名、勤務時間平均です。

■実行文
#社員氏名と社員ごとの勤務時間平均を出力
SELECT
	CONCAT(e.l_name, e.f_name) AS 社員氏名,
	SUM(t.work_time) / COUNT(t.s_id) AS 勤務時間平均
# 社員テーブルとタイムカードテーブルを左外部結合したデータから取得する
FROM
	employee AS e
LEFT JOIN
	time_card AS t
# 社員テーブルとタイムカードテーブルを左外部結合する条件は社員IDが一致すること
ON
	e.s_id = t.s_id
# 社員IDごとに集計する
GROUP BY
	t.s_id
# 勤務平均時間が多い順に出力
ORDER BY
	SUM(t.work_time) / COUNT(t.s_id) DESC
;
■返却値

mysql> SELECT
    -> CONCAT(e.l_name, e.f_name) AS 社員氏名,
    -> SUM(t.work_time) / COUNT(t.s_id) AS 勤務時間平均
    -> FROM
    -> employee AS e
    -> LEFT JOIN
    -> time_card AS t
    -> ON
    -> e.s_id = t.s_id
    -> GROUP BY
    -> t.s_id
    -> ORDER BY
    -> SUM(t.work_time) / COUNT(t.s_id) DESC
    -> ;
+------------+--------------+
| 社員氏名   | 勤務時間平均 |
+------------+--------------+
| 川口裕子   |       8.5476 |
| 神田佐知子 |       8.5476 |
| 葉山俊輔   |       8.5238 |
| 野上利江   |       8.5238 |
| 田中真由子 |       8.5238 |
| 大門一郎   |       8.5000 |
| 藤岡幸太郎 |       8.5000 |
| 木村一郎   |       8.5000 |
| 中澤康代   |       8.5000 |
| 藤井雄太   |       8.4762 |
| 加藤昭雄   |       8.4762 |
| 清水春子   |       8.4762 |
| 田辺正一   |       8.4762 |
| 戸川よしみ |       8.4762 |
| 津村知美   |       8.4762 |
| 相沢聡     |         NULL |
+------------+--------------+
16 rows in set (0.06 sec)