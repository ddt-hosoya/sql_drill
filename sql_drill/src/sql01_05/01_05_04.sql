■問題
社員テーブル(employee)から氏（カナ）が「ア」で始まる社員の情報だけを取り出してみましょう。
取り出す列はl_name, f_name列とします。

■実行文
# l_name, f_name列を取得
SELECT
	l_name,
	f_name
# 社員テーブルから取得
FROM
	employee
# 氏（カナ）が「ア」で始まるという条件に当てはまる場合のみ取得
WHERE
	l_name_kana LIKE 'ア%'
;


■返却値
mysql> # l_name, f_name列を取得
mysql> SELECT
    -> l_name,
    -> f_name
    -> # 社員テーブルから取得
    -> FROM
    -> employee
    -> # 氏（カナ）が「ア」で始まるという条件に当てはまる場合のみ取得
    -> WHERE
    -> l_name_kana LIKE 'ア%'
    -> ;
+--------+--------+
| l_name | f_name |
+--------+--------+
| 相沢   | 聡     |
+--------+--------+
1 row in set (0.00 sec)