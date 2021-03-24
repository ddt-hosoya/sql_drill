■問題
以下は、アクセス記録テーブル（access_log）からメニューコード別のアクセス数を取得するためのSQL命令ですが、
２点誤りがあります。誤りを指摘してください。
SELECT
	page_id,
	SUM(*)
FROM
	access_log
ORDER BY
	page_id
;
■指摘・実行文
指摘１：アクセス数（レコード数）を算出するためにはSUM関数ではなくCOUNT関数を使用する必要がある
指摘２：メニューコード別に取得する為にはORDER BYではなくGROUP BYを使用する必要がある
# メニューコード別のアクセス数を取得
SELECT
	page_id,
	COUNT(*)
# アクセス記録テーブルから取得
FROM
	access_log
# メニューコード別に取得
GROUP BY
	page_id
;



■返却値
mysql> SELECT
    -> page_id,
    -> COUNT(*)
    -> FROM
    -> access_log
    -> GROUP BY
    -> page_id
    -> ;
+---------+----------+
| page_id | COUNT(*) |
+---------+----------+
| A0001   |       77 |
| B0001   |        6 |
| B0002   |        2 |
| B0003   |        2 |
| D0001   |       12 |
| B0004   |        2 |
| C0001   |       14 |
| C0002   |        2 |
| C0003   |        2 |
| C0004   |        2 |
| C0005   |        2 |
| D0004   |        1 |
| D0002   |        1 |
| D0003   |        1 |
+---------+----------+
14 rows in set (0.01 sec)