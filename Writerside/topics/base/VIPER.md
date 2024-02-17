# VIPER

## Overview
Veiw, Interactor, Presenter, Entity, Router로 구성된 아키텍처 디자인 패턴이다.
각각의 이니셜을 따서 VIPER로 불리며 단일책인원칙 기반의 아키텍처이다.
응집도는 높고 결합도는 낮은 형태로, 역할 단위의 구분이 명확하다.

![](viper01.png)

## 특징
- View: 화면을 구현하는 역할으로 주로 Presenter와 상호 작용한다.
- Interactor: 데이터 또는 네트워크와 관련된 비즈니스 로직을 처리하는 단위로 주로 API호출 Data 관련된 작업을 처리한다.
- Presenter: View와 Interactor의 사이에서 UI관련 비즈니스 로직을 처리를 한다.
- Entity: 데이터 객체들을 정의하는 역할을 한다.
- Router: 화면이 언제 표시되어야 하는지 어떤 화면을 띄울지는 Navigation로직을 처리하는 곳
