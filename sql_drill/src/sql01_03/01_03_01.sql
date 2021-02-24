■問題
アンケート回答テーブル（quest）から都道府県名を重複のない形式で取り出してみましょう。以下の空欄を埋めてSQL命令を完成させてください。
SELECT [①空欄]
	prefecture
FROM
	[②空欄]
;

■実行文

SELECT DISTINCT
	prefecture
FROM
	quest
;


■返却値
mysql> SELECT DISTINCT
    -> prefecture
    -> FROM
    -> quest
    -> ;
+------------+
| prefecture |
+------------+
| 東京都     |
| 神奈川県   |
| 茨城県     |
| 千葉県     |
| 埼玉県     |
+------------+
5 rows in set (0.01 sec)