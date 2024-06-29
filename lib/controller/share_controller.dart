import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ShareController extends GetxController {

  int originalSize = 500;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  ///Onclick share button start
  Future<Uint8List?> onClickShareBtbWithCapturedWidget(
      BuildContext context, previewkey) async {

    final box = context.findRenderObject() as RenderBox?;
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    RenderRepaintBoundary boundary = previewkey.currentContext!
        .findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
    await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    DateTime dateToday = DateTime.now();
    String currentDateTime = dateToday.toString().substring(0, 10);

    final shareResult = await Share.shareXFiles(
      [
        XFile.fromData(pngBytes,
            name: '$currentDateTime.png',
            mimeType: 'image/png',
            length: originalSize),
      ],
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
    return null;


  }

///Onclick share button End


  SnackBar getResultSnackBar(ShareResult result) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("Share result: ${result.status}"),
          const Text("Dismissed by You!"),
          if (result.status == ShareResultStatus.success)
            Text("Shared to: ${result.raw}")
        ],
      ),
    );
  }



}