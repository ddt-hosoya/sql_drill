■問題
書籍情報テーブル（books）から刊行日が新しい物を３件目から５件分だけ取り出してみましょう。
取得列は、title, publish_date列とします。以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	title,
	publish_date
FROM
	books
[①空欄]
	publish_date DESC
LIMIT
	[②空欄]
;

■実行文
# title, publish_date列を取得
SELECT
	title,
	publish_date
# 書籍情報テーブルから取得
FROM
	books
# 刊行日が新しい順に並べる
ORDER BY
	publish_date DESC
# 取得する行は3件目から5件分
LIMIT
	2,5
;


■返却値
mysql> # title, publish_date列を取得
mysql> SELECT
    -> title,
    -> publish_date
    -> # 書籍情報テーブルから取得
    -> FROM
    -> books
    -> # 刊行日が新しい順に並べる
    -> ORDER BY
    -> publish_date DESC
    -> # 取得する行は3件目から5件分
    -> LIMIT
    -> 2,5
    -> ;
+------------------+--------------+
| title            | publish_date |
+------------------+--------------+
| PHPドリル        | 2013-01-14   |
| らくだの観察日記 | 2012-12-24   |
| XMLリファレンス  | 2012-11-24   |
| あひるの観察日記 | 2012-11-15   |
| PHP5サンプル集   | 2012-11-01   |
+------------------+--------------+
5 rows in set (0.00 sec)

mysql>