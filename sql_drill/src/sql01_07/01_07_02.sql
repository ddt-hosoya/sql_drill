■問題
ユーザーテーブル（usr）から東京都、千葉県、神奈川県に住んでいる人のリストを姓（カナ）、名（カナ）について昇順で取り出してみましょう。
取り出す列はl_name, f_name, prefecture列であるものとします。
SELECT
	l_name,
	f_name,
	prefecture
FROM
	usr
WHERE
	[①空欄]
ORDER BY
	[②空欄]
	f_name_kana ASC
;

■実行文
# l_name, f_name, prefecture列を取得
SELECT
	l_name,
	f_name,
	prefecture
# ユーザーテーブルから取得
FROM
	usr
# 東京都、千葉県、神奈川県に住んでいるという条件に当てはまる場合のみ取得
WHERE
	prefecture IN ('東京都', '千葉県', '神奈川県')
# 取得結果を姓（カナ）、名（カナ）について昇順に並べる
ORDER BY
	l_name_kana ASC,
	f_name_kana ASC
;


■返却値
mysql> # l_name, f_name, prefecture列を取得
mysql> SELECT
    -> l_name,
    -> f_name,
    -> prefecture
    -> # ユーザーテーブルから取得
    -> FROM
    -> usr
    -> # 東京都、千葉県、神奈川県に住んでいるという条件に当てはまる場合のみ取得
    -> WHERE
    -> prefecture IN ('東京都', '千葉県', '神奈川県')
    -> # 取得結果を姓（カナ）、名（カナ）について昇順に並べる
    -> ORDER BY
    -> l_name_kana ASC,
    -> f_name_kana ASC
    -> ;
+--------+--------+------------+
| l_name | f_name | prefecture |
+--------+--------+------------+
| 有木   | 茉莉   | 神奈川県   |
| 井上   | 一郎   | 千葉県     |
| 上原   | 幸一   | 神奈川県   |
| 小野   | 雄二   | 東京都     |
| 河合   | 泰治   | 神奈川県   |
| 久保田 | 守     | 千葉県     |
| 松本   | 博美   | 神奈川県   |
| 村井   | 佐知子 | 千葉県     |
| 矢口   | 亜由美 | 千葉県     |
| 山田   | 太郎   | 東京都     |
| 和田   | 修子   | 東京都     |
+--------+--------+------------+
11 rows in set (0.00 sec)