# Copilot / AI agent instructions for youtube_tutorial_todo_real

Short, actionable guidance for AI coding agents working in this repository.

## Big picture
- A small Flutter application scaffolded from the default Flutter template.
- Multi-platform targets are present (android/, ios/, linux/, macos/, windows/, web/). The Dart entrypoint is `lib/main.dart`.
- Architecture is a single-package app (no separate backend/services in repo); UI code lives under `lib/` and tests under `test/`.

## Key files & examples
- Entry point: `lib/main.dart` (example `MyApp`, `MyHomePage`).  Fixes to UI should start here.
- Tests: `test/widget_test.dart` shows how widget tests use `WidgetTester`, `pumpWidget`, taps and `expect` on widget trees.
- Static analysis: `analysis_options.yaml` includes `package:flutter_lints/flutter.yaml` — follow those lint rules.
- Android uses Kotlin Gradle scripts (`android/app/build.gradle.kts`); use the Gradle wrapper in `android/gradlew`/`gradlew.bat` if invoking Gradle directly.

## Developer workflows (commands to run locally)
- Fetch deps: `flutter pub get`
- Analyze: `flutter analyze`
- Format code: `dart format .` (or `flutter format .`)
- Run app: `flutter run -d <device-id>` (e.g. `-d windows`, `-d chrome`, `-d emulator-5554`)
  - Hot reload: press `r` in terminal or use the IDE action
  - Hot restart: `R`
- Run tests: `flutter test` (runs `test/` unit & widget tests)
- Build artifacts:
  - Android APK: `flutter build apk --release` (or use `android/gradlew` for custom gradle tasks)
  - iOS: `flutter build ios` (macOS only)
  - Web: `flutter build web`
  - Windows/macOS/Linux: `flutter build <windows|macos|linux>`
- Environment checks & troubleshooting: `flutter doctor -v` and `flutter pub get` are first steps when builds fail.

## Project-specific conventions & patterns
- Uses the official `flutter_lints` ruleset (refer to `analysis_options.yaml`) — prefer to make minimal lint exceptions and use `// ignore:` only when necessary.
- Tests follow the standard `flutter_test` pattern (use `WidgetTester` and pump interactions); keep tests small and deterministic as in `test/widget_test.dart`.
- Platform-generated files (e.g., `GeneratedPluginRegistrant.*`, `build/`, `android/.gradle/`) are generated and should not be edited directly.
- The project targets null-safety (Dart SDK >=3.10 in `pubspec.yaml`) — prefer null-safe idioms and types.

## Integration points & external dependencies
- Current `pubspec.yaml` has no network or backend packages and minimal deps (just `cupertino_icons`). New packages will update platform files; run `flutter pub get` after edits.
- When adding plugin packages, expect changes to platform folders (Android/iOS/Windows/Mac) and regenerated plugin registrant code.

## Common issues & troubleshooting notes (detected in repo)
- `lib/main.dart` appears to contain template/placeholder typos (e.g. `colorScheme: .fromSeed(...)`, `mainAxisAlignment: .center` — missing explicit types). If the analyzer or tests fail, check `lib/main.dart` for missing class names like `ColorScheme.fromSeed(...)` and `MainAxisAlignment.center`.
- For Android-specific failures, prefer the Gradle wrapper: `cd android && ./gradlew assembleDebug` (Windows: `gradlew.bat`).

## Suggested CI steps (if adding GitHub Actions)
- Steps: `flutter pub get` → `flutter analyze` → `flutter test` → optional `flutter build` for target platform(s).
- Use matrix builds only if you need to build multiple platforms (note: iOS builds require macOS runners).

## How to edit this file and validate
- Keep content concise and actionable; include specific file references and example commands.
- After updates, run `flutter analyze` and `flutter test` locally to ensure instructions align with repository behavior.

---
If anything here is unclear or you want more detail (CI example, example PR checklist, or specific debugging tips), tell me which section to expand.
