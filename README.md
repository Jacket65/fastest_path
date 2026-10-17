# Fastest Path

A robust Flutter application that fetches pathfinding tasks from a remote API, computes the shortest path locally using an 8-direction BFS algorithm, submits the results back to the server, and provides interactive visual previews of each grid and computed path.

## Key Features & Architecture

- **API URL Configuration & Persistence**: Input, normalize, and persist API endpoints using `shared_preferences`.
- **Robust Network Layer & Interceptors (`PathfindingInterceptor`)**:
  - Dedicated Dio interceptor handling Swagger response codes: **200 (Success)**, **429 (Too Many Requests)**, and **500 (Internal Server Error)** with user-friendly warnings.
  - Automatically catches server error payloads (`error: true`) and HTML/maintenance response pages.
- **Pathfinding Algorithm (`GridPathFinder`)**:
  - 8-directional BFS supporting horizontal, vertical, and diagonal movement around wall barriers (`'X'`).
- **Endpoint & Path Validation**:
  - Model-level validation (`hasValidEndpoints`, `isPathFound`) protecting against out-of-bounds or wall-bound start/end coordinates.
  - UI warning banners in preview and list screens for unreachable paths or invalid endpoints.
- **Interactive Visual Preview & Zoom (`PathGrid` & `InteractiveViewer`)**:
  - Color-coded grid cells following requirements (Start: `#64FFDA`, End: `#009688`, Wall: `#000000`, Path: `#4CAF50`, Empty: `#FFFFFF`).
  - Pinch-to-zoom and pan support via `InteractiveViewer`.
  - Adaptive coordinate text display ensuring no overflow on dense grids.
- **State Management (`ProcessCubit`)**:
  - Asynchronous safety checks preventing post-disposal state errors.
  - Real-time calculation progress indicator (`%`) and submission state machine.

## Tech Stack & Testing Tools

- **Flutter** & **Dart**
- `flutter_bloc` for state management
- `dio` for HTTP requests
- `http_mock_adapter` (`DioAdapter`) for mocking network requests in API & interceptor tests
- `mocktail` for mocking service dependencies in Cubit tests
- `freezed` & `json_serializable` for immutable models and JSON serialization
- `shared_preferences` for local storage
- `very_good_analysis` for strict linting

## Project Structure

```text
lib/
  algorithm/        # 8-direction BFS pathfinding implementation
  application/      # ProcessCubit and state management
  core/             # App theme and styling
  models/           # Freezed & JSON serializable data models
  services/         # Dio API client & PathfindingInterceptor
  ui/               # Screens (Home, Process, ResultList, Preview) & PathGrid widget
test/               # Unit tests (Mocktail, DioAdapter, path finder, models, cubit) & live API smoke test
```

## Getting Started

1. Install dependencies:

   ```bash
   flutter pub get
   ```

2. Generate code (`freezed` / `json_serializable`):

   ```bash
   dart run build_runner build
   ```

3. Run the application:

   ```bash
   flutter run
   ```

## Testing & Quality Assurance

Run static analysis:

```bash
dart analyze
```

Run unit and widget tests (powered by `mocktail`, `http_mock_adapter`, and `flutter_test`):

```bash
flutter test
```

Run smoke test against the live API:

```bash
flutter test test/smoke_test.dart
```
