//beranda
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/welcome/Screens/Welcome/welcome_screen.dart';
import 'package:shamo/welcome/Screens/Login/login_screen.dart';
import 'package:shamo/pages/LoginSignup/signup/signup_screen.dart';
import 'package:shamo/onboarding/home.dart';

//chat

import 'package:shamo/pages/chat/screens/main_screen.dart';
import 'package:shamo/pages/chat/screens/new_chat_screen.dart';
import 'package:shamo/pages/chat/screens/auth_type_screen.dart';
import 'package:shamo/pages/chat/screens/auth_screen.dart';
import 'package:shamo/pages/chat/screens/opt_screen.dart';
import 'package:shamo/pages/chat/screens/profile_setup_screen.dart';
import 'package:shamo/pages/chat/screens/privacy_policy_screen.dart';
import 'package:shamo/pages/chat/screens/message_screen.dart';
import 'package:shamo/pages/chat/screens/profile_screen.dart';
import 'package:shamo/pages/chat/screens/manage_users_screen.dart';
import 'package:shamo/pages/chat/screens/live_chat_message_screen.dart';

//news
import 'package:shamo/pages/artikel/screen/NBHomeScreen.dart';
//video
import 'package:shamo/pages/materi/screens/home/home_screen.dart';
//quiz
import 'package:shamo/pages/quiz/screens/home/home.dart';
import 'package:shamo/pages/quiz/screens/finish_level_screen.dart';
import 'package:shamo/pages/quiz/screens/levels_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_game_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_multiplayer_result_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_multiplayer_screen.dart';
import 'package:shamo/pages/quiz/screens/settings/settings_screen.dart';
import 'package:shamo/pages/lib/presentation/screens/profileScreens/mainProfileScreen/profile.screen.dart';
import 'package:get/get.dart';
import 'package:shamo/pages/lib/presentation/screens/profileScreens/editProfileScreen/edit.profile.screen.dart';
import 'package:shamo/pages/lib/presentation/screens/profileScreens/appSettingsScreen/app.setting.screen.dart';
import 'package:shamo/pages/lib/presentation/screens/profileScreens/accountInformationScreen/account.information.screen.dart';
import 'package:shamo/pages/lib/presentation/screens/profileScreens/changePasswordScreen/change.password.screen.dart';

var appRoutes = [
  GetPage(
    name: "/home",
    page: () => const MainPage(),
  ),
  GetPage(
    name: "/welcome",
    page: () => WelcomeScreen1(),
  ),
  GetPage(
    name: "/signin",
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: "/signup",
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: "/onboarding",
    page: () => const Home(),
  ),
  GetPage(
    name: MainScreen.routeName,
    page: () => const MainScreen(),
  ),
  GetPage(
    name: AuthTypeScreen.routeName,
    page: () => const AuthTypeScreen(),
  ),
  GetPage(
    name: AuthScreen.routeName,
    page: () => const AuthScreen(),
  ),
  GetPage(
    name: OtpScreen.routeName,
    page: () => const OtpScreen(),
  ),
  GetPage(
    name: PrivacyPolicyScreen.routeName,
    page: () => const PrivacyPolicyScreen(),
  ),
  GetPage(
    name: ProfileSetupScreen.routeName,
    page: () => const ProfileSetupScreen(),
  ),
  GetPage(
    name: NewChatScreen.routeName,
    page: () => const NewChatScreen(),
  ),
  GetPage(
    name: MessageScreen.routeName,
    page: () => const MessageScreen(),
  ),
  GetPage(
    name: ProfileScreen.routeName,
    page: () => const ProfileScreen(),
  ),
  GetPage(
    name: ManageUsersScreen.routeName,
    page: () => const ManageUsersScreen(),
  ),
  GetPage(
    name: LiveChatMessageScreen.routeName,
    page: () => const LiveChatMessageScreen(),
  ),
  GetPage(
    name: '/articles',
    page: () => const NBHomeScreen(),
  ),
  GetPage(
    name: '/quiz',
    page: () => const HomeQuiz(),
  ),
  GetPage(
    name: '/levels',
    page: () => const LevelsScreen(),
  ),
  GetPage(
    name: '/offline-game',
    page: () => const OfflineGameScreen(),
  ),
  GetPage(
    name: '/finish-Level',
    page: () => const FinishLevelScreen(),
  ),
  GetPage(
    name: '/settings',
    page: () => const SettingsScreen(),
  ),
  GetPage(
    name: '/offline_multiplayer',
    page: () => const OfflineMultiplayerScreen(),
  ),
  GetPage(
    name: '/offline-multiplayer-result',
    page: () => const OfflineMultiplayerResultScreen(),
  ),
  GetPage(
    name: '/video',
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: '/profile-dashboard',
    page: () => const ProfileScreenn(),
  ),
  GetPage(
    name: '/editProfile',
    page: () => EditProfileScreen(),
  ),
  GetPage(
    name: '/appSettings',
    page: () => const AppSettings(),
  ),
  GetPage(
    name: '/accountInfo',
    page: () => const AccountInformationScreen(),
  ),
  GetPage(
    name: '/changePassword',
    page: () => ChangePasswordScreen(),
  ),
];
