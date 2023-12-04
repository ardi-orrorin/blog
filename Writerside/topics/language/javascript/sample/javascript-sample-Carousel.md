# Carousel


## Style
```html
<style>
    .container {
        text-align: center;
        border: 1px solid black;
        overflow-x: hidden;
    }

    .wrapperCarousel {
        position: relative;
        width: 400px;
        height: 200px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        border: none
    }

    .carousel {
        width: 400px;
        height: 200px;
        display: inline-flex;
        /* gap: 20px; */
        overflow-x: hidden;
    }
    
    .box {
        min-width: 400px;
        min-height: 200px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 50px;
        font-weight: bold;
        color: white;
    }

    .btn {
        min-width: 50px;
        min-height: 50px;
        display: flex;
        position: absolute;
        z-index: 99;
        align-items: center;
        justify-content: center;
        border-radius: 200px;
        background-color: white;
        border: none;
        transition: 0.35s;
        opacity: 0.5;
    }
    .btn:hover {
        opacity: 1;
    }

    .rightBtn {
        right: -25px;
    }
    .leftBtn {
        left: -25px;
    }
    .centerBtn {
            left: 45%;
        }
</style>
```

## HTML
```html

<div class="container">
    <div class="wrapperCarousel">
        <div class="carousel">
            <div class="box" style="background-color: aqua;">1</div>
            <div class="box" style="background-color: red;">2</div>
            <div class="box" style="background-color: blanchedalmond;">3</div>
            <div class="box" style="background-color: blue;">4</div>
            <div class="box" style="background-color: violet;">5</div>
            <div class="box" style="background-color: brown;">6</div>
        </div>
        <button class="btn leftBtn" onclick="scrollLeftMove()"><<</button>
        <button class="btn rightBtn" onclick="scrollRightMove()">>></button>
        <button class="btn centerBtn" onclick="stopCarousel()">ㅁ</button>
    </div>
</div>
```

## Javascript
```html
<script>
    const carousel = document.querySelector('.carousel');
    const carouselWidth = carousel.offsetWidth;

    const box = document.querySelectorAll('.box');
    const boxWidth = box[0].offsetWidth;
    const boxLength = box.length;
    const boxTotalWidth = boxWidth * boxLength;
    
    let carouselInterval = setInterval(scrollRightMove, 2000);
    let isCarouselInteval = true;

    function scrollLeftMove() {
        carousel.scrollLeft -= boxWidth;
    }

    function scrollRightMove() {
        if(carousel.scrollLeft >= boxTotalWidth - boxWidth) {
            carousel.scrollLeft = 0;
        } else {
            carousel.scrollLeft += boxWidth;
        }
    }

    function stopCarousel() {
        if(isCarouselInteval) {
            isCarouselInteval = false;
            clearInterval(carouselInterval);
            document.querySelector('.centerBtn').innerText = '▶';
        } else {
            isCarouselInteval = true;
            document.querySelector('.centerBtn').innerText = 'ㅁ';
            carouselInterval = setInterval(scrollRightMove, 2000);
        }
    }
    
</script>

```

## Result
![](javascript-sample-carousel.gif) {thumbnail="true"}


## animation 적용
```html
<style>
    .carousel {
        transition: 0.35s; // 애니메이션 추가
    }
</style>

<script>
    let position = 0 // 위치 변수 추가
    
    function scrollLeftMove() { // 함수 내용 수정
        if(position >= 0) {
            position = -(boxTotalWidth - boxWidth);
            carousel.style.translate = `${position}px`;
        } else {
            position += boxWidth;
            carousel.style.translate = `${position}px`;
        }
    }
    
    function scrollRightMove() { // 함수 내용 수정
        if(position <= -(boxTotalWidth - boxWidth)) {
            position = 0;
            carousel.style.translate = `${position}px`;
        } else {
            position -= boxWidth;
            carousel.style.translate = `${position}px`;
        }
        console.log(position);
    }
</script>
```

## Result-Animation
![](javascript-sample-carousel-animation.gif) {thumbnail="true"}