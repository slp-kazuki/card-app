# 画像があるフォルダへのパス（現在の場所にある 'images' フォルダ）
$imagePath = ".\images"

# 日本語名と英語名の対応リスト
$renameList = @{
    "あじさい.PNG" = "ajisai.png"; "いちご.PNG" = "strawberry.png"; "いちょう.PNG" = "ginkgo.png"; "うどん.PNG" = "udon.png"; "ウマ.PNG" = "horse.png";
    "エアコン.PNG" = "air_conditioner.png"; "えだまめ.PNG" = "edamame.png"; "おでん.PNG" = "oden.png"; "おにぎり.PNG" = "onigiri.png"; "オムライス.PNG" = "omurice.png";
    "お花見.PNG" = "cherry_blossom_viewing.png"; "お月見.PNG" = "moon_viewing.png"; "お寺.PNG" = "temple.png"; "お城.PNG" = "castle.png"; "お弁当.PNG" = "obento.png";
    "お餅.PNG" = "mochi.png"; "かき氷.PNG" = "shaved_ice.png"; "がっこう.PNG" = "school.png"; "かぼちゃ.PNG" = "pumpkin.png"; "カメ.PNG" = "turtle.png";
    "カメラ.PNG" = "camera.png"; "カラス.PNG" = "crow.png"; "カレー.PNG" = "curry.png"; "キウイ.PNG" = "kiwi.png"; "きのこ.PNG" = "mushroom.png";
    "キャベツ.PNG" = "cabbage.png"; "きゅうり.PNG" = "cucumber.png"; "くし.PNG" = "comb.png"; "クリスマスツリー.PNG" = "xmas_tree.png"; "ケーキ.PNG" = "cake.png";
    "こいのぼり.PNG" = "koinobori.png"; "こども.PNG" = "child.png"; "こま.PNG" = "top_toy.png"; "コンパス.PNG" = "compass.png"; "ご飯.PNG" = "rice.png";
    "サカナ.PNG" = "fish.png"; "さかなつり.PNG" = "fishing.png"; "さくらんぼ.PNG" = "cherry.png"; "サッカー.PNG" = "soccer.png"; "さつまいも.PNG" = "sweet_potato.png";
    "サンドウィッチ.PNG" = "sandwich.png"; "シカ.PNG" = "deer.png"; "ししまい.PNG" = "lion_dance.png"; "しまうま.PNG" = "zebra.png"; "じゃがいも.PNG" = "potato.png";
    "スイカ.PNG" = "watermelon.png"; "ゼリー.PNG" = "jelly.png"; "せんべい.PNG" = "rice_cracker.png"; "ソフトクリーム.PNG" = "soft_serve.png"; "だいこん.PNG" = "daikon.png";
    "たこあげ.PNG" = "kite_flying.png"; "たこ焼き.PNG" = "takoyaki.png"; "たまご.PNG" = "egg.png"; "たまねぎ.PNG" = "onion.png"; "たんぽぽ.PNG" = "dandelion.png";
    "ツバメ.PNG" = "swallow.png"; "テニス.PNG" = "tennis.png"; "とうもろこし.PNG" = "corn.png"; "ドーナツ.PNG" = "donut.png"; "トマト.PNG" = "tomato.png";
    "トラック.PNG" = "truck.png"; "どら焼き.PNG" = "dorayaki.png"; "なす.PNG" = "eggplant.png"; "にんじん.PNG" = "carrot.png"; "ねぎ.PNG" = "green_onion.png";
    "バイク.PNG" = "bike.png"; "パイナップル.PNG" = "pineapple.png"; "はさみ.PNG" = "scissors.png"; "バス.PNG" = "bus.png"; "バスケ.PNG" = "basketball.png";
    "パスタ.PNG" = "pasta.png"; "パソコン.PNG" = "pc.png"; "パトカー.PNG" = "police_car.png"; "ばなな.PNG" = "banana.png"; "バラ.PNG" = "rose.png";
    "バレーボール.PNG" = "volleyball.png"; "パン.PNG" = "bread.png"; "ハンバーガー.PNG" = "hamburger.png"; "ピーマン.PNG" = "bell_pepper.png"; "ひなまつり.PNG" = "hinamatsuri.png";
    "ひまわり.PNG" = "sunflower.png"; "ぶどう.PNG" = "grape.png"; "プリン.PNG" = "pudding.png"; "ヘリコプター.PNG" = "helicopter.png"; "ペンギン.PNG" = "penguin.png";
    "ボウリング.PNG" = "bowling.png"; "ほうれんそう.PNG" = "spinach.png"; "マスク.PNG" = "mask.png"; "みかん.PNG" = "mandarin.png"; "メロン.PNG" = "melon.png";
    "もみじ.PNG" = "maple.png"; "もも.PNG" = "peach.png"; "ヤギ.PNG" = "goat.png"; "りんご.PNG" = "apple.png"; "レモン.PNG" = "lemon.png";
    "れんこん.PNG" = "lotus_root.png"; "飴.PNG" = "candy.png"; "医師.PNG" = "doctor.png"; "羽子板.PNG" = "battledore.png"; "映画館.PNG" = "cinema.png";
    "鉛筆.PNG" = "pencil.png"; "温度計.PNG" = "thermometer.png"; "下駄.PNG" = "geta.png"; "家.PNG" = "house.png"; "花火.PNG" = "fireworks.png";
    "柿.PNG" = "persimmon.png"; "眼鏡.PNG" = "glasses.png"; "気球.PNG" = "hot_air_balloon.png"; "救急車.PNG" = "ambulance.png"; "牛乳.PNG" = "milk.png";
    "魚屋さん.PNG" = "fish_market.png"; "橋.PNG" = "bridge.png"; "蕎麦.PNG" = "soba.png"; "鏡餅.PNG" = "kagamimochi.png"; "靴.PNG" = "shoes.png";
    "警察官.PNG" = "police_officer.png"; "剣道.PNG" = "kendo.png"; "公園.PNG" = "park.png"; "財布.PNG" = "wallet.png"; "桜.PNG" = "cherry_blossom.png";
    "三色団子.PNG" = "dango.png"; "傘.PNG" = "umbrella.png"; "山登り.PNG" = "mountain_climbing.png"; "自転車.PNG" = "bicycle.png"; "七夕.PNG" = "tanabata.png";
    "車.PNG" = "car.png"; "寿司.PNG" = "sushi.png"; "柔道.PNG" = "judo.png"; "消しゴム.PNG" = "eraser.png"; "消防士.PNG" = "firefighter.png";
    "消防車.PNG" = "fire_engine.png"; "信号.PNG" = "signal.png"; "新幹線.PNG" = "shinkansen.png"; "新聞紙.PNG" = "newspaper.png"; "神社.PNG" = "shrine.png";
    "赤ちゃん.PNG" = "baby.png"; "洗濯機.PNG" = "washing_machine.png"; "船.PNG" = "ship.png"; "相撲.PNG" = "sumo.png"; "鯛焼き.PNG" = "taiyaki.png";
    "卓球.PNG" = "table_tennis.png"; "鶴.PNG" = "crane.png"; "定規.PNG" = "ruler.png"; "電車.PNG" = "train.png"; "電卓.PNG" = "calculator.png";
    "電話.PNG" = "phone.png"; "豆まき.PNG" = "bean_throwing.png"; "肉.PNG" = "meat.png"; "猫.PNG" = "cat.png"; "納豆.PNG" = "natto.png";
    "梅の花.PNG" = "plum_blossom.png"; "白菜.PNG" = "hakusai.png"; "白鳥.PNG" = "swan.png"; "八百屋さん.PNG" = "greengrocer.png"; "飛行機.PNG" = "airplane.png";
    "病院.PNG" = "hospital.png"; "封筒.PNG" = "envelope.png"; "包丁.PNG" = "kitchen_knife.png"; "万年筆.PNG" = "fountain_pen.png"; "門松.PNG" = "kadomatsu.png";
    "野球.PNG" = "baseball.png"; "郵便局.PNG" = "post_office.png"; "あさがお.PNG" = "morning_glory.png"
}

# 実行処理
Write-Host "リネームを開始します..."
if (Test-Path $imagePath) {
    Set-Location $imagePath
    foreach ($oldName in $renameList.Keys) {
        if (Test-Path $oldName) {
            Rename-Item -Path $oldName -NewName $renameList[$oldName]
            Write-Host "変更完了: $oldName -> $($renameList[$oldName])"
        }
    }
    Write-Host "すべての処理が完了しました！"
} else {
    Write-Host "エラー: imagesフォルダが見つかりません。"
}