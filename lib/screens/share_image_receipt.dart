import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/dotted_line.dart';
import '../controller/share_controller.dart';

class share_image_receipt extends StatelessWidget {
  share_image_receipt({super.key});

  final GlobalKey repaintBoundaryKey = GlobalKey();

  final ShareController _sharePutController = Get.put(ShareController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Share Image Receipt'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: RepaintBoundary(
                key: repaintBoundaryKey,
                child: Container(
                  height: 350,
                  width: 300,
                  child: Column(
                    children: [
                      Text(
                        '*************************',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'mari431 RECEIPT',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        '*************************',
                        style: TextStyle(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Item Name',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Qty',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Rate',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Amount',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      DottedLine(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chocolate'),
                          Text('5'),
                          Text('10'),
                          Text('50')
                        ],
                      ),
                      DottedLine(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Amount:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('50',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      DottedLine(),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '**********THANK YOU**********',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              // color: Colors.red,
            ),
            ElevatedButton(
              onPressed: () {
                _sharePutController.onClickShareBtbWithCapturedWidget(
                    context, repaintBoundaryKey);
              },
              child: Text('Share'),
            ),
          ],
        ),
      )),
    );
  }
}
