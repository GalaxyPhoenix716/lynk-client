import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/onboarding/presentation/providers/onboarding_provider.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final hasOnboarded = ref.watch(onboardingProvider);

  return GoRouter(
    initialLocation: hasOnboarded ? '/home' : '/onboarding',
    redirect: (context, state) {
      final isOnboardingRoute = state.matchedLocation == '/onboarding';

      if (!hasOnboarded && !isOnboardingRoute) {
        return '/onboarding';
      }
      if (hasOnboarded && isOnboardingRoute) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const PlaceholderScreen(title: 'Onboarding Screen'),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const PlaceholderScreen(title: 'Home Screen'),
      ),
      GoRoute(
        path: '/upload',
        builder: (context, state) {
          final attachToSessionId = state.uri.queryParameters['attachToSessionId'];
          return PlaceholderScreen(title: 'Upload Screen (session: $attachToSessionId)');
        },
      ),
      GoRoute(
        path: '/send-qr',
        builder: (context, state) => const PlaceholderScreen(title: 'Send QR Screen'),
      ),
      GoRoute(
        path: '/scan-qr',
        builder: (context, state) => const PlaceholderScreen(title: 'Scan QR Screen'),
      ),
      GoRoute(
        path: '/receive-qr',
        builder: (context, state) => const PlaceholderScreen(title: 'Receive QR Screen'),
      ),
      GoRoute(
        path: '/download-progress/:transferId',
        builder: (context, state) {
          final transferId = state.pathParameters['transferId'] ?? '';
          return PlaceholderScreen(title: 'Download Progress Screen (id: $transferId)');
        },
      ),
    ],
  );
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}
