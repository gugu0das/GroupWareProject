# 그룹웨어 프로젝트 (기말)
## 목차

- [프로젝트 개요](#프로젝트-개요)
- [팀 역할 분배](#팀-역할-분배)
- [사용 기술 및 도구](#사용-기술-및-도구)
- [기능구현](#기능구현)
  - 회원 관리
    - 직책 관리
    - 부서 관리
    - 회원 개인정보 관리
    - 근태 관리
  - 문서 결재
    - 문서 결재 카테고리 관리
      - 결재자 관리
      - 결재 양식 관리
      - 결재 카테고리명 관리
    - 문서 결재 관리
      - 문서 결재 신청 관리
      - 문서 결재 관리
      - 문서 PDF 다운로드
  - 게시판
    - 공지사항 게시판
    - QNA 게시판
  - 캘린더
    - 일정 관리
  - 실시간 알림
- [배포](#배포)
- [ISSUE](#ISSUE)

## 프로젝트 개요

<p align="center">
  <br>
<!--   <img src="src/main/resources/static/images/login/logo.svg" width="500" height="200"> -->
  <br>
</p>

> **프로젝트:** 그룹웨어
>
> **기획 및 제작:** 이승엽, 정상구, 김태현, 이규원, 전승민
>
> **분류:** 팀 프로젝트 
>
> **제작 기간:** 2023.05.17 ~ 06.22
>
> **배포일:** 미정
>
> **사용 언어:** JAVA
> 
> **프레임 워크:** Spring Framework

## 팀 역할 분배
> **팀장:** 이승엽
> 
> 결재 카테고리 관리 : 카테고리 관리, 결재자 관리, 결재 양식 관리
> 
> 실시간 알림 : QNA 게시판 댓글, 결재 알림 전송
>
> 사이드 바 : 사용자 페이지 사이드 바 ( 결재 관련 ) , 관리자 페이지 사이드 바 ( 전체 )

> **팀원:** 정상구
>
> 게시판 관리 : 공지사항 게시판, QNA 게시판, QNA 댓글
>
> Top Bar : 사용자 페이지 Top Bar
>
> 메인 페이지 디자인 수정

> **팀원:** 김태현
>
> 회원 관리 : 회원 가입, 회원 직책 관리( 관리자 ), 회원 부서 관리( 관리자 ), 근태 관리

> **팀원:** 이규원
>
> 캘린더 : 일정 관리

> **팀원:** 전승민
>
> 문서 결재 관리 : 문서 결재 신청 관리, 문서 결재 관리, 문서 PDF 다운로드
>
> 실시간 알림 : QNA 게시판 댓글, 결재 알림 전송

## 사용 기술 및 도구

|**Category**|**Detail**|
|:--:|:--:|
|**FrontEnd**|`HTML5`, `JavaScript`, `JQuery`, `BootStrap`, `CSS`|
|**BackEnd**|`Java(11)`, `Servlet`, `Spring Boot`, `Mybatis`|
|**OS**|`Windows 10`, `Windows 11`|
|**Libray & API**|`Spring Security`, `Validation`, `FileUpload`, `Server-Sent Event(SSE)`, `Lombok`, `gson`|
|**IDE**|`STS4`, `VisualStudio Code`, `DBeaver`|
|**Server**|`Tomcat(v8.5)`|
|**Document**|`Google Drive`, `ERDCloud`, `Miro`, `Notion`|
|**CI**|`Github`|
|**DB**|`AWS RDS`, `Docker`, `MariaDB`|

## 기능구현

  ### 1. 관리자 페이지
    #### 1-1. 관리자 페이지는 admin 계정만 접근 가능
      <img src="src/main/resources/static/gif/관리자 1-1.gif">
    #### 1-2. 관리자는 부서와 직책 관리 가능
      <img src="src/main/resources/static/gif/관리자 부서-직책.gif">
    #### 1-3. 관리자는 결재 카테고리 관리 가능
      - 결재 카테고리 생성
        <img src="src/main/resources/static/gif/관리자 결재 카테고리 생성.gif">
      - 결재 카테고리 수정/삭제 (결재자, 양식)
        - 하위 카테고리가 1개 존재하는 경우에 하위 카테고리를 삭제하면 상위 카테고리에 결재 양식과 결재자를 등록하게 됨 (미 등록 시 하위 카테고리 삭제 불가)
        - 상위 카테고리가 삭제 될 경우 하위카테고리도 함께 삭제 됨.
        <img src="src/main/resources/static/gif/관리자 결재 카테고리 수정.gif">
    #### 1-4. 관리자는 게시판 관리 가능
  
## 배포
**미정**

## ISSUE
