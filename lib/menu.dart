import 'package:flutter/material.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 23,
            ),
            Container(
              child: Text(
                'История',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 6.0,
                  ),
                  itemCount: 300,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 1,
                        bottom: 1,
                      ),
                      color: Colors.blue,
                      child: Center(child: Text('$index')),
                    );
                  }),
            )
          ],
        ),
      ),

      // ListView(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.only(top: 8, bottom: 8),
      //       decoration:
      //           BoxDecoration(border: Border(bottom: BorderSide(width: 2))),
      //       child: Center(
      //         child: Text(
      //           'История',
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 34,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Text('name'),
      //     Text('My name esss==='),
      //   ],
      // ),
    );
  }
}
