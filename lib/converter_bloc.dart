import 'dart:math';

import 'package:cloudconvert_client/cloudconvert_client.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/converter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'converter_event.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  String? nameFString = " ";
  String? pathFString = " ";
  String ExtensionURL = " ";

  //Sandbox
  Client newclient = Client(
    apiKey:
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZjliMmMyODI5NWY0ODBhNmFlODFjN2QyZjdjM2JlNzE0NjAwZjEwYTVmMDk2YmJkNGZlOThkMWQzNTk4ZjkyMThlOGMzZDI2MGE3YmYxYTAiLCJpYXQiOjE2NjY1NDcxOTMuMDI5MzE4LCJuYmYiOjE2NjY1NDcxOTMuMDI5MzIsImV4cCI6NDgyMjIyMDc5My4wMjY1NDYsInN1YiI6IjYwMzM1NTE2Iiwic2NvcGVzIjpbInVzZXIud3JpdGUiLCJ1c2VyLnJlYWQiLCJ0YXNrLnJlYWQiLCJ0YXNrLndyaXRlIiwid2ViaG9vay5yZWFkIiwid2ViaG9vay53cml0ZSIsInByZXNldC5yZWFkIiwicHJlc2V0LndyaXRlIl19.nYVGaeqTzxmdLLr8Ehnq0WKznYo5AaQ2rQ9HC3qzTtY-18vApLQFwK4mfvj6adbKExECVw2Q5WU-JxRAIvRd734qRqgUjJjlEEBZx_ipd4WvUaSyb3FzQUy_-ISQAdEx8znYkBX9zVx6z-3OzbvSnp3LNy2laiZPUTo8bxv6rXxOTYyHxluoXqMTlW_WMweUUQnKdKdSa6U1i-uE9iGm76PqTZd0smNnytL_fM1MDuxQ-hRP3y3js9B0PnD8RTOieT1AojY0lRqVuocCN48I4CdTMuEugVg-NkwuKXIO4x4MYEIMU0Z5GpVE4om9UHvLiPFhIQEY4OKHyIqHisSgI2EbD-zsSrQlsAyp6Z_dOA0mG2cDbadUlQlM5GTnG84rB0DOlv94L3ahn-g6LaRdX2ltVTQGOIkGsQwW3Jwyo41Qa-B9tVQfDOsAHbCk1vETl6O16-d1iup8yMcoXDesOulrHeJ_yZLwBBNlNrUfZ7jcxITOKLgfIgRvYAdMH0ic5yNngujdfqG2O68rt2mIGmExqq1bykto1RZEET3kxoK-ZDJ5JH83cZHGJpJGlndd_DxEj-MbWGzvlWM9bW2Pr3Pk4aCfR6r9RYPfoZUv-kS-bnHvHYa4V9VHsERIN9mFqa9w-hfIDjR5nR-ZKCWYCxf2ksgftGMOKB5AhwfCeGQ",
    baseUrls: BaseUrls.sandbox,
  );

  //Live
  // Client newclient = Client(
  //   apiKey:
  //       "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmI5YTljNTM5OWE2ZGViNjMwZWM3NDAzOTkxYTBlZmU5NjQzMDk4YTZmY2RkOGQzZGVkZmQ1MjRiYzA0MDczY2Y0NDZhMmQ0ODM4NGYyYTEiLCJpYXQiOjE2NjY1Njg5ODIuMDY5MjA3LCJuYmYiOjE2NjY1Njg5ODIuMDY5MjA4LCJleHAiOjQ4MjIyNDI1ODIuMDYxMjY2LCJzdWIiOiI2MDMzNTUxNiIsInNjb3BlcyI6WyJ1c2VyLnJlYWQiLCJ1c2VyLndyaXRlIiwidGFzay5yZWFkIiwidGFzay53cml0ZSIsIndlYmhvb2sucmVhZCIsIndlYmhvb2sud3JpdGUiLCJwcmVzZXQucmVhZCIsInByZXNldC53cml0ZSJdfQ.LasBzy5FtvHRnPSzyL6tF3cGlaMxVflKV0M00P08fMEbCDMmVA8uOCXF7WDoKStbiHfokyv8C0N6D6063dgAT7ErBK3-gdXgKDSeCrcDz0R6sgdqplwuANqMHAlIVoHd7C8BX65fvChKODIB1Rbwk4oevvh4iaRWnTlNC1zCNfemzrsjjkhnTiuvHRqC7YQ0EpS67gMsZyelASvPMKydA6e3Irf7AzD76LEUTucwHiIzf6QrVBL5K7SmBz2rcZAh29D5DjKsxWErCYmlhop51pWv42AMiZjkl9iHfOzkrQZfoH-hP8F5gMeLswrQE_Jv3on2OZw2GT5Sy6w_E68pM3uOSLqML7sO7iEF9DK0f_MOxyxd5FZV5Ob7tOqRZXcXp_kt1jkv9Q1Dm4n31J4fqadFQMJEj5jf-YTu5KhCr_J2DzMRAbFGtckbpbYGIqddWk53ZzaqyTQyjixQrDLY_iG4Z8FT3zfA1NDupb_gNmJ9TP14XffdPk1yYauLQ_Y4ovgrAKi-JXQJGkAtx_WmoQcoaRmVAvW6sTEe6wm7V1pOr9vT6ewv9cVUdYgF-6ZLsxOvOVoeU50YcdmnD_2Nep6vxW09xUQ-GYrKX39il7foZOIg3_Q50jwF1NTBCSzsghCDs0lSWfB1S-sljQfqyqt0lcL7zb-liRPbgOXnygE",
  //   baseUrls: BaseUrls.live,
  // );

  ConverterBloc() : super(const ConverterState()) {
    on<ConverterEvent>((event, emit) async {
      if (event is OpenMyDocument) {
        await GetAnExtension(event, state, emit);
      } else if (event is ConverterDocument) {
        await Convertor(event, state, emit);
      } else if (event is DownloadDocument) {
        await Download(event, state, emit);
      } else {}
    });
  }
  //получение расширений
  Future GetAnExtension(OpenMyDocument event, ConverterState state,
      Emitter<ConverterState> emit) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      int found = 0;
      nameFString = file.name;
      pathFString = file.path;
      //==================================================

      ConverterResult token =
          (await newclient.getSupportedFormats(pathFString.toString()));
      if (token.exception != null) {
        print(token.exception);
      } else {
        print(token.result);
        emit(state.copyWith(
            fileName: nameFString,
            filePath: pathFString,
            listExtensionString: token.result));
      }
    }
  }

  //Блок конвертации
  Future Convertor(ConverterDocument event, ConverterState state,
      Emitter<ConverterState> emit) async {
    String? Extension = event.Extension;
    ConverterResult url =
        (await newclient.postJob(pathFString.toString(), Extension.toString()));
    if (url.exception != null) {
      print(url.exception);
    } else {
      print(url.result);
      ExtensionURL = url.result;
    }
    emit(state.copyWith());
  }

  //Блок скачивания
  Future Download(DownloadDocument event, ConverterState state,
      Emitter<ConverterState> emit) async {
    String? Extension = event.Extension;
    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: 'output-file.$Extension',
    );

    if (outputFile == null) {
      // User canceled the picker
    }

    String myFileName;
    int found = 0;
    int foundName = 0;

    String path = myFileName = outputFile.toString();
    //Поиск имяни файла вместе с раширением
    while (found != -1) {
      found = myFileName.indexOf('\\');
      myFileName = myFileName.substring(found + 1);
    }
    //Откусываем расширение
    found = myFileName.indexOf('.');
    myFileName = myFileName.substring(0, found);

    foundName = myFileName.length; //Нахождение длинны имяни
    found = path.indexOf('.');
    path = path.substring(0, found - foundName); //Нахождение нужной деректории

    // print(outputFile.toString());
    // print(myFileName);
    // print(path);
    // print(Extension);

    //Скачивание файла
    ConverterResult response = await newclient.downloadResult(
        ExtensionURL, myFileName, Extension.toString(), path);
    if (response.exception != null) {
      print(response.exception);
    } else {
      print('Файл скачен');
      emit(state.copyWith());
    }
  }
}
