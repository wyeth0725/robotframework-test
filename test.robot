*** Settings ***
Documentation   Google検索テスト
Resource    keywords.robot

*** Variables ***
${result_num} =    7

*** Test Cases ***
Googleでみんなのpython勉強会を検索するテスト
    ChromeでGoogleを開く
    みんなのPython勉強会を検索する
    ${links} =    結果を取得する    #    変数の返り値を受け取る
    結果をターミナルに出力する    links=${links}    #    Arguments 指定．左辺が関数内での変数名となるので a=${links} とした場合 [Arguments] は，${a}になる
    結果${links}は${result_num}件である    #    キーワードに変数を埋め込むと引数として自動で受け取る ただし，Variablesで定義した変数はグローバル変数扱いになるが，別のキーワード内で値を変更した場合，その関数内でしか変更が保持されない（pythonみたいにポインタを自動で使ってくれるわけではない）
    一番上のリンクをクリックする    link=@{links}[0]
    ブラウザを閉じる

