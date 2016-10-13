# 既定のフォーマット
# default => "2014-10-01 09:00:00 +0900"
# long    => "October 01, 2014 09:00"
# short   => "01 Oct 09:00"
# db      => "2014-10-01 00:00:00"

# カスタムフォーマットを定義
Time::DATE_FORMATS[:md_and_HM] = "%-m月%e日 %k:%M"
Time::DATE_FORMATS[:ymd_and_HM] = "%Y年%-m月%e日 %H時%M分"
Time::DATE_FORMATS[:ymd_and_HM2] = "%y年%-m月%e日 %H:%M"
Time::DATE_FORMATS[:ymd] = "%y年%-m月%e日"
