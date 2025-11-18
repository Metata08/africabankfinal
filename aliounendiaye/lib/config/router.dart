// router.dart
import 'package:go_router/go_router.dart';

// IMPORT DES SCREENS
import 'package:africa_bank/screens/home_screen.dart';
import 'package:africa_bank/screens/signup_screen.dart';
import 'package:africa_bank/screens/dashboard_screen.dart';
import 'package:africa_bank/screens/account_screen.dart';
import 'package:africa_bank/screens/addcard_screen.dart';
import 'package:africa_bank/screens/settings_screen.dart';
import 'package:africa_bank/screens/transactionmain_screen.dart';
import 'package:africa_bank/screens/payment_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => SignUpScreen(),
    ),

    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => DashboardScreen(),
    ),

    GoRoute(
      path: '/account',
      name: 'Account',
      builder: (context, state) => AccountScreen(),
    ),
    
    GoRoute(
      path: '/addcard',
      name: 'AddCard',
      builder: (context, state) => AddCardScreen(),
    ),

    GoRoute(
      path: '/settings',
      name: 'Settings',
      builder: (context, state) => SettingsPage(),
    ),

    GoRoute(
      path: '/transaction',
      name: 'Transaction',
      builder: (context, state) => TransactionHubPage(),
    ),

    GoRoute(
      path: '/payment',
      name: 'Payment',
      builder: (context, state) => PaymentScreen(),
    ),
  ],
);
