■問題文
貸し出し記録テーブル（rental）から貸出日が2011年12月31日以前で、かつ、返却済みである情報について削除してみましょう。
空欄を埋めて、正しいSQL命令を完成させてください。
[空欄①]
	rental
WHERE
	[空欄②]
;

■実行文
# 貸し出し記録テーブルからデータを削除する
DELETE FROM
	rental
# 貸出日が2011年12月31日以前で、かつ、返却済みである場合のみ削除する
WHERE
	rental_date <= '2011-12-31'
	AND returned = '1'
;

■返却値
mysql> DELETE FROM
    -> rental
    -> WHERE
    -> rental_date <= '2011-12-31'
    -> AND returned = '1'
    -> ;
Query OK, 8 rows affected (0.06 sec)

【Before】
mysql> select * from rental order by rental_date;
+----+---------+---------------+-------------+----------+
| id | user_id | isbn          | rental_date | returned |
+----+---------+---------------+-------------+----------+
|  2 | A200403 | 4-8833-0000-2 | 2010-12-03  |        1 |
|  3 | A200405 | 4-8833-0000-2 | 2011-03-20  |        1 |
|  4 | B200403 | 4-8833-0000-2 | 2011-04-16  |        1 |
|  6 | A200502 | 4-8833-0000-2 | 2011-07-22  |        1 |
|  7 | A200505 | 4-8833-0000-2 | 2011-08-23  |        1 |
| 17 | A200502 | 4-7980-0522-3 | 2011-10-25  |        1 |
|  8 | B200501 | 4-8833-0000-2 | 2011-11-10  |        1 |
|  1 | A200501 | 4-0010-0000-0 | 2011-12-01  |        1 |
|  5 | B200405 | 4-0010-0000-0 | 2012-01-16  |        1 |
|  9 | B200503 | 4-8833-0000-2 | 2012-01-20  |        1 |
| 11 | A200401 | 4-8833-0000-2 | 2012-02-11  |        1 |
| 12 | A200402 | 4-8833-0000-2 | 2012-02-22  |        9 |
| 13 | A200404 | 4-8833-0000-2 | 2012-03-19  |        1 |
| 10 | B200504 | 4-0010-0000-0 | 2012-03-20  |        9 |
| 18 | A200506 | 4-7981-0722-0 | 2012-03-26  |        1 |
| 14 | A200405 | 4-0010-0000-0 | 2012-06-14  |        0 |
| 15 | B200402 | 4-8833-0000-2 | 2012-08-27  |        1 |
| 19 | B200501 | 4-0010-0000-0 | 2012-09-15  |        1 |
| 16 | B200404 | 4-8833-0000-2 | 2012-12-10  |        0 |
| 23 | A200405 | 4-8833-0000-3 | 2012-12-22  |        0 |
| 24 | B200403 | 4-0010-0000-9 | 2012-12-27  |        0 |
| 22 | B200505 | 4-7981-0959-2 | 2013-01-12  |        0 |
| 21 | B200504 | 4-7980-0945-8 | 2013-01-14  |        0 |
| 20 | B200503 | 4-8833-0000-1 | 2013-03-16  |        0 |
| 26 | B200502 | 4-0010-0000-0 | 2021-06-09  |        0 |
| 25 | B200405 | 4-0010-0000-1 | 2021-06-23  |        0 |
+----+---------+---------------+-------------+----------+
26 rows in set (0.03 sec)
【After】
mysql> select * from rental order by rental_date;
+----+---------+---------------+-------------+----------+
| id | user_id | isbn          | rental_date | returned |
+----+---------+---------------+-------------+----------+
|  5 | B200405 | 4-0010-0000-0 | 2012-01-16  |        1 |
|  9 | B200503 | 4-8833-0000-2 | 2012-01-20  |        1 |
| 11 | A200401 | 4-8833-0000-2 | 2012-02-11  |        1 |
| 12 | A200402 | 4-8833-0000-2 | 2012-02-22  |        9 |
| 13 | A200404 | 4-8833-0000-2 | 2012-03-19  |        1 |
| 10 | B200504 | 4-0010-0000-0 | 2012-03-20  |        9 |
| 18 | A200506 | 4-7981-0722-0 | 2012-03-26  |        1 |
| 14 | A200405 | 4-0010-0000-0 | 2012-06-14  |        0 |
| 15 | B200402 | 4-8833-0000-2 | 2012-08-27  |        1 |
| 19 | B200501 | 4-0010-0000-0 | 2012-09-15  |        1 |
| 16 | B200404 | 4-8833-0000-2 | 2012-12-10  |        0 |
| 23 | A200405 | 4-8833-0000-3 | 2012-12-22  |        0 |
| 24 | B200403 | 4-0010-0000-9 | 2012-12-27  |        0 |
| 22 | B200505 | 4-7981-0959-2 | 2013-01-12  |        0 |
| 21 | B200504 | 4-7980-0945-8 | 2013-01-14  |        0 |
| 20 | B200503 | 4-8833-0000-1 | 2013-03-16  |        0 |
| 26 | B200502 | 4-0010-0000-0 | 2021-06-09  |        0 |
| 25 | B200405 | 4-0010-0000-1 | 2021-06-23  |        0 |
+----+---------+---------------+-------------+----------+
18 rows in set (0.00 sec)