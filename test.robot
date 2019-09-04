*** Settings ***
Documentation   Google検索テスト
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***
${result_num} =    10

*** Test Cases ***
Googleでみんなのpython勉強会を検索するテスト
    #    動かん    Append To Environment Variable    PATH    ${CURDIR}a/chromedriver.exe
    ChromeでGoogleを開く
    みんなのPython勉強会を検索する
    ${links} =    結果を取得する    #    変数の返り値を受け取る
    結果をターミナルに出力する    links=${links}    #    Arguments 指定．左辺が関数内での変数名となるので a=${links} とした場合 [Arguments] は，${a}になる
    結果${links}は${result_num}件である    #    キーワードに変数を埋め込むと引数として自動で受け取る ただし，Variablesで定義した変数はグローバル変数扱いになるっが，別のキーワード内で値を変更した場合，その関数内でしか変更が保持されない（pythonみたいにポインタを自動で使ってくれるわけではない）
    ブラウザを閉じる

*** Keywords ***
ChromeでGoogleを開く
    Open Browser    https://google.co.jp    Chrome

みんなのPython勉強会を検索する
    Input Text    name=q    みんなのPython勉強会
    Press Key    name=q    \\13

結果を取得する
    ${links} =    Get Webelements    css=h3 > div
    #{result_num} =    20
    [Return]    ${links}

結果をターミナルに出力する    #    渡される変数名は links=${links} の左辺になる．つまり a=${links} にしたら [Arguments]    ${a} と書かないと認識されない
    [Arguments]    ${links}
    :For    ${link}    IN    @{links}
        \    ${text} =    Get Text    ${link}
        \    Log To Console    ${text}

結果${links}は${result_num}件である
    Length Should Be    ${links}    ${result_num}

ブラウザを閉じる
    Close Browser