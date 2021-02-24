■問題
書籍情報テーブル（books）からtitleを取り出してみましょう。以下の空欄を埋めてSQL命令を完成させてください。
[①空欄]
	title
FROM
	[②空欄]
;
■実行文

SELECT
	title
FROM
	books
;


■返却値
mysql> SELECT
    -> title
    -> FROM
    -> books
    -> ;
+------------------+
| title            |
+------------------+
| ハムスターの観察 |
| PHPドリル        |
| フェレットの観察 |
| らくだの観察日記 |
| あひるの観察日記 |
| かえるの観察日記 |
| SQL入門          |
| JSPリファレンス  |
| PHP5サンプル集   |
| XML辞典          |
| PEAR入門         |
| SQLリファレンス  |
| SQLプチブック    |
| XMLリファレンス  |
+------------------+
14 rows in set (0.00 sec)