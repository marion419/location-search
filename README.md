#🗺️ 지역 검색 앱
행정구역으로 지역의 시설을 검색하고, 관련 정보를 열람하는 앱입니다.
개발 환경 : ``Flutter``
사용 API : 브이월드 API, 카카오 API

## 💡 프로젝트 소개
### ⏱️ 프로젝트 기간
``2024. 12. 06 - 2024. 12. 09``

### 디렉토리 구조  

<details>
  <summary> (Click!)디렉토리 구조 </summary>
📦lib  
  
 ┣ 📂core  
 ┃ ┗ 📜geolocator_helper.dart  
 ┣ 📂data  
 ┃ ┣ 📂model  
 ┃ ┃ ┗ 📜location.dart  
 ┃ ┗ 📂repository  
 ┃ ┃ ┣ 📜location_repository.dart  
 ┃ ┃ ┗ 📜vworld_repository.dart  
 ┣ 📂ui  
 ┃ ┗ 📂pages  
 ┃ ┃ ┣ 📂detail  
 ┃ ┃ ┃ ┗ 📜detail_page.dart  
 ┃ ┃ ┣ 📂home  
 ┃ ┃ ┃ ┣ 📂widgets  
 ┃ ┃ ┃ ┃ ┣ 📜home_search_bar.dart  
 ┃ ┃ ┃ ┃ ┗ 📜location_list_view.dart  
 ┃ ┃ ┃ ┣ 📜home_page.dart  
 ┃ ┃ ┃ ┗ 📜home_view_model.dart  
 ┃ ┃ ┗ 📂map  
 ┃ ┃ ┃ ┣ 📂widgets  
 ┃ ┃ ┃ ┃ ┣ 📜information_box.dart  
 ┃ ┃ ┃ ┃ ┗ 📜kakaomap.dart  
 ┃ ┃ ┃ ┗ 📜map_page.dart  
 ┗ 📜main.dart  
</details>

## 💡 어떻게 사용하나요?
![](https://velog.velcdn.com/images/utiranoj/post/b7815168-ca3c-4ce0-b43e-419cf852cf7a/image.gif)
![](https://velog.velcdn.com/images/utiranoj/post/f37b1c5c-d18b-41f5-be18-8bac1bd583b3/image.gif)

- 검색창에 ``읍/면/동`` 을 입력합니다.
- 우상단 아이콘을 클릭하면 현위치의 행정구역으로 검색합니다.
- 원하는 시설을 클릭하면 해당 시설에 연결된 사이트를 보여줍니다.
- 연결된 사이트가 없을 경우 주의 문구를 띄웁니다.
- 지도 모양 아이콘을 클릭하면 해당 시설의 위치를 표시한 지도를 보여줍니다.
  - 지도는 카카오맵 API를 이용했습니다.
  - 축적을 확대/축소할 수 있습니다.
  - 지도에서 마커를 클릭하면 사이트로 이동합니다. 마찬가지로 연결된 링크가 없으면 주의 문구를 띄웁니다.
- 사이트와 지도를 보여주는 페이지에서 우상단 집 모양 아이콘을 클릭하면 홈 페이지로 이동합니다.
