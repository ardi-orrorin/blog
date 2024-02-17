# MVP

## Overview
Model View Presenter (MVP)으로 MVC에서 Controller가 하는 역할을 Presenter가 담당한다. 
View는 사용자의 입력을 받아 Presenter에게 전달하고,     
Presenter는 View로부터 받은 입력을 Model에게 전달하고,  
Model로부터 받은 결과를 View에게 전달한다.

## Description
- Model: 데이터 및 상수 역할
- View: 사용자에게 보여지고 인터랙션을 담당하는 역핳
- Presenter: View와 Model 사이에서 비즈니스로직을 처리를 담당한다.

![](design-mvp.jpg)


## MVC와의 차이점
- View와 Model의 의존성을 제거 한 패턴으로 Model 업데이트가 일어나면 View에 직접 업데이트가 일어나지 않고, Presenter를 통해 업데이트가 일어난다.



## MVP 장점
- View와 Model의 의존성을 제거하여 테스트가 용이하다.
- View와 Model의 의존성을 낮추서면 유지보수 및 추가 코드 작성시 Presenter에 집중할 수 있다.

## MVP 단점 {id="mvp_1"}
- View와 Model의 의존성을 제거하여 Presenter가 View와 Model에 의존성이 생긴다.
- 어플리케이션이 복잡해질수록 View Presenter의 의존성이 높아진다.

