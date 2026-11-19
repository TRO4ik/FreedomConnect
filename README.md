# Freedom Connect — MVP 0.1.0

Бесплатный Flutter-проект для Android и Windows. Это companion-приложение: оно открывает официальную загрузку Tor Browser и страницу проверки Tor.

## Честно о возможностях

- Не является VPN-клиентом.
- Не перенаправляет системный трафик.
- Не подключается к собственному серверу.
- Не гарантирует доступность Tor или обход всех блокировок.
- Весь сетевой трафик приложения не становится анонимным автоматически.

Для бесплатного старта используется официальный Tor Browser. На Android и Windows он работает отдельно от Freedom Connect.

## Сборка

Нужен Flutter SDK (stable), Android SDK для Android-сборки и Visual Studio с workload **Desktop development with C++** для Windows-сборки.

```bash
flutter pub get
flutter run
```

Android APK:
```bash
flutter build apk --release
```

Windows:
```bash
flutter build windows --release
```

## Установка Tor Browser

Загружайте его только с https://www.torproject.org/download/

Если прямое подключение не работает, откройте настройки Tor Browser и найдите раздел подключения/мостов (bridges). Доступность конкретных мостов меняется; универсального гарантированного варианта нет.

## Следующий этап

Чтобы превратить MVP в полноценный VPN-клиент, отдельно потребуется выбрать поддерживаемый протокол и доверенную инфраструктуру. При бюджете 0 ₽ нельзя обещать постоянную доступность серверов или автоматический обход любых блокировок.


## Автоматическая сборка APK и Windows-пакета

В репозитории GitHub откройте **Actions → Build Freedom Connect → Run workflow**.
После завершения скачайте два артефакта:
- `freedom-connect-android-apk`
- `freedom-connect-windows` (ZIP-папка приложения, не один автономный EXE)

Workflow генерирует платформенные файлы Flutter и собирает приложения на соответствующих runner-ах GitHub. Для этого проект сначала нужно загрузить в свой GitHub-репозиторий.
