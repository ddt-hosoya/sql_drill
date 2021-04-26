■問題文
ユーザテーブル（usr）と貸し出し記録テーブル（rental）から、ユーザごとの貸し出し数を、貸し出し数が多い順に取得してみましょう。
取得列は、ユーザの氏名と貸し出し件数とし、貸し出し件数が０のユーザも出力するものとします。以下の空欄を埋めて、SQL命令を完成させましょう。
SELECT
	u.l_name,
	u.f_name,
	COUNT(r.id)
FROM
	rental AS r
[空欄①]
	usr AS u
ON
	[空欄②]
GROUP BY
	[空欄③]
ORDER BY
	[空欄④]
;
■実行文
# ユーザテーブルに存在するすべての氏名とユーザごとの貸し出し件数を出力
SELECT
	u.l_name,
	u.f_name,
	COUNT(r.id)
# 貸出記録テーブルとユーザテーブルを右外部結合したデータから出力
FROM
	rental AS r
RIGHT JOIN
	usr AS u
# 貸出記録テーブルとユーザテーブルを右外部結合する条件はユーザIDが一致すること
ON
	r.user_id = u.user_id
# ユーザIDごとに集計
GROUP BY
	r.user_id
# 貸し出し件数の多い順に出力
ORDER BY
	COUNT(r.id) DESC
;

■返却値

mysql> SELECT
    -> u.l_name,
    -> u.f_name,
    -> COUNT(r.id)
    -> FROM
    -> rental AS r
    -> RIGHT JOIN
    -> usr AS u
    -> ON
    -> r.user_id = u.user_id
    -> GROUP BY
    -> r.user_id
    -> ORDER BY
    -> COUNT(r.id) DESC
    -> ;
+--------+--------+-------------+
| l_name | f_name | COUNT(r.id) |
+--------+--------+-------------+
| 河合   | 泰治   |           3 |
| 木下   | 一樹   |           2 |
| 吉岡   | 遥     |           2 |
| 松本   | 博美   |           2 |
| 南     | 沙恵   |           2 |
| 森本   | 絵里   |           2 |
| 西島   | 文子   |           2 |
| 井上   | 一郎   |           1 |
| 上原   | 幸一   |           1 |
| 江本   | 聡     |           1 |
| 小野   | 雄二   |           1 |
| 山田   | 太郎   |           1 |
| 坂口   | 駿     |           1 |
| 井上   | 一郎   |           1 |
| 有木   | 茉莉   |           1 |
| 和田   | 修子   |           1 |
| 根岸   | 裕子   |           1 |
| 久保田 | 守     |           0 |
+--------+--------+-------------+
18 rows in set (0.04 sec)

mysql>