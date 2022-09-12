Peony Factory
===========
이젠 아카데미에서 진행한 팀 프로젝트 입니다.

공정별 에러 현황 및 제품 생산 분석 모니터링 및 상관 분석 시스템을 구축하는 프로젝트입니다.

Description
=============
* 개발 기간: 2022. 08. 29 ~ 2022. 09. 08 (약 2주)

* 참여 인원: Backend 4명

* 사용 기술

    - Spring 4.0, Apache Tomcat 9.0,  BootStrap, Mybatis
    
    - Java, Ajax, Jquery, Git, MVC Pattern
    
    - Oracle 11g DataBase
    
* 개발 목적

    개발 주제는 '공정별 에러 현황 및 제품 생산 분석 모니터링 및 상관분석 시스템 구축'입니다.
    제조업의 흐름을 이해하고 프로그램을 통해 관리자가 주문부터 생산까지 통제 가능하도록 구현하는 것입니다.
    그 과정에서 축적된 대량의 데이터를 차트를 통해 시각화하여 사용자가 데이터를 한 눈에 파악 할 수 있도록 하여
    궁극적으로 경영에 합리적인 의사결정을 하도록 하는 것이 목적입니다.

Work Flow
============
![image](https://user-images.githubusercontent.com/103230840/189595507-f2bf5a86-7e92-47ed-83eb-928383c8d1b0.png)


Views
===========
* 메인
![image](https://user-images.githubusercontent.com/103230840/188064325-27ba08af-0d33-45d0-9f28-d52e8da592ba.png)
![image](https://user-images.githubusercontent.com/103230840/188063505-a847cc09-89bf-4afd-a603-c55a2e7e370c.png)
* 항목별 목록
![image](https://user-images.githubusercontent.com/103230840/188063647-d4e5035f-ca26-4c61-9e5c-905c6ff85060.png)
* 실제 DB 연동하여 구현한 Chart (Echarts)
![image](https://user-images.githubusercontent.com/103230840/188654789-754a0c02-4377-4c05-88d7-784eeb53e136.png)

Tables
==========
![image](https://user-images.githubusercontent.com/103230840/189382850-76969c64-80a0-49a9-bf93-ec71d965f258.png)


Implementation
===========
* 메인 화면
![image](https://user-images.githubusercontent.com/103230840/189580609-98cb919a-e6bf-46fb-9115-18718b13163d.png)
    - 총 수주금액, 총 생산량, 불량률 통계 구현
![image](https://user-images.githubusercontent.com/103230840/189580900-f2957010-4e01-46e9-9ddc-ce54674a1f1a.png)
    - 비로그인 상태로는 다른 메뉴 접근 불가 , Interceptor 활용

* 정보 조회
![image](https://user-images.githubusercontent.com/103230840/189581228-906265be-23eb-4dca-aa8d-80ea9e2e8164.png)
![image](https://user-images.githubusercontent.com/103230840/189581372-8d745f76-e2a6-44c1-833c-85137ee2c718.png)
![image](https://user-images.githubusercontent.com/103230840/189581411-99b16f6a-ee8a-4645-ac5b-0d06e41aeaa3.png)
![image](https://user-images.githubusercontent.com/103230840/189581480-f44d22ca-5b67-4557-90aa-aca6e7384b35.png)

    - 페이징처리(10행 이상인 경우)

* 실제 데이터를 이용한 Echart구현(Js)
![image](https://user-images.githubusercontent.com/103230840/189594608-6d21db0e-272f-44b2-92e8-0c9763dca156.png)
![image](https://user-images.githubusercontent.com/103230840/189594355-6ad7fc29-e261-4d80-aa66-77ffd4cd4b05.png)
![image](https://user-images.githubusercontent.com/103230840/189594414-865b16da-3472-41a3-a3f0-d9eb53d9eb39.png)


* 체크박스 구현 : 선택된 항목만 요청 처리

![image](https://user-images.githubusercontent.com/103230840/189594885-a1defcb4-1568-4d41-8b0c-853f9dce007d.png)

    - 전체체크(전체체크 체크박스를 체크하면 전체가 체크되고 반대로 모든게 체크되면 전체체크 체크박스가 체크됨)
    
![image](https://user-images.githubusercontent.com/103230840/189594953-da8f0a47-f7c7-4f63-abed-cc31d82d8321.png)

    - 체크된 항목을 index값으로 구별하여 개별로 리스트로 담아 POST방식으로 컨트롤러에 전송하여 mapper에 개별 mapping 시키고
       각각 method 실행

스케쥴 및 유즈케이스
===========
![image](https://user-images.githubusercontent.com/103230840/189007983-d8ddf2c5-f88e-4921-899f-33fbc59ef99f.png)

![image](https://user-images.githubusercontent.com/103230840/188064176-3779e28f-8eef-4dd4-ad46-309e6cc78919.png)
