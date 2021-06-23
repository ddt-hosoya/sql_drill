■問題文
以下は、貸し出し記録テーブル（rental）上、利用者コードがB200405、ISBNコードが4-001-0000-1のデータについて、
貸出日を今日の日付に更新するためのSQL命令ですが、誤りが2点あります。誤りを指摘してください。
UPDATE
	rental
SET
	rental_date CURRENT_DATE
WHERE
	user_id='B200405'
OR
	isbn='4-0010-0000-1'
;

■実行文
指摘１：SET句で更新したい値を記述する際は’＝’が必要
指摘２：更新したいレコードの条件式はORではなくAND

# 貸出記録テーブルを更新する
UPDATE
	rental
# 貸出日を今日の日付に更新する
SET
	rental_date  = CURRENT_DATE
# 利用者コードがB200405、ISBNコードが4-001-0000-1のデータについて更新する
WHERE
	user_id='B200405'
AND
	isbn='4-0010-0000-1'
;

■返却値
mysql> # 貸出記録テーブルを更新する
mysql> UPDATE
    -> rental
    -> # 貸出日を今日の日付に更新する
    -> SET
    -> rental_date  = CURRENT_DATE
    -> # 利用者コードがB200405、ISBNコードが4-001-0000-1のデータについて更新する
    -> WHERE
    -> user_id='B200405'
    -> AND
    -> isbn='4-0010-0000-1'
    -> ;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

【Before】
mysql> select * from rental WHERE user_id='B200405' AND isbn='4-0010-0000-1';
+----+---------+---------------+-------------+----------+
| id | user_id | isbn          | rental_date | returned |
+----+---------+---------------+-------------+----------+
| 25 | B200405 | 4-0010-0000-1 | 2013-03-10  |        0 |
+----+---------+---------------+-------------+----------+
1 row in set (0.01 sec)

【After】
mysql> select * from rental WHERE user_id='B200405' AND isbn='4-0010-0000-1';
+----+---------+---------------+-------------+----------+
| id | user_id | isbn          | rental_date | returned |
+----+---------+---------------+-------------+----------+
| 25 | B200405 | 4-0010-0000-1 | 2021-06-23  |        0 |
+----+---------+---------------+-------------+----------+
1 row in set (0.00 sec)
