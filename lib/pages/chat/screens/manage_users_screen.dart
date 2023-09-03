import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_contacts/flutter_contacts.dart';

import '../models/app_user.dart';
import '../providers/user_data_provider.dart';
import '../screens/profile_screen.dart';
import '../widgets/user_search_dialog.dart';
// import '../widgets/custom_dialog.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';

class ManageUsersScreen extends StatefulWidget {
  static const routeName = '/manage-users-screen';

  const ManageUsersScreen({super.key});

  @override
  State<ManageUsersScreen> createState() => _ManageUsersScreenState();
}

class _ManageUsersScreenState extends State<ManageUsersScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _manageBlock = false;
  var _isDeleteButtonEnabled = true;

  Future<void> _removeUser(
      AppUser user, UserDataProvider userDataProvider) async {
    var scaffoldMessnger = ScaffoldMessenger.of(context);
    scaffoldMessnger.showSnackBar(SnackBar(
        content:
            Text(_manageBlock ? 'Unblocking User...' : 'Removing Friend...')));
    setState(() {
      _isDeleteButtonEnabled = false;
    });
    await userDataProvider.addOrRemoveUserFriendsAndBlocks(
      block: _manageBlock,
      remove: true,
      user: user,
    );
    scaffoldMessnger.hideCurrentSnackBar();
    scaffoldMessnger.showSnackBar(SnackBar(
        content: Text(_manageBlock ? 'User Unblocked!' : 'Friend Removed!')));
    setState(() {
      _isDeleteButtonEnabled = true;
    });
  }

  Future<void> _showAddOptionsDialog() {
    final deviceSize = MediaQuery.of(context).size;
    return showDialog(
      context: _scaffoldKey.currentContext ?? context,
      builder: (context) {
        return SimpleDialog(
          children: [
            _dialogMenuItem(
              title: 'Add using Email Address',
              onPressed: () {
                Navigator.of(context).pop();
                showAddByEmailDialog(context);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: deviceSize.width * .20,
                  child: const Divider(),
                ),
                SizedBox(width: deviceSize.width * .05),
                SizedBox(
                  width: deviceSize.width * .20,
                  child: const Divider(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _dialogMenuItem({
    required String title,
    required VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: onPressed,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (ctx) {
                  return Text(
                    title,
                    textAlign: TextAlign.center,
                    style: onPressed != null
                        ? null
                        : TextStyle(
                            color: Theme.of(ctx)
                                .textTheme
                                .displayMedium!
                                .color!
                                .withAlpha(125),
                          ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    _manageBlock = ModalRoute.of(context)?.settings.arguments as bool;
    final userDataProvider = Provider.of<UserDataProvider>(context);
    var users = _manageBlock
        ? userDataProvider.userBlocks
        : userDataProvider.userFriends;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      key: _scaffoldKey,
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.25,
        leading: BackButton(
          onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          _manageBlock ? 'Blocked Users' : 'Friends',
          textScaleFactor: 1.25,
        ),
        centerTitle: true,
        actions: [
          if (!_manageBlock)
            IconButton(
              onPressed: () async {
                await _showAddOptionsDialog();
              },
              icon: const Icon(Icons.add),
            ),
        ],
      ),
      body: users.isEmpty
          ? Center(
              child: Text(_manageBlock
                  ? 'You haven\'t blocked anyone!'
                  : 'You have no friends yet!'),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          ProfileScreen.routeName,
                          arguments: users[index]),
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                            'assets/images/default_profile.png'),
                        foregroundImage: users[index].profilePictureURL != null
                            ? NetworkImage(users[index].profilePictureURL!)
                            : null,
                        radius: 30,
                      ),
                    ),
                    title: Text(users[index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_rounded),
                      onPressed: _isDeleteButtonEnabled
                          ? () => _removeUser(users[index], userDataProvider)
                          : null,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
