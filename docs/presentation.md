---
theme: "Solarized"
transition: "zoom"
enableMenu: false
title: ""
---


## Flutter - Demo

---

## Intro - Agenda

- What is Flutter ?
- Dart
- Flutter (with code)
- Pro and Cons
- Q&A - Discussions
- References

---

## What is Flutter ?

--

- UI toolkit for building natively compiled applications for mobile, web and desktop from a single codebase. [*]
- Open Source (offered by Google).
- One dev team can target all platforms (essentially mobile).
- Complex UX design can more easily be implemented cross platform.
- Uses Dart

--

[*]  Web is stable since few weeks ago (2.0) and desktop still considered beta (but available in stable)

---

## Dart (from Google)

--

- 2011: Announcement.
  - Javascript replacement for better WebApp
  - DartVM in Chrome
- 2015: Drop DartVM and compile to Javascript
- 2019: Compile to Linux, Windows, Mac

--

- Main goal was to improve the development experience for Web
- Provide out of the box all tooling needed
  - Compiler
  - Types
  - Linter
  - Automatic code (re)format
  - Package management

--

- Syntax very close to C, Javascript
- Type System
  - Inferred
  - Sound Typing (static and runtime checks)
- Null Safety since 2.0
- Concurrency via
  - Future
  - Isolate (not Web ??)

--

```dart
// Define a function.
void printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
void main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}
```

--

```dart
// In null-safe Dart, none of these can ever be null.
var i = 42; // Inferred to be an int.
String name = getFileName();
final b = Foo();
int? aNullableInt = null;
int value = aNullableInt ?? 0; // 0 if it's null; otherwise, the integer
double? d;
print(d?.floor()); // Uses `?.` instead of `.` to invoke `floor()`.
```

--

```dart
  Future<String> bar() {
    return Future.value('bar');
  }
  var foobar = await bar().then((value) => "${value}bar");

  Future<String> baz() async {
    return Future.value('baz');
  }
```

--

## Json

- Primitive types
  - Native in Dart
- Class
  - Annotation / Code generation
  - DIY

---

## Flutter

- 2015: Announcement
- 2018: 1.0 : Mobile (AOT compilation)
- 2021: 2.0 : Mobile + Web + Desktop

--

## Concept

- Expressive UI
- Fast Development
- Everything is a Widget

--

## Widget

- Stateless
- Stateful
- Widget Tree / Element Tree / State

--

## Widget Composition

- Flutter comes with _essential_ widgets
  - Text, Image, Row, Column, .....
  - Material, Cupertino
- User can build their own abstraction
- If needed we have access to low level rendering layer

--

```dart
class MyWidget extends Stateless {
  @override
   Widget build(BuildContext context) {
     return Row(children: [Text('Left'), Text('Right')]);
   }
}
```

--

## Layout

- Responsive
  - MediaQuery
- LayoutBuilder
- Column/Row
--

## FutureBuilder / StreamBuilder

--

## Global State management

- Redux
- Bloc Pattern
  - Input event stream
  - Output state stream

--

## Test

```dart
testWidgets('Counter increments smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
```

--

##  Code

- Show case an e-commerce skeleton app

---

## Pros - Cons

--

## Pros

- Multi platform
- Simple UI paradigm
- Better performance than React-Native
- A lot of traction at the moment
- Fuchsia

--

## Cons

- Google project
- Flutter core is good but external dependencies might be broken
- Might need Native dev if there is a need to touch some platform specific plugin
  - GPS
  - Bluetooth

---

## Q&A - Discussion

---

## References

- [Flutter dev](flutter.dev)
- [Dart packages](pub.dev)
