// --- 変数定義 ---
let currentQueue = []; 
let currentIndex = 0;
let isLabelVisible = false;

const categories = ["食べ物", "動物", "乗り物", "生活用品", "その他"];
let activeCategories = [...categories]; 

// --- 起動時の処理 ---
window.onload = function() {
    initSettings();
    
    // イベント設定
    document.getElementById("start-btn").onclick = startQuiz;
    document.getElementById("next-btn").onclick = nextCard;
    document.getElementById("settings-btn").onclick = openSettings;
    document.getElementById("close-settings").onclick = closeSettings;
    document.getElementById("back-to-home").onclick = showStartScreen;
    
    // 新しいボタンたち
    document.getElementById("toggle-label-btn").onclick = toggleLabel;
    document.getElementById("home-btn").onclick = showStartScreen;
};

// --- 画面切り替え ---
function showStartScreen() {
    switchScreen("start-screen");
    stopConfetti(); // 紙吹雪を止める
}

function showQuizScreen() {
    switchScreen("quiz-screen");
}

function showEndScreen() {
    switchScreen("end-screen");
    startConfetti(); // 紙吹雪を開始
}

// 画面切り替えの共通関数
function switchScreen(screenId) {
    // 全ての画面からactiveを外す
    document.querySelectorAll(".screen").forEach(el => el.classList.remove("active"));
    // 指定した画面だけactiveにする
    document.getElementById(screenId).classList.add("active");
}

// --- クイズロジック ---
function startQuiz() {
    const filteredImages = imageList.filter(img => activeCategories.includes(img.category));

    if (filteredImages.length === 0) {
        alert("カテゴリーが1つも選ばれていません！");
        return;
    }

    currentQueue = shuffle(filteredImages);
    currentIndex = 0;

    showCard();
    showQuizScreen();
}

function showCard() {
    // 最後のカードを超えたら終了画面へ
    if (currentIndex >= currentQueue.length) {
        showEndScreen();
        return;
    }

    const imgData = currentQueue[currentIndex];
    
    // 画像セット
    const imgElement = document.getElementById("quiz-image");
    imgElement.src = "images/" + imgData.file;

    // 名前セット
    const labelElement = document.getElementById("quiz-label");
    labelElement.innerText = imgData.label;
    
    // 毎回隠す状態にリセット
    hideLabel(); 

    // カウンター更新
    document.getElementById("quiz-counter").innerText = (currentIndex + 1) + " / " + currentQueue.length;
}

function nextCard() {
    currentIndex++;
    showCard();
}

// --- ラベル表示・非表示の制御 ---
function hideLabel() {
    isLabelVisible = false;
    document.getElementById("quiz-label").classList.add("hidden-label");
    // アイコンを「閉じた目」にする
    document.getElementById("eye-icon").src = "images/eye_close.png";
}

function showLabel() {
    isLabelVisible = true;
    document.getElementById("quiz-label").classList.remove("hidden-label");
    // アイコンを「開いた目」にする
    document.getElementById("eye-icon").src = "images/eye_open.png";
}

function toggleLabel() {
    if (isLabelVisible) {
        hideLabel();
    } else {
        showLabel();
    }
}

// --- 設定関連 ---
function initSettings() {
    const listArea = document.getElementById("category-list");
    listArea.innerHTML = ""; 

    categories.forEach(cat => {
        const div = document.createElement("div");
        div.className = "cat-item";
        
        const checkbox = document.createElement("input");
        checkbox.type = "checkbox";
        checkbox.id = "cat-" + cat;
        checkbox.value = cat;
        checkbox.checked = true; 
        
        checkbox.onchange = function() {
            if (this.checked) {
                activeCategories.push(this.value);
            } else {
                activeCategories = activeCategories.filter(c => c !== this.value);
            }
        };

        const label = document.createElement("label");
        label.htmlFor = "cat-" + cat;
        label.innerText = cat;

        div.appendChild(checkbox);
        div.appendChild(label);
        listArea.appendChild(div);
    });
}

function openSettings() {
    document.getElementById("settings-modal").classList.remove("hidden");
}

function closeSettings() {
    document.getElementById("settings-modal").classList.add("hidden");
}

function shuffle(array) {
    const newArray = [...array];
    for (let i = newArray.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [newArray[i], newArray[j]] = [newArray[j], newArray[i]];
    }
    return newArray;
}

// --- 紙吹雪エフェクト ---
let confettiInterval;

function startConfetti() {
    const container = document.getElementById("confetti-container");
    container.innerHTML = ""; // クリア

    // 0.1秒ごとに紙吹雪を生成
    confettiInterval = setInterval(() => {
        createConfettiPiece(container);
    }, 100);
}

function stopConfetti() {
    clearInterval(confettiInterval);
    document.getElementById("confetti-container").innerHTML = "";
}

function createConfettiPiece(container) {
    const confetti = document.createElement("div");
    confetti.classList.add("confetti");
    
    // ランダムな色
    const colors = ["#ff6b6b", "#feca57", "#1dd1a1", "#5f27cd", "#54a0ff"];
    confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
    
    // ランダムな開始位置（横幅いっぱい）
    confetti.style.left = Math.random() * 100 + "%";
    
    // 落ちる速度（2秒〜5秒）
    confetti.style.animationDuration = (Math.random() * 3 + 2) + "s";
    
    // 終わったら削除してメモリ節約
    confetti.addEventListener("animationend", () => {
        confetti.remove();
    });

    container.appendChild(confetti);
}