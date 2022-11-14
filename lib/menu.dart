import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'converter_event.dart';
import 'converter_bloc.dart';
import 'converter_state.dart';

import 'controller.dart';

class MyMenu extends StatefulWidget {
  const MyMenu({super.key});

  @override
  State<MyMenu> createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
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
                  itemCount: ReadMyBox(0).length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.only(
                        top: 1,
                        bottom: 1,
                      ),
                      color: Colors.green,
                      child: Container(
                          child: Row(
                        children: [
                          Text(ReadMyBox(1)[index]!),
                          Spacer(),
                          RawMaterialButton(
                            onPressed: () {
                              context
                                  .read<ConverterBloc>()
                                  .add(DownloadDocumentHistory(
                                    Extension: ReadMyBox(2)[index],
                                    name: ReadMyBox(1)[index],
                                    url: ReadMyBox(0)[index],
                                  ));
                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.download,
                              size: 15,
                            ),
                            padding: EdgeInsets.all(1.0),
                            shape: CircleBorder(),
                          )
                        ],
                      )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
