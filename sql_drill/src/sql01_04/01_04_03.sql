■問題
ユーザーテーブル（usr）から「東京都」に住んでいない人の情報だけを取り出してみましょう。
取り出す列は l_name, f_name, email 列とします。

SELECT
	l_name,
	f_name,
	email
FROM
	[①空欄]
WHERE
	[②空欄]
;

■実行文
#  l_name, f_name, email 列を取り出す
SELECT
	l_name,
	f_name,
	email
# ユーザーテーブルから取得
FROM
	usr
# 「東京都」に住んでいない人の情報だけ取得
WHERE
	prefecture <> '東京都'
;

■返却値
mysql> SELECT
    -> l_name,
    -> f_name,
    -> email
    -> FROM
    -> usr
    -> WHERE
    -> prefecture <> '東京都'
    -> ;
+--------+--------+----------------------+
| l_name | f_name | email                |
+--------+--------+----------------------+
| 井上   | 一郎   | inoue@wings.msn.to   |
| 上原   | 幸一   | uehara@wings.msn.to  |
| 江本   | 聡     | emoto@wings.msn.to   |
| 河合   | 泰治   | kawai@wings.msn.to   |
| 木下   | 一樹   | kino@wings.msn.to    |
| 久保田 | 守     | kubota@wings.msn.to  |
| 児玉   | 毅     | kodama@wings.msn.to  |
| 坂口   | 駿     | saka@examples.com    |
| 井上   | 一郎   | shimi@wings.msn.to   |
| 矢口   | 亜由美 | yaguchi@wings.msn.to |
| 有木   | 茉莉   | yuki@wings.msn.to    |
| 吉岡   | 遥     | yoshi@examples.com   |
| 松本   | 博美   | matsu@wings.msn.to   |
| 南     | 沙恵   | minami@wings.msn.to  |
| 村井   | 佐知子 | murai@wings.msn.to   |
| 森本   | 絵里   | morimo@examples.com  |
| 西島   | 文子   | nishi@wings.msn.to   |
| 根岸   | 裕子   | negi@wings.msn.to    |
+--------+--------+----------------------+
18 rows in set (0.00 sec)