import 'package:flutter/material.dart';

import 'controller.dart';

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
                  itemCount: ReadMyBox().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 1,
                        bottom: 1,
                      ),
                      color: Colors.blue,
                      child: Center(child: Text(ReadMyBox()[0]!)),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
