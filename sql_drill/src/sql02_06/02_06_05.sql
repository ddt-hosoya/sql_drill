■問題文
ユーザテーブル（usr）、アンケート回答テーブル（quest）それぞれに含まれるユーザ氏名を比較し、双方に含まれるデータのみを取り出してみましょう。

■実行文
# 氏名を取得
SELECT
	CONCAT(u.l_name, u.f_name) AS 氏名
# ユーザテーブルとアンケート回答テーブルを氏名が一致することを条件に内部結合し、その結果から氏名を取得
FROM
	usr AS u
INNER JOIN
	quest AS q
ON
	q.name = CONCAT(u.l_name, u.f_name)
;
■返却値
mysql> SELECT
    -> CONCAT(u.l_name, u.f_name) AS 氏名
    -> FROM
    -> usr AS u
    -> INNER JOIN
    -> quest AS q
    -> ON
    -> q.name = CONCAT(u.l_name, u.f_name)
    -> ;
+----------+
| 氏名     |
+----------+
| 山田太郎 |
+----------+
1 row in set (0.00 sec)

★★★PostgreSQLでの実行結果★★★
SELECT
	CONCAT(u.l_name, u.f_name) AS 氏名
FROM
	usr AS u
INTERSECT
SELECT
	q.name AS 氏名
FROM
	quest AS q
;

postgres=#
postgres=# SELECT
postgres-# CONCAT(u.l_name, u.f_name) AS 氏名
postgres-# FROM
postgres-# usr AS u
postgres-# INTERSECT
postgres-# SELECT
postgres-# q.name AS 氏名
postgres-# FROM
postgres-# quest AS q
postgres-# ;
   氏名
----------
 山田太郎
(1 行)