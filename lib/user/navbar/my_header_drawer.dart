import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  _MyHeaderDrawer createState() => _MyHeaderDrawer();
}

class _MyHeaderDrawer extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/profile_user.png'))),
          ),
          const Text("User Name",
              style: TextStyle(color: Colors.white, fontSize: 20)),
          Text("userName2321@gmail.com",
              style: TextStyle(color: Colors.grey[200], fontSize: 14)),
        ],
      ),
    );
  }
}
