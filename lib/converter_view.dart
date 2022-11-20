import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'converter_bloc.dart';
import 'converter_state.dart';
import 'converter_event.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ConverterPageState createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  bool _loading = false;
  final List<String> items = [
    'Word',
    'Powerpoint',
    'Excel',
    'JPG',
  ];
  final List<String> items2 = [];
  String? value;
  String? fileName = 'a';

  @override
  Widget build(BuildContext contex) {
    return BlocProvider(
        create: ((context) => ConverterBloc()),
        child: BlocBuilder<ConverterBloc, ConverterState>(
            builder: (context, state) {
          return Scaffold(
            drawer: const MyMenu(),
            appBar: AppBar(),
            body: Center(
                child: Container(
              padding: const EdgeInsets.only(top: 230),
              child: Column(
                children: [
                  Container(
                    width: 362,
                    height: 40,
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color.fromARGB(57, 198, 198, 198),
                            width: 2)),
                    child: Container(
                      color: Colors.white,
                      child: TextButton(
                        onPressed: (() {
                          context.read<ConverterBloc>().add(OpenMyDocument());
                          setState(() {
                            fileName = state.fileName;
                          });
                        }),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const Text("Загрузить файл",
                                style: TextStyle(color: Colors.black)),
                            const SizedBox(width: 200),
                            const Icon(
                              Icons.add_box,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Выбранный файл:   ${state.fileName} ',
                  ),

//----------------------------------------------------
                  Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: 362,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: const Color.fromARGB(57, 198, 198, 198),
                              width: 2)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        value: value,
                        isExpanded: true,
                        items: state.listExtensionString
                            .map(buildMenuItem)
                            .toList(),
                        onChanged: (value) => setState(
                          () {
                            context.read<ConverterBloc>().add(ConverterDocument(
                                  Extension: value,
                                ));

                            this.value = value;
                            _loading = true;
                            Timer(const Duration(seconds: 3), () {
                              setState(() {
                                _loading = false;
                              });
                            });
                          },
                        ),
                      ))),
//-----------------------------------------------------

                  _loading ? circularProgressIndicator() : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 362,
                    height: 40,
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color.fromARGB(57, 198, 198, 198),
                            width: 2)),
                    child: Container(
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () {
                          context.read<ConverterBloc>().add(DownloadDocument(
                                Extension: value,
                              ));
                        },
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const Text("Скачать файл",
                                style: TextStyle(color: Colors.black)),
                            const SizedBox(width: 212),
                            const Icon(
                              Icons.archive_sharp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
        }));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
              fontSize: 15,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold),
        ),
      );
}

Widget circularProgressIndicator() {
  return Container(
      width: 40,
      height: 60,
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          CircularProgressIndicator(),
        ],
      ));
}
