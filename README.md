# Quiz App

A Flutter quiz app with three screens: **Start**, **Questions** and **Results**.

- Questions live in `lib/data/questions.dart` as a list of `QuizQuestion` objects (`lib/models/quiz_question.dart`). The first answer is always the correct one.
- Answers are shuffled (`List.of` + `shuffle`) and turned into `AnswerButton`s with `map()` and the spread operator `...`.
- `Quiz` is a `StatefulWidget` that keeps the active screen and the chosen answers and switches screens with `setState()`.
- After the last question the results screen shows how many answers were correct (`where()` + `length`) and a scrollable summary. **Restart Quiz** starts again.

## Project structure

```text
lib/
├── data/
│   └── questions.dart
├── models/
│   ├── answer_button.dart
│   └── quiz_question.dart
├── main.dart
├── quiz.dart
├── start_screen.dart
├── questions_screen.dart
├── results_screen.dart
└── questions_summary.dart
```

## Run

```sh
flutter pub get
flutter run
```

## Test

```sh
flutter test
```
