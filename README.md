# 2차 리팩토링
약 2시간 전 bloc이란 새 브랜치를 따고나서 지금 cubit에서 bloc으로의 전환 작업을 완료했으나,
이전에 깃 충돌이 있었을 때 이전 커밋을 불러오려다가 AndroidManifest.xml와 project.pbxproj file 등이 손실되어버렸다.
그래서 다급히 새 프로젝트를 만들어서 빌드해보니 다행히 문제 없이 동작하는 것을 확인했다.

계획과 마찬가지로 1) cubit을 bloc으로 바꾸었고 2) UI는 Provider.of(context)나 context.read() 메서드가 아닌
BlocBuilder를 사용하였다.

리팩토링이라고 하기 무색할 정도로 간단한 작업이었으나 짧은 시간 블록을 리마인드할 수 있는 좋은 기회였다.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
