■問題文
アンケート回答テーブル（quest）と社員テーブル（employee）から女性の氏名（カナ）だけを、氏（カナ）・名（カナ）昇順で取り出してみましょう。
なお、重複データがあってもそのまま出力するものとします。以下の空欄を埋めてSQL命令を完成させてください。
SELECT
	q.name_kana
FROM
	quest AS q
WHERE
	[空欄①]
[空欄②]
	SELECT
		[空欄③]
	FROM
		employee AS e
	WHERE
		e.sex = 2
ORDER BY
	[空欄④]
;
■実行文
#アンケート回答テーブルから女性の氏名（カナ）を取り出す
SELECT
	q.name_kana
FROM
	quest AS q
WHERE
	q.sex = '女'
# 重複したデータも含め取得したデータを統合する
UNION ALL
#社員テーブルから女性の氏（カナ）・名（カナ）を取り出す（アンケート回答テーブルのデータと統合するため氏名を結合した形で取得）
	SELECT
		CONCAT(e.l_name_kana, e.f_name_kana)
	FROM
		employee AS e
	WHERE
		e.sex = 2
＃統合したデータの１列目、つまり氏名について昇順で取り出す
ORDER BY
	1 ASC
;
■返却値
mysql> SELECT
    -> q.name_kana
    -> FROM
    -> quest AS q
    -> WHERE
    -> q.sex = '女'
    -> UNION ALL
    -> SELECT
    -> CONCAT(e.l_name_kana, e.f_name_kana)
    -> FROM
    -> employee AS e
    -> WHERE
    -> e.sex = 2
    -> ORDER BY
    -> 1
    -> ;
+----------------+
| name_kana      |
+----------------+
| イノウエマリ   |
| ウエハラハルカ |
| エモトシュウコ |
| オノヒロミ     |
| カワグチユウコ |
| サトウトモコ   |
| シミズハルコ   |
| タナカマユコ   |
| チカダアキコ   |
| ツムラカズミ   |
| トガワヨシミ   |
| ナカザワヤスヨ |
| ネギシアユミ   |
| ノガミリエ     |
| ヤマダナミ     |
+----------------+
15 rows in set (0.00 sec)