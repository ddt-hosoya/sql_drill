■問題文
アンケート回答テーブル（quest）に「男性」「女性」「男」「女」と表記の揺らぎがありましたので、
これを「男」「女」という表記に統一したいと思います。以下のSQL命令を記述してみましたが、誤りがあり、正常に動作しません。
誤りを2点指摘してみましょう。
UPDATE INTO
	quest
VALUES
	sex=REPLACE(sex, '姓', '')
;

■実行文
指摘１：UPDATE文にINTOという記述は誤り
指摘２：UPDATE文で更新する列を指定する句はVALUESではなくSETが正しい

# アンケート回答テーブルを更新する
UPDATE
	quest
# 性別の表記を「男」「女」という表記に統一して更新する
SET
	sex=REPLACE(sex, '姓', '')
;

■確認
mysql> # アンケート回答テーブルを更新する
mysql> UPDATE
    -> quest
    -> # 性別の表記を「男」「女」という表記に統一して更新する
    -> SET
    -> sex=REPLACE(sex, '姓', '')
    -> ;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 17  Changed: 0  Warnings: 0

【Before】
mysql>  select sex from quest;
+-----+
| sex |
+-----+
| 男  |
| 女  |
| 女  |
| 女  |
| 女  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 女  |
| 男  |
+-----+
17 rows in set (0.00 sec)

【After】
mysql>  select sex from quest;
+-----+
| sex |
+-----+
| 男  |
| 女  |
| 女  |
| 女  |
| 女  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 男  |
| 女  |
| 男  |
+-----+
17 rows in set (0.00 sec)