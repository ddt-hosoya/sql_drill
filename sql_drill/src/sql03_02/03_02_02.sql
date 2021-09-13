■問題文
貸し出し記録テーブル（rental）に対して、以下の内容の新規データを挿入してみましょう。
以下の空欄を埋めてSQL命令を完成させてください。
--------------------------------------
【挿入対象のデータ】
項目	：	値
利用者コード	：	B200502
ISBNコード	：	4-0010-0000-0
貸出日	：	（今日の日付）
--------------------------------------
[空欄①]
	rental
(
	user_id,
	isbn,
	rental_date
)
[空欄②]
(
	'B200502',
	'4-0010-0000-0',
	CURRENT_DATE
)
;

■実行文
# 貸し出し記録テーブルにデータを挿入する
INSERT INTO
	rental
＃ 挿入するデータの項目は利用者コード、ISBNコード、貸出日
(
	user_id,
	isbn,
	rental_date
)
VALUES
(
	'B200502',
	'4-0010-0000-0',
	CURRENT_DATE
)
;


■返却値
mysql> INSERT INTO
    -> rental
    -> (
    -> user_id,
    -> isbn,
    -> rental_date
    -> )
    -> VALUES
    -> (
    -> 'B200502',
    -> '4-0010-0000-0',
    -> CURRENT_DATE
    -> )
    -> ;
Query OK, 1 row affected (0.04 sec)

mysql>
mysql> select * from rental where user_id='B200502';
+----+---------+---------------+-------------+----------+
| id | user_id | isbn          | rental_date | returned |
+----+---------+---------------+-------------+----------+
| 26 | B200502 | 4-0010-0000-0 | 2021-06-09  |        0 |
+----+---------+---------------+-------------+----------+
1 row in set (0.00 sec)