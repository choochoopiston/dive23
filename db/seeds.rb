# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tag.create!( [
              { name: 'javascript',content: 'JavaScriptとは、プログラミング言語のひとつである。Javaと名前が似ているが、異なるプログラミング言語である。 オブジェクト指向のスクリプト言語であることを特徴とする。 ' }, 
              { name: 'swift' ,content: 'Swiftとは、iOS・OS X開発のためにAppleが開発したプログラム言語である。Objective-CやObjective-C++、C言語と共存することも考慮されており、比較的スムーズに移行できるとされている。' },
              { name: 'ios' ,content: 'iOSはAppleが開発したiPhone、iPod touch、iPadそしてApple TV (第二世代以降) などのモバイルデバイス用のオペレーティングシステムです。。' },
              { name: 'android' ,content: 'AndroidはGoogleが開発しているデジタル機器(スマートフォン、タブレット、自動車、TV、時計)向けのOSです。' },
              { name: 'ruby-on-rails' ,content: 'Ruby on RailsはRubyで書かれたオープンソースのWebアプリケーションフレームワークです。MVCモデルに基づいた開発を行うことができます。' },
              { name: 'php' ,content: 'PHPはWeb開発において、多様な目的で広く利用されるオープンソースのスクリプト言語です。' },
              { name: 'java' ,content: 'Javaは、オブジェクト指向プログラミング言語の1つ。Javaで開発されたアプリケーションはJava仮想マシンの中で動作するため、アプリケーション自体はプラットフォームに依存せず動作することが出来る。' },
              { name: 'monaca' ,content: 'Monacaは、Cordovaを内包したHTML5ハイブリッドアプリ開発プラットフォームです。HTML5でマルチプラットフォーム対応のモバイルアプリ開発が行えます。' },
              { name: 'ruby' ,content: 'Rubyはマルチプラットフォームで動作するオブジェクト指向のインタプリタ言語。1993年にまつもとゆきひろ氏(Matz)が開発した。' },
              { name: 'objective-c' ,content: 'Objective-Cは、プログラミング言語の一種。C言語をベースにSmalltalk型のオブジェクト指向機能を持たせた上位互換言語である。' },
              { name: 'xcode' ,content: 'Xcode自身の使い方・設定に関する質問で使うタグ。Mac/iOSプログラミングに関する質問につける必要はありません。Xcodeはソフトウェアを開発するためのアップルの統合開発環境(IDE)' },
              { name: 'python' ,content: 'Python(パイソン)とは、コードの視認性を高められるように設計されたスクリプト言語。スクリプト言語ではあるが、サードパーティ製のツールを使うことで、スタンドアローンの実行ファイルを作成する' },
              { name: 'c#' ,content: 'マイクロソフトが開発したマルチパラダイムプログラミング言語です。' },
              { name: 'html' ,content: 'HTML（エイチティーエムエル）とは、ウェブ上の文書を記述するためのマークアップ言語である。文章の中に記述することでさまざまな機能を記述設定することができる。' },
              { name: 'jquery' ,content: 'jQueryとは、ジョン・レシグによって開発された、JavaScriptのライブラリである。エレメントの指定がCSSセレクタと同様の記述で選択ができる。' },
              { name: 'mysql' ,content: 'MySQL（マイエスキューエル）は、オラクルが開発するRDBMS（リレーショナルデータベースを管理、運用するためのシステム）。オープンソースで開発されており、GNU GPLと商用ライセンスのデュアルライセンスとなっている。' },
              { name: 'c++' ,content: 'C++（シープラスプラス）は、汎用プログラミング言語の一つである。日本では略してシープラプラ、シープラなどとも呼ばれる。' },
              { name: 'linux' ,content: 'Linuxとは、Linuxカーネルを用いたオペーレーティングシステム(OS)を意味します。 unix 系OS の一種です。' },
              { name: 'unity3d' ,content: 'Unity（別名:Unity3D）とは、統合開発環境を内蔵し、複数のプラットホームに対応する、ユニティ・テクノロジーズが開発したゲームエンジンである。' },
              { name: 'ox-x' ,content: 'OS Xはアップルが開発したデスクトップ用オペレーティングシステムです。OS XはMac OS 9の後継で\'X\'は10という意味です。OS Xは、1996年にアップルが買収したNeXT Inc.が、1980年代から' },
              { name: 'css' ,content: 'CSS(Cascading Style Sheets)とは、HTMLやXMLをどのように装飾するかを規定する仕様。従来のHTMLを、「構造」と「体裁」を分離するために提唱された。CSSでは、各メディアに合わ' },
              { name: 'windows' ,content: 'WindowsはMicrosoft社が開発したクライアント、サーバー、モバイル用のOS製品群の総称です。 開発の際のWindows環境にまつわる質問にこのタグを利用してください。' },
              { name: 'html5' ,content: 'HTML5 (HyperText Markup Language 5)とは、人間に読解が容易なセマンティックなコーディングを特徴とする、HTMLの5番目のバージョンである。HTML 4.xと比べ、より厳密な文章構造を要求する仕様となっている。' },
              { name: 'c' ,content: 'C言語（シーげんご）は、1972年にAT&Tベル研究所のデニス・リッチーが主体となって作ったプログラミング言語である。' },
              { name: 'iphone' ,content: 'iPhone(アイフォーン)とは、Apple社が製造しているスマートフォンである。2007年1月に最初のモデルが発表され、同年6月に発売された。ポータブル音楽プレーヤー・携帯電話・PDAの機能を併せ持つ端末として発売。' },
              { name: 'git' ,content: 'Gitはオープンソースの分散型バージョン管理システムです。' }
            ] )