■問題
アンケート回答テーブル（quest）から都道府県ごとに男性回答者のみの最高値を求め、60歳より大きい行のみを取り出してみましょう。
SELECT
	[空欄①]
FROM
	quest
[空欄②]
	sex='男'
GROUP BY
	prefecture
[空欄3]
	MAX(age) > 60
;
■実行文
# 都道府県を取得
SELECT
	prefecture
# アンケート回答テーブルから取得
FROM
	quest
# 性別が男性の行から取得
WHERE
	sex='男'
# 都道府県ごとに集計する
GROUP BY
	prefecture
# 回答者の性別が男性で、都道府県ごとに集計した年齢の最大値が60歳以上の都道府県を取得
HAVING
	MAX(age) > 60
;

■返却値
mysql> SELECT
    -> prefecture
    -> FROM
    -> quest
    -> WHERE
    -> sex='男'
    -> GROUP BY
    -> prefecture
    -> HAVING
    -> MAX(age) > 60
    -> ;
+------------+
| prefecture |
+------------+
| 茨城県     |
+------------+
1 row in set (0.00 sec)