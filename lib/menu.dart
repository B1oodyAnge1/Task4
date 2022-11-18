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
    return BlocProvider(
        create: ((context) => ConverterBloc()),
        child: BlocBuilder<ConverterBloc, ConverterState>(
          builder: (context, state) {
            context.read<ConverterBloc>().add(MyNewHistory());

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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 6.0,
                          ),
                          itemCount: state.historyLength,
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
                                  Text(
                                      '${state.historyName[index]!}.${state.historyExtension[index]!}'),
                                  Spacer(),
                                  RawMaterialButton(
                                    onPressed: () {
                                      context
                                          .read<ConverterBloc>()
                                          .add(DownloadDocumentHistory(
                                            Extension:
                                                state.historyExtension[index],
                                            name: state.historyName[index],
                                            url: state.historyUrl[index],
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
          },
        ));
  }
}
