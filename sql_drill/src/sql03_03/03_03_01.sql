■問題文
社員テーブル（employee）から役職が主任、担当、アシスタントである社員のコードを取り出して、
タイムカードテーブル（time_card）に挿入してみましょう。
その際に、日付列には今日の日付を、勤務時間列には固定値で０をセットするものとします。

INSERT INTO
	time_card
(
	s_id,
	r_date,
	work_time
)
[空欄①]
	s_id,
	CURRENT_DATE,
	0
FROM
	employee
WHERE
	[空欄②]
;

■実行文
# タイムカードテーブルにデータを挿入する
INSERT INTO
	time_card
# データを登録する項目は社員コード、日付、勤務時間
(
	s_id,
	r_date,
	work_time
)
# タイムカードテーブルに挿入するデータは社員テーブルの役職が主任、担当、アシスタントである社員で、日付は今日の日付、勤務時間０を固定したデータとする
SELECT
	s_id,
	CURRENT_DATE,
	0
FROM
	employee
WHERE
	class in ('主任', '担当', 'アシスタント')
;

■返却値
mysql> INSERT INTO
    -> time_card
    -> (
    -> s_id,
    -> r_date,
    -> work_time
    -> )
    -> SELECT
    -> s_id,
    -> CURRENT_DATE,
    -> 0
    -> FROM
    -> employee
    -> WHERE
    -> class in ('主任', '担当', 'アシスタント')
    -> ;
Query OK, 17 rows affected (0.02 sec)
Records: 17  Duplicates: 0  Warnings: 0

mysql> select * from time_card where r_date=current_date;
+---------+------------+-----------+
| s_id    | r_date     | work_time |
+---------+------------+-----------+
| DA00001 | 2021-06-09 |         0 |
| FU00001 | 2021-06-09 |         0 |
| FU00002 | 2021-06-09 |         0 |
| HA0002  | 2021-06-09 |         0 |
| KA00001 | 2021-06-09 |         0 |
| KA00002 | 2021-06-09 |         0 |
| KA00003 | 2021-06-09 |         0 |
| KI00001 | 2021-06-09 |         0 |
| NA00001 | 2021-06-09 |         0 |
| NI00001 | 2021-06-09 |         0 |
| NI00002 | 2021-06-09 |         0 |
| NO00001 | 2021-06-09 |         0 |
| SI00001 | 2021-06-09 |         0 |
| TA00001 | 2021-06-09 |         0 |
| TA00002 | 2021-06-09 |         0 |
| TO00002 | 2021-06-09 |         0 |
| TU00001 | 2021-06-09 |         0 |
+---------+------------+-----------+
17 rows in set (0.00 sec)