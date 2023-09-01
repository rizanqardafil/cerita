import 'package:shamo/pages/quiz/screens/finish_level_screen.dart';
import 'package:shamo/pages/quiz/screens/home/home.dart';
import 'package:shamo/pages/quiz/screens/levels_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_game_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_multiplayer_result_screen.dart';
import 'package:shamo/pages/quiz/screens/offline_multiplayer_screen.dart';
import 'package:shamo/pages/quiz/screens/settings/settings_screen.dart';
import 'package:shamo/pages/quiz/screens/leaderboard_screen.dart';

//beranda
import 'package:shamo/pages/home/main_page.dart';
import 'package:shamo/welcome/Screens/Welcome/welcome_screen.dart';
import 'package:shamo/welcome/Screens/Login/login_screen.dart';
import 'package:shamo/pages/LoginSignup/signup/signup_screen.dart';
import 'package:shamo/onboarding/home.dart';
//chat


//news

//video
import 'package:shamo/pages/materi/screens/home/home_screen.dart';

class AppRoute {
  const AppRoute._();

  //beranda
  static const home = '/home';
  static const signin = '/signin';
  static const welcome = '/welcome';
  static const signup = '/signup';
  static const onboarding = '/onboarding';

  //chat
  static const chat = '/chat';

  //video
  static const video = '/video';

  //news
  static const article = '/articles';

  //quiz
  static const homequiz = '/quiz';
  static const leaderboard = '/leaderboard';
  static const multiplayerSearch = '/multiplayer-search';
  static const game = '/game';
  static const levels = '/levels';
  static const offlineGame = '/offline-game';
  static const finishLevel = '/finish-Level';
  static const onlineFinish = '/online-finish';
  static const settings = '/settings';
  static const offlineMultiplayer = '/offline_multiplayer';
  static const offlineMultiplayerResult = '/offline-multiplayer-resutl';

  static final routes = {
    //beranda
    home: (context) => const MainPage(),
    welcome: (context) => WelcomeScreen1(),
    signin: (context) => const SignInScreen(),
    signup: (context) => const SignUpScreen(),
    onboarding: (context) => const Home(),

    //chat
    

    //artikel

    //video
    video: (context) => const HomeScreen(),
    //quiz
    homequiz: (context) => const HomeQuiz(),
    leaderboard: (context) => const LeaderboardScreen(),
    // multiplayerSearch: (context) => const MultiplayerSearchScreen(),
    // game: (context) => const GameScreen(),
    offlineGame: (context) => const OfflineGameScreen(),
    levels: (context) => const LevelsScreen(),
    finishLevel: (context) => const FinishLevelScreen(),

    // onlineFinish: (context) => const OnlineFinishScreen(),
    settings: (context) => const SettingsScreen(),
    offlineMultiplayer: (context) => const OfflineMultiplayerScreen(),
    offlineMultiplayerResult: (context) =>
        const OfflineMultiplayerResultScreen(),
  };
}
