BatLibrary
==========

Library of BAT files


# 環境変数の設定
- LOCAL = このフォルダ
- LOCAL_BIN = %LOCAL%\links
- PATH = %PATH%;%LOCAL_BIN%


# フォルダ階層
	%LOCAL%
	*	+---bin 			… BATファイル(基本的なコマンド)
	*	+---bin-UNIX		… UNIXコマンドのクローン
	*	+---bin-scripts		… VBScript・JScript
		|
		+---etc				… コンフィグ用フォルダ。
		|						初期設定は skel\etcよりコピー
		|
	*	+---skel			… 設定の雛形
		|   +---etc
		|   +---links
		|   +---sched
		|   |   +---rc.init
		|   |   +---rc.init2
		|   \   \---rc.shutdown
		|
		+---sched			… 起動・終了スクリプト格納フォルダ
		|   |					※初期設定は skel\schedよりコピー
		|   +---rc.init		… 起動時に必ず実行するコマンド(ショートカット)
		|   +---rc.init2	… 起動時に実行するコマンド(ショートカット) 再起動時は実行されない
		|   \---rc.shutdown	… シャットダウン(seeyouコマンド)時に実行されるコマンド
		|
		+---links			… 「ファイル名を指定して実行」により起動したいショートカットを格納する
		|						* 環境変数PATHに、このフォルダを追加しておく
		|
		+---var				… ログなどの出力先
		|
		\---tools           … サードパーティー製のツールはここに

  「*」付きのフォルダをバージョン管理する