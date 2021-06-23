■問題文
アンケート回答テーブル（quest）に「男性」「女性」「男」「女」と表記の揺らぎがありましたので、
これを「男」「女」という表記に統一したいと思います。以下のSQL命令を記述してみましたが、誤りがあり、正常に動作しません。
誤りを2点指摘してみましょう。
UPDATE INTO
	quest
VALUES
	sex=REPLACE(sex, '性', '')
;

■実行文
指摘１：UPDATE文にINTOという記述は誤り
指摘２：UPDATE文で更新する列を指定する句はVALUESではなくSETが正しい

# アンケート回答テーブルを更新する
UPDATE
	quest
# 性別の表記を「男」「女」という表記に統一して更新する
SET
	sex=REPLACE(sex, '性', '')
;

■確認
mysql> # アンケート回答テーブルを更新する
mysql> UPDATE
    -> quest
    -> # 性別の表記を「男」「女」という表記に統一して更新する
    -> SET
    -> sex=REPLACE(sex, '性', '')
    -> ;
Query OK, 4 rows affected (0.03 sec)
Rows matched: 17  Changed: 4  Warnings: 0

【Before】
mysql> select id,sex from quest;
+----+------+
| id | sex  |
+----+------+
|  1 | 男性 |
|  2 | 女   |
|  3 | 女   |
|  4 | 女性 |
|  5 | 女   |
|  6 | 男   |
|  7 | 男   |
|  8 | 男   |
|  9 | 男   |
| 10 | 男   |
| 11 | 男   |
| 12 | 男   |
| 13 | 男   |
| 14 | 男   |
| 15 | 男   |
| 16 | 女性 |
| 17 | 男性 |
+----+------+
17 rows in set (0.00 sec)

【After】
mysql> select id,sex from quest;
+----+-----+
| id | sex |
+----+-----+
|  1 | 男  |
|  2 | 女  |
|  3 | 女  |
|  4 | 女  |
|  5 | 女  |
|  6 | 男  |
|  7 | 男  |
|  8 | 男  |
|  9 | 男  |
| 10 | 男  |
| 11 | 男  |
| 12 | 男  |
| 13 | 男  |
| 14 | 男  |
| 15 | 男  |
| 16 | 女  |
| 17 | 男  |
+----+-----+
17 rows in set (0.01 sec)
