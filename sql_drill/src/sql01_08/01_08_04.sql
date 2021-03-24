■問題
以下はアクセス記録テーブル（access_log）からアクセス日時の新しい順に10件のログデータを取得するためのSQL命令です
（取得列はpage_id, referer, ip_address）が、2点誤りがあります。誤りを指摘してください。
SELECT
	page_id,
	referer,
	ip_address
FROM
	access_log
ORDER BY
	access_date ASC
LIMIT
	10, 0

■指摘事項・実行文
指摘１：アクセス日付の新しい順に取得する為にはASC（昇順）ではなくDESC（降順）にする必要がある
指摘２：LIMIT句は「取得開始行、取得行数」で指定する必要があるので先頭から10行取得するにはLIMIT 0, 10とする必要がある。

# page_id, referer, ip_address列を取得
SELECT
	page_id,
	referer,
	ip_address
# アクセス記録テーブルから取得
FROM
	access_log
# アクセス日時の新しい順に並べる
ORDER BY
	access_date DESC
# 取得する行は先頭から10件
LIMIT
	0, 10
;

■返却値
mysql> SELECT
    -> page_id,
    -> referer,
    -> ip_address
    -> # アクセス記録テーブルから取得
    -> FROM
    -> access_log
    -> # アクセス日時の新しい順に並べる
    -> ORDER BY
    -> access_date DESC
    -> # 取得する行は先頭から10件
    -> LIMIT
    -> 0, 10
    -> ;
+---------+---------------------------+-----------------+
| page_id | referer                   | ip_address      |
+---------+---------------------------+-----------------+
| C0001   | http://wings.msn.to/hamu/ | 192.168.165.19  |
| C0005   | http://wings.msn.to/neko/ | 192.168.211.109 |
| C0004   | http://wings.msn.to/kame/ | 192.168.206.132 |
| A0001   | http://wings.msn.to/hamu/ | 192.168.16.198  |
| C0003   | http://wings.msn.to/saru/ | 192.168.209.236 |
| A0001   | http://wings.msn.to/hamu/ | 192.168.195.112 |
| C0002   | http://wings.msn.to/neko/ | 192.168.30.206  |
| A0001   | http://wings.msn.to/hamu/ | 192.168.16.115  |
| C0001   | http://wings.msn.to/hamu/ | 192.168.32.14   |
| A0001   | http://wings.msn.to/hamu/ | 192.168.13.16   |
+---------+---------------------------+-----------------+
10 rows in set (0.04 sec)