■問題
書籍目次テーブル（contents）から現在のコンテンツコードと前のコンテンツコードを、
現在のコンテンツコードについて昇順で取り出してみましょう。
以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	cp.c_id AS 前のページ,
	cn.c_id AS 現在のページ
FROM
	[空欄①]
INNER JOIN
	contents AS cn
ON
	[空欄②]
ORDER BY
	[空欄③]
;
■実行文
# 現在のコンテンツコードと前のコンテンツコードを出力
SELECT
	cp.c_id AS 前のページ,
	cn.c_id AS 現在のページ
# 書籍目次テーブルをコンテンツIDとNEXTコンテンツIDで自己結合した値から出力
FROM
	contents AS cp
INNER JOIN
	contents AS cn
ON
	cp.next_id = cn.c_id
# 現在のコンテンツコードが昇順で出力
ORDER BY
	cn.c_id ASC
;

■返却値
mysql> SELECT
    -> cp.c_id AS 前のページ,
    -> cn.c_id AS 現在のページ
    -> FROM
    -> contents AS cp
    -> INNER JOIN
    -> contents AS cn
    -> ON
    -> cp.next_id = cn.c_id
    -> ORDER BY
    -> cn.c_id ASC
    -> ;
+------------+--------------+
| 前のページ | 現在のページ |
+------------+--------------+
| A001       | A011         |
| A011       | A012         |
| A012       | A013         |
| A013       | A014         |
| A014       | A015         |
| A015       | A016         |
| A016       | A017         |
| A017       | A021         |
| A021       | A022         |
| A022       | A023         |
| A023       | A024         |
| A024       | A025         |
| A025       | A026         |
| A026       | A027         |
| A027       | A028         |
| A028       | A029         |
| A029       | A031         |
| A031       | A032         |
| A032       | A033         |
| A033       | A034         |
| A034       | A035         |
| A035       | A036         |
| A036       | A037         |
| A037       | A041         |
| A041       | A042         |
| A042       | A043         |
| A043       | A044         |
| A044       | A045         |
| A045       | A046         |
+------------+--------------+
29 rows in set (0.00 sec)