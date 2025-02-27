# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [unreleased]

## [0.0.18]

### Added

- **Breaking:** new required defaultAppTitle property in the Configuration class

### Changed

- **Breaking:** the TopBar title property is now a Widget instead of a list of strings
- Dependency upgrades:
  - sdk: 3.4.3 -> 3.5.3
  - go_router: 14.2.1 -> 14.3.0
  - lints: 4.0.0 -> 5.0.0
  - flutter_lints: 4.0.0 -> 5.0.0
  - test: 1.25.2 -> 1.25.7

## [0.0.17]

### Added

- Configuration option to show/hide the Settings menu item in the Drawer
- Configuration option to show/hide the Language Selector in the Settings page

### Changed

- **Breaking:** the following Question properties are now Widgets:
  - title
  - titleShort
  - question
  - answer
  - notes
  - prayer
- **Breaking:** the following QuestionReference properties are now Widgets:
  - title
  - content
- **Breaking:** the following CustomPageData properties are now Widgets:
  - title
  - content

## [0.0.16]

### Added

- Ability to select a language and switch languages manually

## [0.0.15]

### Added

- Support for localized messages with the intl library for the "Show Answer" and "Hide Answer" buttons

### Changed

- Dev Dependency upgrades:
  - flutter_lints 2.0.3 -> 4.0.0
  - lints 3.0.0 -> 4.0.0
- Dependency upgrades:
  - go_router 13.2.4 -> 14.2.1
  - test 1.24.3 -> 1.25.2
- Environment upgrades:
  - sdk 3.3.3 -> 3.4.4

### Removed

- The circle avatar for the question number in the question list item widget

## [0.0.14]

### Changed

- Upgraded go_router to 13.2.4
- Upgraded Dart SDK to the latest version (3.3.3)
- Upgraded flutter_riverpod to 2.5.1

## [0.0.13]

### Changed

- Upgraded go_router (12.0.1), flutter_riverpod (2.4.5), and font_awesome_flutter (10.6.0) dependencies and pinned to the latest version
- Upgraded Dart SDK dependency to the latest version (3.1.4)
- Upgraded lints dev dependency and pinned to the latest version (3.0.0)
- Upgraded test dev dependency to the latest version (1.24.3) that works with the Flutter SDK associated with the latest version of the Dart SDK (3.1.4)

### Fixed

- Localization - issue when switching locale/language
- Two minor linting issues that appeared after upgrading lints to the latest version:

```
Analyzing catechism...                                                  

   info • Unnecessary use of 'toList' in a spread • lib/src/common_widgets/drawer.dart:39:14 • unnecessary_to_list_in_spreads
   info • Convert 'key' to a super parameter • lib/src/common_widgets/top_bar.dart:25:3 • use_super_parameters
```

## [0.0.12]

### Added

- Localization support for Questions, Custom Pages, and Titles.

### Fixed

- Renamed remaining instances of "infoScreen" to "customPage".

## [0.0.11]

### Changed

- Using GoRouter for routing/navigation instead of Navigator 1.0
  - custom pages (info screens) now need to specify a routeName
- Using Riverpod for state management instead of Provider
- Renamed info screens to custom pages

### Fixed

- The drawer should close automatically when one of the items is selected.

## [0.0.10]

### Added

- Question Notes:
  - A new notes field on the question model.
  - A new notes "pop up" page to show notes for a given catechism question.
  - The displayQuestionNotes configuration setting to determine whether or not to show the icon in the bottom bar for the notes on the question details page (defaults to true).
  - The questionNotesIcon configuration setting that allows customization for the icon displayed in the bottom bar for the notes on the question details page (defaults to question_answer_outlined).
- Question Prayer:
  - A new prayer field on the question model.
  - A new prayer "pop up" page to show the prayer for a given catechism question.
  - The displayQuestionPrayer configuration setting to determine whether or not to show the icon in the bottom bar for the prayer on the question details page (defaults to true).
  - The questionPrayerIcon configuration setting that allows customization for the icon displayed in the bottom bar for the prayer on the question details page (defaults to hands_praying).

### Changed

- Renamed ScriptureScreen to ReferencesScreen to be more consistent with naming.

## [0.0.9]

### Fixed

- The drawer should now show up on the list page again.
- The spacing on the references page has been improved.

## [0.0.8]

### Added

- An optional show/hide answer button on the question details page.
- A new references "pop up" page to show referenced source material.

### Changed

- The references tab is now a pop up page and has configuration settings (replacing some of the removed tab configuration setting) for the following:
  - displayQuestionReferences - if "false" the icon in the bottom bar for references will not appear
  - questionReferencesIcon - allows the icon displayed in the bottom bar for references to be customized

### Removed

- The image tab (the questions can still have images, they just aren't shown anywhere currently).
- The tab bar related configuration settings.

## [0.0.7]

### Added

- Question details page is now optional. Either the details page will be used, or the list will contain the answers in-line. This is controlled through the "displayQuestionDetailsAsSeparatePage" configuration flag, which defaults to true (so, previous behavior is the default).
- The leading (question short title) in the question list item is now wrapped in a CircleAvatar. The background color can be set using the "primaryColorLight" property of the theme, and the text color can be set using the "color" property of the "headlineMedium" property of the theme. By setting the background color to the same color as the "scaffoldBackgroundColor" property, the CircleAvatar will effectively disappear.

### Changed

- Text widgets that used the "headlineMedium" style (info screen titles and question details titles) now use "headlineLarge" instead.
- Leading (question short title) now uses the "headlineMedium" style

## [0.0.6]

### Changed

- improved dart docs
- make question title truly optional (i.e. nullable)
- add question short title (titleShort) optional field and use it instead of displaying question id to better support languages/locales other than English

## [0.0.5]

### Added

- more dart docs

## [0.0.4]

### Added

- some function level dart docs for the generated API reference docs
- GitHub actions to test and publish

## [0.0.3]

### Added

- references for Questions
- image for Question
- bottom navigation bar (tabs) on details page
- tab for showing scripture references/text for a given question
- tab for showing an image for a given question

## [0.0.2]

### Added

- dartdoc comments for all classes

### Changed

- updated the library description to be more descriptive

## [0.0.1]

Initial Version

### Added

- CatechismApp Widget, including the following:
  - app title
  - catechism question list screen
  - catechism detail screen with question and answer
  - drawer with links to additional info screens
  - custom theming
  - configuration (turning on/off the following features):
    - displaying the question number in the details screen
    - displaying the question title in the details screen

[unreleased]: https://github.com/fliturgy/catechism/compare/v0.0.18...HEAD
[0.0.18]: https://github.com/fliturgy/catechism/compare/v0.0.17...v0.0.18
[0.0.17]: https://github.com/fliturgy/catechism/compare/v0.0.16...v0.0.17
[0.0.16]: https://github.com/fliturgy/catechism/compare/v0.0.15...v0.0.16
[0.0.15]: https://github.com/fliturgy/catechism/compare/0.0.14...v0.0.15
[0.0.14]: https://github.com/fliturgy/catechism/compare/v0.0.13...0.0.14
[0.0.13]: https://github.com/fliturgy/catechism/compare/v0.0.12...v0.0.13
[0.0.12]: https://github.com/fliturgy/catechism/compare/v0.0.11...v0.0.12
[0.0.11]: https://github.com/fliturgy/catechism/compare/v0.0.10...v0.0.11
[0.0.10]: https://github.com/fliturgy/catechism/compare/v0.0.9...v0.0.10
[0.0.9]: https://github.com/fliturgy/catechism/compare/v0.0.8...v0.0.9
[0.0.8]: https://github.com/fliturgy/catechism/compare/v0.0.7...v0.0.8
[0.0.7]: https://github.com/fliturgy/catechism/compare/v0.0.6...v0.0.7
[0.0.6]: https://github.com/fliturgy/catechism/compare/v0.0.5...v0.0.6
[0.0.5]: https://github.com/fliturgy/catechism/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/fliturgy/catechism/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/fliturgy/catechism/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/fliturgy/catechism/compare/v0.0.1...v0.0.2
[0.0.1]: https://github.com/fliturgy/catechism/releases/tag/v0.0.1
