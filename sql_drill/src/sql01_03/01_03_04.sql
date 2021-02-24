■問題
以下は社員テーブル（employee）から重複なしの役職を取り出す為のSQL命令ですが、2点誤りがあります。誤りを指摘してください。

SELECT ALL
	class,
	depart_id
FROM
	employee
;
■実行文
誤り1:「ALL」は誤り、「DISTINCT」が正しい。
誤り2: 重複なしの役職のみを取り出すためには「depart_id」は不要。

SELECT DISTINCT
	class
FROM
	employee
;


■返却値
mysql> SELECT DISTINCT
    -> class
    -> FROM
    -> employee
    -> ;
+--------------+
| class        |
+--------------+
| 部長         |
| 担当         |
| 主任         |
| アシスタント |
| 課長         |
+--------------+
5 rows in set (0.00 sec)