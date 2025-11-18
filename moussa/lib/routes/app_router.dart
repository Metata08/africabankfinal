import 'package:go_router/go_router.dart';
import 'package:africabankfinal/screens/transaction_page.dart';
import 'package:africabankfinal/screens/transaction_suivant.dart';
import 'package:africabankfinal/screens/account_page.dart';
import 'package:africabankfinal/screens/addcard_page.dart';
import 'package:africabankfinal/screens/settings_page.dart';
import 'package:africabankfinal/screens/exchange_page.dart';
import 'package:africabankfinal/screens/payment_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TransactionPage(),
    ),
    GoRoute(
      path: '/transaction_suivant',
      builder: (context, state) => const TransactionSuivant(),
    ),
    GoRoute(
      path: '/account',
      builder: (context, state) => const AccountPage(),
    ),
    GoRoute(
      path: '/addcard',
      builder: (context, state) => const AddCardPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/exchange',
      builder: (context, state) => const ExchangePage(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentPage(),
    ),
  ],
);
