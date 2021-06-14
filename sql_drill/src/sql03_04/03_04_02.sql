■問題文
ユーザテーブル（usr）上のメールアドレスをすべてNULL値でクリアしてみましょう。空欄を埋めて、正しいSQL命令を完成させてみましょう。
UPDATE
	[空欄①]
SET
	[空欄②]
;

■実行文
# ユーザテーブルを更新する
UPDATE
	usr
# メールアドレスをすべてNULLに更新する
SET
	email = NULL
;

■確認
mysql> # ユーザテーブルを更新する
mysql> UPDATE
    -> usr
    -> # メールアドレスをすべてNULLに更新する
    -> SET
    -> email = NULL
    -> ;
Query OK, 21 rows affected (0.01 sec)
Rows matched: 21  Changed: 21  Warnings: 0

【Before】
mysql> select email from usr;
+------------------------+
| email                  |
+------------------------+
| inoue@wings.msn.to     |
| uehara@wings.msn.to    |
| emoto@wings.msn.to     |
| ono@examples.com       |
| kawai@wings.msn.to     |
| taro_yama@wings.msn.to |
| kino@wings.msn.to      |
| kubota@wings.msn.to    |
| kodama@wings.msn.to    |
| saka@examples.com      |
| shimi@wings.msn.to     |
| yaguchi@wings.msn.to   |
| yuki@wings.msn.to      |
| yoshi@examples.com     |
| wada@wings.msn.to      |
| matsu@wings.msn.to     |
| minami@wings.msn.to    |
| murai@wings.msn.to     |
| morimo@examples.com    |
| nishi@wings.msn.to     |
| negi@wings.msn.to      |
+------------------------+
21 rows in set (0.00 sec)

【After】
mysql> select email from usr;
+-------+
| email |
+-------+
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
| NULL  |
+-------+
21 rows in set (0.01 sec)