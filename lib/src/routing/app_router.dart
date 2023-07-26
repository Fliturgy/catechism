import 'package:catechism/src/features/custom_pages/domain/custom_page_data.dart';
import 'package:catechism/src/features/custom_pages/presentation/custom_page_screen.dart';
import 'package:catechism/src/features/not_found/not_found_screen.dart';
import 'package:catechism/src/features/questions/presentation/screens/question_details_screen.dart';
import 'package:catechism/src/features/questions/presentation/screens/question_list_screen.dart';
import 'package:catechism/src/features/questions/presentation/screens/question_notes_screen.dart';
import 'package:catechism/src/features/questions/presentation/screens/question_prayer_screen.dart';
import 'package:catechism/src/features/questions/presentation/screens/question_references_screen.dart';
import 'package:catechism/src/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatechismRouter {
  /// The customPages property is used to create the list of info screens.
  final List<CustomPageData> customPages;

  /// The CatechismRouter constructor is used to create a catechism router.
  CatechismRouter({
    required this.customPages,
  });

  /// The getRouter method is used to create the router.
  GoRouter getRouter() {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: false,
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => QuestionListScreen(),
          routes: [
            ...customPages.map(
              (infoScreen) => GoRoute(
                path: infoScreen.routeName,
                name: infoScreen.routeName,
                builder: (context, state) =>
                    CustomPageScreen(infoScreenData: infoScreen),
              ),
            ),
            GoRoute(
              path: 'details/:questionId',
              name: AppRoute.details.name,
              builder: (context, state) {
                return QuestionDetailsScreen(
                  questionId: int.parse(state.pathParameters['questionId']!),
                );
              },
              routes: [
                GoRoute(
                  path: 'references',
                  name: AppRoute.references.name,
                  pageBuilder: (context, state) {
                    final questionId =
                        int.parse(state.pathParameters['questionId']!);
                    return MaterialPage(
                      fullscreenDialog: true,
                      child: QuestionReferencesScreen(questionId),
                    );
                  },
                ),
                GoRoute(
                  path: 'prayer',
                  name: AppRoute.prayer.name,
                  pageBuilder: (context, state) {
                    final questionId =
                        int.parse(state.pathParameters['questionId']!);
                    return MaterialPage(
                      fullscreenDialog: true,
                      child: QuestionPrayerScreen(questionId),
                    );
                  },
                ),
                GoRoute(
                  path: 'notes',
                  name: AppRoute.notes.name,
                  pageBuilder: (context, state) {
                    final questionId =
                        int.parse(state.pathParameters['questionId']!);
                    return MaterialPage(
                      fullscreenDialog: true,
                      child: QuestionNotesScreen(questionId),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      errorBuilder: (context, state) => NotFoundScreen(),
    );
  }
}
