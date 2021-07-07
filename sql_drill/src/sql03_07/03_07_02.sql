■問題文
アクセス記録テーブル（access_log）から日時が2012年06月01日より前か、リンク元のURLが空である情報を削除しましょう。
空欄を埋めて、正しいSQLを完成させてください。
DELETE FROM
	[空欄①]
WHERE
	[空欄②]
;
■実行文
# アクセス記録テーブルからデータを削除する
DELETE FROM
	access_log
# 日時が2012年06月01日より前か、リンク元のURLが空である場合のみ削除する
WHERE
	access_date < '2012-06-01'
	OR referer IS NULL
;

■返却値
mysql> DELETE FROM
    -> access_log
    -> WHERE
    -> access_date < '2012-06-01'
    -> OR referer IS NULL
    -> ;
Query OK, 15 rows affected (0.04 sec)

【Before】
mysql> select count(*) from access_log;
+----------+
| count(*) |
+----------+
|      126 |
+----------+
1 row in set (0.01 sec)
mysql> select * from access_log where access_date < '2012-06-01' or referer is NULL;
+--------+---------+---------------------------+-----------------+---------------------+
| log_id | page_id | referer                   | ip_address      | access_date         |
+--------+---------+---------------------------+-----------------+---------------------+
|      1 | A0001   | http://wings.msn.to/hamu/ | 192.168.0.253   | 2012-02-01 10:11:12 |
|      2 | A0001   | http://wings.msn.to/hamu/ | 192.168.1.223   | 2012-02-12 07:15:14 |
|      3 | B0001   | http://wings.msn.to/hamu/ | 192.168.21.18   | 2012-02-19 20:11:12 |
|      4 | A0001   | http://wings.msn.to/hamu/ | 192.168.115.25  | 2012-03-01 21:14:18 |
|      5 | A0001   | http://wings.msn.to/hamu/ | 192.168.29.208  | 2012-03-11 21:18:17 |
|      6 | A0001   | http://wings.msn.to/hamu/ | 192.168.3.254   | 2012-03-19 20:10:14 |
|      7 | A0001   | http://wings.msn.to/neko/ | 192.168.42.217  | 2012-03-19 20:11:12 |
|      8 | B0001   | http://wings.msn.to/inu/  | 192.168.81.112  | 2012-04-01 21:14:18 |
|      9 | B0001   | http://wings.msn.to/hamu/ | 192.168.165.27  | 2012-04-10 14:18:19 |
|     10 | B0002   | http://wings.msn.to/neko/ | 192.168.29.207  | 2012-04-11 21:18:17 |
|     11 | B0003   | http://wings.msn.to/neko/ | 192.168.4.257   | 2012-05-10 14:18:19 |
|     12 | A0001   | http://wings.msn.to/hamu/ | 192.168.142.207 | 2012-05-21 21:11:17 |
|     13 | A0001   | http://wings.msn.to/hamu/ | 192.168.41.102  | 2012-05-30 13:17:24 |
|     94 | A0001   | NULL                      | 192.168.116.14  | 2012-11-15 23:17:48 |
|    112 | A0001   | NULL                      | 192.168.31.226  | 2012-12-27 23:11:15 |
+--------+---------+---------------------------+-----------------+---------------------+
15 rows in set (0.00 sec)

【After】
mysql>  select count(*) from access_log;
+----------+
| count(*) |
+----------+
|      111 |
+----------+
1 row in set (0.00 sec)

mysql> select * from access_log where access_date < '2012-06-01' or referer is NULL;
Empty set (0.00 sec)