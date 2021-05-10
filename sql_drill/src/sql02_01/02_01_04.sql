■問題文
貸出記録テーブル（rental）とユーザテーブル（usr）からそれぞれのユーザについて、現在何冊貸出ているかを、貸出数の多い順に取得してみましょう。
取得列は、ユーザの氏名、貸し出し数とします。また、貸し出し数0のユーザは出力する必要はありません。

■実行文
# 対象のテーブルからユーザの氏名とユーザごとに集計した貸し出し数を出力
SELECT
	CONCAT(u.l_name, u.f_name) AS 氏名,
	COUNT(r.user_id) AS 貸し出し数
# 対象のテーブルはユーザテーブルに貸出記録テーブルを内部結合したもの
FROM
	usr AS u
INNER JOIN
	rental AS r
# ユーザテーブルに貸出記録テーブルを内部結合する条件はユーザIDが一致すること
ON
	r.user_id = u.user_id
# 貸し出し中のデータのみを集計対象とする
WHERE
	r.returned = 0
# ユーザIDごとに集計する
GROUP BY
	r.user_id
# 貸し出し数の多い順に出力
ORDER BY
	COUNT(r.user_id)  DESC
;
■返却値
mysql> SELECT
    -> CONCAT(u.l_name, u.f_name) AS 氏名,
    -> COUNT(r.user_id) AS 貸し出し数
    -> FROM
    -> usr AS u
    -> INNER JOIN
    -> rental AS r
    -> ON
    -> r.user_id = u.user_id
    -> WHERE
    -> r.returned = 0
    -> GROUP BY
    -> r.user_id
    -> ORDER BY
    -> COUNT(r.user_id)  DESC
    -> ;
+----------+------------+
| 氏名     | 貸し出し数 |
+----------+------------+
| 西島文子 |          2 |
| 河合泰治 |          2 |
| 上原幸一 |          1 |
| 和田修子 |          1 |
| 森本絵里 |          1 |
| 根岸裕子 |          1 |
| 吉岡遥   |          1 |
| 松本博美 |          1 |
+----------+------------+
8 rows in set (0.01 sec)