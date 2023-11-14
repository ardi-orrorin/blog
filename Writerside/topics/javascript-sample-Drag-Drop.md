# Drag&amp;Drop

## 1. element add attribute draggable="true"
```HTML
<div draggable="true" class="box">A</div>
```

## 2. add event listener
```javascript
let items = document.querySelector('.box')
item.addEventListener('dragstart', function(e) =>{
    console.log(e);
    // 배경색을 빨간색으로 변경
    this.style.backgroundColor = 'red'
});
```

## 3. Drag Attribute List
drag event wait 마우스 커서 기준

1. **dragstart** :  드래그 시작시
2. **drag** : 드래그 시작점 엘리먼트
3. **dragenter** : 다른 ele 위를 겹칠때 한 번 실행
4. **dragover** : 다른 ele 겹칠 때 계속 실행
5. **dragleave** : 다른 ele 위를 떠날 때 한 번 실행
6. **drop** : 드롭 완료시
7. **dragend** : 드래그 종료시
                 

## 4, example

```CSS
### CSS ###
.container {
    width: 100%;
    height: 500px;
    border: 1px solid black;
    display: inline-block;
    position: relative;
    
}

.full {
    width: 100%;
    height: 100%;
} 
#preview {
    position: absolute;
    z-index: 1;
    object-fit: contain;
}
#whiteBox {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: white;
    position: absolute;
    z-index: 10;
}
#file {
    opacity: 0;
    z-index: 100;
    position: absolute;
}
```
```HTML
<-- HTML -->
<div id="previewBox" class="container">
    <div id="whiteBox" class="full">
        <h1>여기에 파일을 올려 놓으세요</h1>
    </div>
    <img id="preview" class="full" src="">
    <input id="file" class="full" type="file" draggable="true">
</div>
```         

```javascript
// javascript

const inputFile = document.querySelector('#file')
inputFile.addEventListener('drop', function(e){
    console.log(e.dataTransfer.files[0]);

    const file = e.dataTransfer.files[0];
    
    const previewEl = document.querySelector('#preview')
    
    previewEl.src = URL.createObjectURL(file)
    
    const whiteBox = document.querySelector('#whiteBox')
    whiteBox.style.opacity = '0'
})

inputFile.addEventListener('dragenter', function(e){
    const whiteBox = document.querySelector('#whiteBox')
    whiteBox.style.opacity = '0.4'
})
inputFile.addEventListener('dragleave', function(e){
    const whiteBox = document.querySelector('#whiteBox')
    whiteBox.style.opacity = '0'
})

```

![](javascript-sample-drag-drop-1.jpg) {thumbnail="true"}

![](javascript-sample-drag-drop-2.jpg) {thumbnail="true"}

![](javascript-sample-drag-drop-3.jpg) {thumbnail="true"}