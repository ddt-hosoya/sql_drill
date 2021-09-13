■問題文
ユーザテーブル（usr）とアンケート回答テーブル（quest）からそれぞれ千葉県に住んでいる人間だけを取り出し、結果を統合してみましょう。
その際、重複データを取り除くものとし、かつ、氏名（カナ）について降順で並び変えるものとします。

■実行文
# ユーザテーブルから氏名、氏名（カナ）を取得
SELECT
	CONCAT(u.l_name, u.f_name) AS 氏名,
	CONCAT(u.l_name_kana, u.f_name_kana) AS 氏名（カナ）
＃ユーザテーブルから取得
FROM
	usr AS u
# ユーザテーブルから千葉県在住の人を取り出す
WHERE
	u.prefecture = '千葉県'
# ユーザテーブルとアンケート回答テーブルから取得したデータを重複データを取り除き結合する
UNION
# アンケート回答テーブルから氏名、氏名（カナ）を取得
	SELECT
		q.name AS 氏名,
		q.name_kana AS 氏名（カナ）
# アンケート回答テーブルから取得
FROM
	quest AS q
# アンケート回答テーブルから千葉県在住の人を取り出す
WHERE
	q.prefecture = '千葉県'
# 結合したデータの２列目である氏名（カナ）について降順で表示
ORDER BY
	2 desc
;

■返却値
mysql> SELECT
    -> CONCAT(u.l_name, u.f_name) AS 氏名,
    -> CONCAT(u.l_name_kana, u.f_name_kana) AS 氏名（カナ）
    -> FROM
    -> usr AS u
    -> WHERE
    -> u.prefecture = '千葉県'
    -> UNION
    -> SELECT
    -> q.name AS 氏名,
    -> q.name_kana AS 氏名（カナ）
    -> FROM
    -> quest AS q
    -> WHERE
    -> q.prefecture = '千葉県'
    -> ORDER BY
    -> 2 desc
    -> ;
+------------+------------------+
| 氏名       | 氏名（カナ）     |
+------------+------------------+
| 矢口亜由美 | ヤグチアユミ     |
| 村井佐知子 | ムライサチコ     |
| 根岸亜由美 | ネギシアユミ     |
| 久保田守   | クボタマモル     |
| 井上一郎   | イノウエイチロウ |
| 有木守     | アリキマモル     |
+------------+------------------+
6 rows in set (0.00 sec)