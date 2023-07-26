import 'package:catechism/src/features/configuration/data/titles_provider.dart';
import 'package:catechism/src/features/not_found/empty_placeholder_widget.dart';
import 'package:catechism/src/common_widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends ConsumerWidget {
  /// The NotFoundScreen constructor is used to to create the page not found
  /// error screen.
  const NotFoundScreen({
    super.key,
  });

  /// The build method is used to create the widget.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titles = ref.watch(titlesProvider!);

    return Scaffold(
      appBar: TopBar(titles),
      body: EmptyPlaceholderWidget(
        message: '404 - Page not found!',
      ),
    );
  }
}
