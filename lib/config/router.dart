// router.dart
import 'package:africabankfinal/screens/account_screen.dart';
import 'package:africabankfinal/screens/addcard_screen.dart';
import 'package:africabankfinal/screens/dashboard_screen.dart';
import 'package:africabankfinal/screens/exchange_screen.dart';
// IMPORT DES SCREENS
import 'package:africabankfinal/screens/home_screen.dart';
import 'package:africabankfinal/screens/payment_screen.dart';
import 'package:africabankfinal/screens/settings_page.dart';
import 'package:africabankfinal/screens/signup_screen.dart';
import 'package:africabankfinal/screens/transaction_formular_screen.dart';
import 'package:africabankfinal/screens/transaction_qr_screen.dart';
import 'package:africabankfinal/screens/transaction_suivant.dart';
import 'package:africabankfinal/screens/transactionmain_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  // initialLocation: '/home',
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
      builder: (context, state) => TransactionPage(),
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

    GoRoute(
      path: '/transaction_suivant',
      name: 'Transaction_suivant',
      builder: (context, state) => TransactionSuivant(),
    ),

    GoRoute(
      path: '/transaction_form',
      name: 'T',
      builder: (context, state) => TransactionFormScreen(),
    ),

    GoRoute(
      path: '/transaction_qr',
      name: 'T1',
      builder: (context, state) => QrScreen(),
    ),

    GoRoute(
      path: '/exchange',
      name: 'Exchange',
      builder: (context, state) => ExchangeScreen(),
    ),
  ],
);
