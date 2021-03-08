■問題
アンケート集計テーブル（quest）から年齢（age列）が30歳以上40歳未満の人の回答のみを抜き出してみましょう。
取り出す列は、 name, sex, prefecture 列とします。

■実行文
# name, sex, prefecture 列を取り出す
SELECT
	name,
	age,
	prefecture
# アンケート集計テーブルから取得
FROM
	quest
# 年齢（age列）が30歳以上40歳未満の人のみ取得
WHERE
	age >= 30
	and age < 40
;

■返却値
mysql> SELECT
    -> name,
    -> age,
    -> prefecture
    -> FROM
    -> quest
    -> WHERE
    -> age >= 30
    -> and age < 40
    -> ;
+------------+------+------------+
| name       | age  | prefecture |
+------------+------+------------+
| 山田太郎   |   30 | 東京都     |
| 江本修子   |   32 | 東京都     |
| 有木守     |   35 | 千葉県     |
| 南幸一     |   36 | 神奈川県   |
| 根岸亜由美 |   34 | 千葉県     |
+------------+------+------------+
5 rows in set (0.00 sec)