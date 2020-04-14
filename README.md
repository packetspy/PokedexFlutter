# pokedex

##Projeto de estudo de animações e requests.

###Atualiza packages
flutter pub get

###Gera Icons
flutter pub run flutter_launcher_icons:main

###Comando do Mobx
flutter packages pub run build_runner build
flutter packages pub run build_runner watch

###publica apk
flutter clean && flutter build apk --release
output: D:\projetos\study\pokedex\build\app\outputs\apk

###Permitir Android acessar internet
android/app/src/main/AndroidManifest.xml
[<uses-permission android:name="android.permission.INTERNET" />]
