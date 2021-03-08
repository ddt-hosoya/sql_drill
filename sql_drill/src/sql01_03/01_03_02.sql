■問題
アクセス記録テーブル（access_log）からリンク元URLを重複のない形式で取り出してみましょう。以下の空欄を埋めてSQL命令を完成させてください。
[①空欄]
	referer
[②空欄]
	access_log
;

■実行文
# 重複がない形でリンク元URLを取り出す
SELECT DISTINCT
	referer
# アクセス記録テーブルから取得
FROM
	access_log
;


■返却値
mysql> SELECT DISTINCT
    -> referer
    -> FROM
    -> access_log
    -> ;
+---------------------------+
| referer                   |
+---------------------------+
| http://wings.msn.to/hamu/ |
| http://wings.msn.to/neko/ |
| http://wings.msn.to/inu/  |
| http://wings.msn.to/saru/ |
| http://wings.msn.to/tori/ |
| http://wings.msn.to/kame/ |
| NULL                      |
+---------------------------+
7 rows in set (0.01 sec)