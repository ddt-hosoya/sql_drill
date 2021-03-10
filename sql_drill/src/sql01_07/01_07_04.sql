■問題
以下はアクセス記録テーブル（access_log）から2013年1月分のアクセスログを
referer,ip_address列について降順で取り出す為のSQL命令ですが、2点誤りがあります。誤りを指摘してください。

SELECT
	*
FROM
	access_log
WHERE
	access_date IN ('2013-01-01', '2013-01-31')
ORDER BY
	referer, ip_address DESC
;

■回答・実行文
指摘１：access_date IN ('2013-01-01', '2013-01-31')だと該当の2日分しか取得できないのでaccess_date LIKE '2013-01%'にする
指摘２：refererに降順ソートを指定していないので昇順になってしまう。DESCを指定する。

# 全列を取得
SELECT
	*
# アクセス記録テーブルから取得
FROM
	access_log
# 2013年1月分のアクセスログという条件に当てはまる場合のみ取得
WHERE
	access_date LIKE '2013-01%'
# referer,ip_address列について降順に並べる
ORDER BY
	referer DESC, ip_address DESC
;

■返却値
mysql> # 全列を取得
mysql> SELECT
    -> *
    -> # アクセス記録テーブルから取得
    -> FROM
    -> access_log
    -> # 2013年1月分のアクセスログという条件に当てはまる場合のみ取得
    -> WHERE
    -> access_date LIKE '2013-01%'
    -> # referer,ip_address列について降順に並べる
    -> ORDER BY
    -> referer DESC, ip_address DESC
    -> ;
+--------+---------+---------------------------+-----------------+---------------------+
| log_id | page_id | referer                   | ip_address      | access_date         |
+--------+---------+---------------------------+-----------------+---------------------+
|    116 | C0001   | http://wings.msn.to/tori/ | 192.168.15.201  | 2013-01-01 13:18:14 |
|    122 | C0003   | http://wings.msn.to/saru/ | 192.168.209.236 | 2013-01-03 14:10:49 |
|    115 | B0004   | http://wings.msn.to/neko/ | 192.168.70.166  | 2013-01-01 12:25:12 |
|    120 | C0002   | http://wings.msn.to/neko/ | 192.168.30.206  | 2013-01-02 14:11:17 |
|    125 | C0005   | http://wings.msn.to/neko/ | 192.168.211.109 | 2013-01-05 17:18:19 |
|    124 | C0004   | http://wings.msn.to/kame/ | 192.168.206.132 | 2013-01-05 13:16:12 |
|    118 | C0001   | http://wings.msn.to/hamu/ | 192.168.32.14   | 2013-01-01 23:18:14 |
|    121 | A0001   | http://wings.msn.to/hamu/ | 192.168.195.112 | 2013-01-03 04:10:49 |
|    126 | C0001   | http://wings.msn.to/hamu/ | 192.168.165.19  | 2013-01-05 20:18:19 |
|    123 | A0001   | http://wings.msn.to/hamu/ | 192.168.16.198  | 2013-01-05 11:16:12 |
|    119 | A0001   | http://wings.msn.to/hamu/ | 192.168.16.115  | 2013-01-02 07:11:17 |
|    117 | A0001   | http://wings.msn.to/hamu/ | 192.168.13.16   | 2013-01-01 22:25:12 |
+--------+---------+---------------------------+-----------------+---------------------+
12 rows in set (0.00 sec)