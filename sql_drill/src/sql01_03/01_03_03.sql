■問題
ユーザーテーブル（usr）からユーザ氏名を取り出してみましょう。そのさい同姓同名のユーザは取り除きます。

■実行文
# 重複がない形でユーザ氏名を取り出す
SELECT DISTINCT
	l_name,
	f_name
# ユーザーテーブルから取得
FROM
	usr
;


■返却値
mysql> SELECT DISTINCT
    -> l_name,
    -> f_name
    -> FROM
    -> usr
    -> ;
+--------+--------+
| l_name | f_name |
+--------+--------+
| 井上   | 一郎   |
| 上原   | 幸一   |
| 江本   | 聡     |
| 小野   | 雄二   |
| 河合   | 泰治   |
| 山田   | 太郎   |
| 木下   | 一樹   |
| 久保田 | 守     |
| 児玉   | 毅     |
| 坂口   | 駿     |
| 矢口   | 亜由美 |
| 有木   | 茉莉   |
| 吉岡   | 遥     |
| 和田   | 修子   |
| 松本   | 博美   |
| 南     | 沙恵   |
| 村井   | 佐知子 |
| 森本   | 絵里   |
| 西島   | 文子   |
| 根岸   | 裕子   |
+--------+--------+
20 rows in set (0.00 sec)