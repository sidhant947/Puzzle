# Contributing to Puzzle

First off, thank you for considering contributing to Puzzle! It's people like you that make Puzzle such a great tool.

Following these guidelines helps to communicate that you respect the time of the developers managing and developing this open source project. In return, they should reciprocate that respect in addressing your issue, assessing changes, and helping you finalize your pull requests.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Enhancements](#suggesting-enhancements)
  - [Your First Code Contribution](#your-first-code-contribution)
  - [Pull Requests](#pull-requests)
- [Styleguides](#styleguides)
  - [Git Commit Messages](#git-commit-messages)
  - [Dart Styleguide](#dart-styleguide)
  - [Flutter Styleguide](#flutter-styleguide)
- [Additional Notes](#additional-notes)

## Code of Conduct

This project and everyone participating in it is governed by the [Puzzle Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to [khatkarsidhant@gmail.com].

## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report for Puzzle. Following these guidelines helps maintainers and the community understand your report, reproduce the behavior, and find related bugs.

Before creating bug reports, please check [this list](#before-submitting-a-bug-report) to be sure that you need to create one. When you are creating a bug report, please [include as many details as possible](#how-do-i-submit-a-good-bug-report) by filling out the [bug report template](.github/ISSUE_TEMPLATE/bug_report.md).

### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for Puzzle, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion and find related suggestions.

When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion) by filling out the [feature request template](.github/ISSUE_TEMPLATE/feature_request.md).

### Your First Code Contribution

Unsure where to begin contributing to Puzzle? You can start by looking through these `beginner` and `help-wanted` issues:

- [Beginner issues](https://github.com/sidhant947/puzzle/labels/beginner) - issues which should only require a few lines of code, and a test or two.
- [Help wanted issues](https://github.com/sidhant947/puzzle/labels/help-wanted) - issues which should be a bit more involved than `beginner` issues.

#### Local Development Setup

To get started with the codebase:

1.  **Prerequisites**: Ensure you have [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
2.  **Clone the Repo**: `git clone https://github.com/sidhant947/Puzzle.git`
3.  **Install Dependencies**: `flutter pub get`
4.  **Run Build Runner**: This project uses code generation. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate the necessary files.
5.  **Run the App**: `flutter run`

### Pull Requests

The process which describes how to contribute to Puzzle:

1.  Fork the repo and create your branch from `main`.
2.  If you've added code that should be tested, add tests.
3.  If you've changed APIs, update the documentation.
4.  Ensure the test suite passes.
5.  Make sure your code lints (`flutter analyze`).
6.  Issue that pull request!

## Styleguides

### Git Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line

### Dart Styleguide

All Dart code should follow the official [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

### Flutter Styleguide

- Use `Widgets` and `StatelessWidget` whenever possible.
- Prefer composition over inheritance.
- Follow the [Flutter architectural guidelines](https://docs.flutter.dev/perf/best-practices).

## Additional Notes

### Issue and Pull Request Labels

This section lists the labels we use to help us track and manage issues and pull requests.

- `bug` - Something isn't working
- `enhancement` - New feature or request
- `help-wanted` - Extra attention is needed
- `question` - Further information is requested
- `wontfix` - This will not be worked on
