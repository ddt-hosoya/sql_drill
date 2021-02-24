■問題
以下は書籍情報テーブル（books）からtitle列、publish列を取り出す為のSQL命令ですが、2点誤りがあります。誤りを指摘してください。

SELECTS
	title
	publish
FROM
	books
;
■実行文
誤り1:「SELECTS」は誤り、「SELECT」が正しい。
誤り2:「title」と「publish」の間に「,」が必要。

SELECT
	title,
	publish
FROM
	books
;


■返却値
mysql> SELECT
    -> title,
    -> publish
    -> FROM
    -> books
    -> ;
+------------------+--------------+
| title            | publish      |
+------------------+--------------+
| ハムスターの観察 | 山田出版     |
| PHPドリル        | 山田出版     |
| フェレットの観察 | 山田出版     |
| らくだの観察日記 | 山田出版     |
| あひるの観察日記 | 山田出版     |
| かえるの観察日記 | 山田出版     |
| SQL入門          | 山田出版     |
| JSPリファレンス  | 秀和システム |
| PHP5サンプル集   | 秀和システム |
| XML辞典          | 翔泳社       |
| PEAR入門         | 翔泳社       |
| SQLリファレンス  | 日経BP       |
| SQLプチブック    | 日経BP       |
| XMLリファレンス  | 日経BP       |
+------------------+--------------+
14 rows in set (0.00 sec)
