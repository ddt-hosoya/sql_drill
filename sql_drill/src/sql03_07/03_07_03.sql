■問題文
社員テーブル上（employee）、退職済みで最終更新日が2007-03-31以前のデータを削除してみましょう。

■実行文
# 社員テーブルからデータを削除する
DELETE FROM
	employee
# 退職済みで最終更新日が2007-03-31以前の場合のみ削除する
WHERE
	retired = '1'
	AND
	last_update <= '2007-03-31'
;

■返却値
mysql> DELETE FROM
    -> employee
    -> WHERE
    -> retired = '1'
    -> AND
    -> last_update <= '2007-03-31'
    -> ;
Query OK, 1 row affected (0.05 sec)

【Before】
mysql> select count(*) from employee;
+----------+
| count(*) |
+----------+
|       27 |
+----------+
1 row in set (0.00 sec)

mysql> select * from employee where retired='1' and last_update <= '2007-03-31';
+--------+--------+--------+-------------+-------------+------+--------+-----------+------+-------------+---------+
| s_id   | l_name | f_name | l_name_kana | f_name_kana | sex  | class  | depart_id | b_id | last_update | retired |
+--------+--------+--------+-------------+-------------+------+--------+-----------+------+-------------+---------+
| HA0001 | 速水   | 和幸   | ハヤミ      | カズユキ    |    1 | リーダ | E01       | NULL | 2007-02-03  |       1 |
+--------+--------+--------+-------------+-------------+------+--------+-----------+------+-------------+---------+
1 row in set (0.00 sec)

【After】
mysql> select count(*) from employee;
+----------+
| count(*) |
+----------+
|       26 |
+----------+
1 row in set (0.00 sec)

mysql> select * from employee where retired='1' and last_update <= '2007-03-31';
Empty set (0.00 sec)