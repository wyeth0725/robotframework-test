*** Settings ***
Documentation    テスト用キーワードリスト
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***

*** Keywords ***
Chromeで${url}を開く
    Open Browser    ${url}    Chrome

${keyword}を検索する
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

一番上のリンクをクリックする
    [Arguments]    ${link}
    Click Element    ${link}

ページタイトルをコンソールに出力する
    [Arguments]    ${title}
    Log To Console    ${title}