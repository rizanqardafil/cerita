// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shamo/pages/quiz/core/app_route.dart';
// import 'package:shamo/pages/quiz/providers/auth.dart';
// import 'package:shamo/pages/quiz/providers/online.dart';
// import 'package:shamo/pages/quiz/widgets/custom_button.dart';

// import '../widgets/ripple_icon.dart';

// bool isFullRoom(roomAsJson) {
//   return roomAsJson['user1'] != '' && roomAsJson['user2'] != '';
// }

// class MultiplayerSearchScreen extends ConsumerStatefulWidget {
//   const MultiplayerSearchScreen({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _MultiplayerSearchScreenState();
// }

// class _MultiplayerSearchScreenState
//     extends ConsumerState<MultiplayerSearchScreen> {
//   @override
//   void initState() {
//     super.initState();

//     ref.read(roomProvider.notifier).joinRoom().then((_) {
//       final roomName = ref.watch(roomProvider).roomName;
//       final roomRef = FirebaseDatabase.instance.ref('rooms/$roomName');

//       roomRef.onValue.listen((DatabaseEvent event) {
//         final roomAsMap = event.snapshot.value;

//         if (isFullRoom(roomAsMap)) {
//           ref.read(roomProvider.notifier).addSecondUser(roomAsMap);
//           Navigator.of(context).pushReplacementNamed(AppRoute.game);
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final auth = Provider.of<Auth>(context);
//     final room = ref.watch(roomProvider);
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xff1F1147), Color(0xff362679)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               children: [
//                 const RippleIcon(),
//                 ClipOval(
//                   child: Image.network(
//                     auth.user.profilePicture,
//                     width: 80,
//                   ),
//                 ),
//               ],
//             ),
//             const Text(
//               'Looking for online players...',
//               style: TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 10),
//             CustomButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 room.endRoom();
//               },
//               text: 'Quit',
//               color: const Color(0xFF23999B),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
