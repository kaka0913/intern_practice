// Flutter imports:
import 'package:flutter/material.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Demo'),
      ),
      drawer: Drawer(
        //①appbar:と同階層に配置
        child: ListView(
          //②child:としてListViewを配置
          padding: EdgeInsets.zero,
          children: const <Widget>[
            //③ListViewのchidrenにはHeaderをひとつ、子要素を複数個配置。
            DrawerHeader(
              //　ここでのHeader：DrawerHeader()を入れて、
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              //　子要素としてはListTileを入れる
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
