■問題文
貸し出し記録テーブル（rental）上、貸出日が2012年3月31日より前で、かつ、現在貸し出し中であるレコードについて、
returned列を9(紛失)で更新しましょう。

■実行文
# 貸し出し記録テーブルを更新する
UPDATE
	rental
# returned列を9(紛失)で更新する
SET
	returned = 9
# 貸出日が2012年3月31日より前で、かつ、現在貸し出し中であるレコードのみ更新する
WHERE
	rental_date < '2012-03-31'
	AND returned = 0
;

■返却値
mysql> UPDATE
    -> rental
    -> SET
    -> returned = 9
    -> WHERE
    -> rental_date < '2012-03-31'
    -> AND returned = 0
    -> ;
Query OK, 2 rows affected (0.06 sec)
Rows matched: 2  Changed: 2  Warnings: 0

【Before】
mysql> select id,rental_date,returned from rental order by rental_date;
+----+-------------+----------+
| id | rental_date | returned |
+----+-------------+----------+
|  2 | 2010-12-03  |        1 |
|  3 | 2011-03-20  |        1 |
|  4 | 2011-04-16  |        1 |
|  6 | 2011-07-22  |        1 |
|  7 | 2011-08-23  |        1 |
| 17 | 2011-10-25  |        1 |
|  8 | 2011-11-10  |        1 |
|  1 | 2011-12-01  |        1 |
|  5 | 2012-01-16  |        1 |
|  9 | 2012-01-20  |        1 |
| 11 | 2012-02-11  |        1 |
| 12 | 2012-02-22  |        0 |
| 13 | 2012-03-19  |        1 |
| 10 | 2012-03-20  |        0 |
| 18 | 2012-03-26  |        1 |
| 14 | 2012-06-14  |        0 |
| 15 | 2012-08-27  |        1 |
| 19 | 2012-09-15  |        1 |
| 16 | 2012-12-10  |        0 |
| 23 | 2012-12-22  |        0 |
| 24 | 2012-12-27  |        0 |
| 22 | 2013-01-12  |        0 |
| 21 | 2013-01-14  |        0 |
| 25 | 2013-03-10  |        0 |
| 20 | 2013-03-16  |        0 |
| 26 | 2021-06-09  |        0 |
+----+-------------+----------+
26 rows in set (0.04 sec)

【After】
mysql> select id,rental_date,returned from rental order by rental_date;
+----+-------------+----------+
| id | rental_date | returned |
+----+-------------+----------+
|  2 | 2010-12-03  |        1 |
|  3 | 2011-03-20  |        1 |
|  4 | 2011-04-16  |        1 |
|  6 | 2011-07-22  |        1 |
|  7 | 2011-08-23  |        1 |
| 17 | 2011-10-25  |        1 |
|  8 | 2011-11-10  |        1 |
|  1 | 2011-12-01  |        1 |
|  5 | 2012-01-16  |        1 |
|  9 | 2012-01-20  |        1 |
| 11 | 2012-02-11  |        1 |
| 12 | 2012-02-22  |        9 |
| 13 | 2012-03-19  |        1 |
| 10 | 2012-03-20  |        9 |
| 18 | 2012-03-26  |        1 |
| 14 | 2012-06-14  |        0 |
| 15 | 2012-08-27  |        1 |
| 19 | 2012-09-15  |        1 |
| 16 | 2012-12-10  |        0 |
| 23 | 2012-12-22  |        0 |
| 24 | 2012-12-27  |        0 |
| 22 | 2013-01-12  |        0 |
| 21 | 2013-01-14  |        0 |
| 25 | 2013-03-10  |        0 |
| 20 | 2013-03-16  |        0 |
| 26 | 2021-06-09  |        0 |
+----+-------------+----------+
26 rows in set (0.00 sec)