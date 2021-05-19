■問題文
貸し出し記録テーブル（rental）上を検索し、これまでに一度も書籍の貸し出しを行ったことのないユーザの氏名を（usr）から取り出してみましょう。

■実行文
# ユーザの氏名を取得
SELECT
	CONCAT(l_name, f_name) AS 氏名
# ユーザテーブルから取得
FROM
	usr
# 記録テーブルのユーザコードにないユーザテーブルのユーザコードがあれば取得する
WHERE
	NOT EXISTS
	(
	SELECT
		*
	FROM
		rental
	WHERE
		rental.user_id = usr.user_id
	)
;
■返却値
mysql> SELECT
    -> CONCAT(l_name, f_name) AS 氏名
    -> FROM
    -> usr
    -> WHERE
    -> NOT EXISTS
    -> (
    -> SELECT
    -> *
    -> FROM
    -> rental
    -> WHERE
    -> rental.user_id = usr.user_id
    -> )
    -> ;
+------------+
| 氏名       |
+------------+
| 久保田守   |
| 児玉毅     |
| 矢口亜由美 |
| 村井佐知子 |
+------------+
4 rows in set (0.00 sec)