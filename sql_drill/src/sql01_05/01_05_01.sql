■問題
著者情報テーブル（author）から名前が「山田」で始まる著者の情報を取り出してみましょう。
取り出す対象は全列であるものとします。
SELECT
	[①空欄]
FROM
	author
WHERE
	[②空欄]
;

■実行文
# 全列を取得
SELECT
	*
# 著者情報テーブルから取得
FROM
	author
# 名前が「山田」で始まるという条件に当てはまる場合のみ取得
WHERE
	name LIKE '山田%'
;


■返却値

mysql> SELECT
    -> *
    -> # 著者情報テーブルから取得
    -> FROM
    -> author
    -> # 名前が「山田」で始まるという条件に当てはまる場合のみ取得
    -> WHERE
    -> name LIKE '山田%'
    -> ;
+-----------+----------+----------------+------------+
| author_id | name     | name_kana      | birth      |
+-----------+----------+----------------+------------+
| Y0001     | 山田愛子 | ヤマダアイコ   | 1970-04-06 |
| Y0002     | 山田祥寛 | ヤマダヨシヒロ | 1960-12-04 |
+-----------+----------+----------------+------------+
2 rows in set (0.02 sec)