import 'package:flutter_test/flutter_test.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/quiz.dart';

Future<void> startQuiz(WidgetTester tester) async {
  await tester.pumpWidget(const Quiz());
  await tester.tap(find.text('Start Quiz'));
  await tester.pump();
}

// Answers every question, picking a wrong answer for the given indexes.
Future<void> answerAll(WidgetTester tester, {Set<int> wrong = const {}}) async {
  for (var i = 0; i < questions.length; i++) {
    expect(find.text(questions[i].text), findsOneWidget);
    final answer = questions[i].answers[wrong.contains(i) ? 1 : 0];
    await tester.tap(find.text(answer));
    await tester.pump();
  }
}

void main() {
  testWidgets('Full run: start, answer all, see results, restart', (
    WidgetTester tester,
  ) async {
    await startQuiz(tester);
    await answerAll(tester);

    expect(
      find.text('You answered 6 out of 6 questions correctly!'),
      findsOneWidget,
    );

    await tester.tap(find.text('Restart Quiz'));
    await tester.pump();

    expect(find.text(questions[0].text), findsOneWidget);
  });

  testWidgets('A wrong answer is not counted as correct', (
    WidgetTester tester,
  ) async {
    await startQuiz(tester);
    await answerAll(tester, wrong: {2});

    expect(
      find.text('You answered 5 out of 6 questions correctly!'),
      findsOneWidget,
    );
  });

  test('getShuffledAnswers keeps the original answer order', () {
    final question = questions[0];
    final original = List.of(question.answers);

    final shuffled = question.getShuffledAnswers();

    expect(question.answers, original);
    expect(shuffled.toSet(), original.toSet());
  });
}
