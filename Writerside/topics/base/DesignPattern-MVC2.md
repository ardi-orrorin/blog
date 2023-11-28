# MVC2

## Overview
Spring에서 주로 사용 되는 디자인 패턴으로, 기본의 View와 Controller를 분리하여 사용하는 방식이다.

- MVC1 구조

![](design-mvc1.png)

- MVC2 구조

![](design-mvc2.png)

## 특징
- MVC1 패턴의 경우 애플리케이션이 커질 경우, JSP을 통해 VC가 모두 이뤄지므로, 재사용성, 가독성에서 힘들어져, 유지보수 비용이 증가한다.
- 이를 보완하기 위해 MVC2 패턴이 등장했고, Controller와 View를 분리하여 사용하게 되었다.
- Controller는 사용자의 요청을 받아, Service를 호출하고, 결과를 View에 전달한다.
- View는 Controller로부터 전달받은 데이터를 이용하여, 사용자에게 결과를 보여준다.