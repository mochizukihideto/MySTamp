document.addEventListener('DOMContentLoaded', function() {
    const hobbyInput = document.getElementById('hobby');
    const fontPreview = document.getElementById('fontPreview');
    const fontInput = document.getElementById('font');
    const savedStamps = document.getElementById('savedStamps');
    const confirmationDialog = document.getElementById('confirmationDialog');
    const finalStamp = document.getElementById('finalStamp');
    const selectedStamp = document.getElementById('selectedStamp');
    const stampSelection = document.getElementById('stampSelection');
    const frequencyType = document.getElementById('frequencyType');
    const frequencyCount = document.getElementById('frequencyCount');
    const frequencyUnit = document.getElementById('frequencyUnit');
    const intermediateGoalType = document.getElementById('intermediateGoalType');
    const intermediateGoalCount = document.getElementById('intermediateGoalCount');
    const intermediateGoalUnit = document.getElementById('intermediateGoalUnit');
    let currentSelectedStamp = null;

    const fonts = [
        { name: 'BebasNeue', label: 'Bebas Neue' },
        { name: 'DancingScript', label: 'Dancing Script' },
        { name: 'FredokaOne', label: 'Fredoka One' },
        { name: 'IndieFlower', label: 'Indie Flower' },
        { name: 'Pacifico', label: 'Pacifico' },
        { name: 'PermanentMarker', label: 'Permanent Marker' },
        { name: 'Roboto', label: 'Roboto' },
        { name: 'NotoSansJP', label: 'Noto Sans Japanese' }
    ];

    function createFontOptions() {
        fonts.forEach(font => {
            const div = document.createElement('div');
            div.className = 'font-option';
            div.style.fontFamily = font.label;
            div.textContent = hobbyInput.value || font.label;
            div.dataset.font = font.name;
            fontPreview.appendChild(div);

            div.addEventListener('click', function() {
                document.querySelectorAll('.font-option').forEach(el => el.classList.remove('selected'));
                this.classList.add('selected');
                fontInput.value = this.dataset.font;
            });
        });
    }

    function updateFontPreviews() {
        document.querySelectorAll('.font-option').forEach(div => {
            div.textContent = hobbyInput.value || div.dataset.font;
        });
    }

    function updateFrequencyUnit() {
        switch (frequencyType.value) {
            case 'daily':
                frequencyUnit.textContent = '回/日';
                frequencyCount.max = 24;
                break;
            case 'weekly':
                frequencyUnit.textContent = '回/週';
                frequencyCount.max = 7;
                break;
            case 'monthly':
                frequencyUnit.textContent = '回/月';
                frequencyCount.max = 31;
                break;
        }
        if (parseInt(frequencyCount.value) > parseInt(frequencyCount.max)) {
            frequencyCount.value = frequencyCount.max;
        }
    }

    function updateIntermediateGoalUnit() {
        switch (intermediateGoalType.value) {
            case 'week':
                intermediateGoalUnit.textContent = '週間後';
                intermediateGoalCount.max = 52; // 最大1年（52週）
                break;
            case 'month':
                intermediateGoalUnit.textContent = 'ヶ月後';
                intermediateGoalCount.max = 12; // 最大1年（12ヶ月）
                break;
            case 'year':
                intermediateGoalUnit.textContent = '年後';
                intermediateGoalCount.max = 10; // 最大10年
                break;
        }
        if (parseInt(intermediateGoalCount.value) > parseInt(intermediateGoalCount.max)) {
            intermediateGoalCount.value = intermediateGoalCount.max;
        }
    }

    createFontOptions();

    hobbyInput.addEventListener('input', updateFontPreviews);

    // 初期選択
    document.querySelector('.font-option[data-font="BebasNeue"]').classList.add('selected');

    savedStamps.addEventListener('click', function(e) {
        const stampElement = e.target.closest('.saved-stamp');
        if (stampElement) {
            currentSelectedStamp = stampElement;
            confirmationDialog.style.display = 'block';
        }
    });

    document.getElementById('confirmYes').addEventListener('click', function() {
        if (currentSelectedStamp) {
            stampSelection.style.display = 'none';
            confirmationDialog.style.display = 'none';
            finalStamp.style.display = 'block';
            selectedStamp.innerHTML = currentSelectedStamp.innerHTML;
        }
    });

    document.getElementById('confirmNo').addEventListener('click', function() {
        confirmationDialog.style.display = 'none';
        currentSelectedStamp = null;
    });

    frequencyType.addEventListener('change', updateFrequencyUnit);
    intermediateGoalType.addEventListener('change', updateIntermediateGoalUnit);

    // 初期表示時にも単位を設定
    updateFrequencyUnit();
    updateIntermediateGoalUnit();

    // 追加情報フォームの送信処理
    document.getElementById('additionalInfoForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const formData = new FormData(this);
        const data = Object.fromEntries(formData.entries());
        
        // 中間目標の表示用テキストを作成
        const intermediateGoalText = `${data.intermediateGoalCount}${data.intermediateGoalType === 'month' ? 'ヶ' : ''}${intermediateGoalUnit.textContent}`;
        console.log('中間目標:', intermediateGoalText);
        
        // ここでデータを処理または送信
        console.log('送信されたデータ:', data);
        
        // 例: サーバーへのデータ送信（実際の実装時にコメントを解除）
        /*
        fetch('save_additional_info.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            // 成功時の処理（例：完了メッセージの表示）
        })
        .catch((error) => {
            console.error('Error:', error);
            // エラー時の処理
        });
        */
    });
});