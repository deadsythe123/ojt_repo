import 'dart:io';

import 'package:audit_finance_app/firebase/firebase_crud.dart';
import 'package:audit_finance_app/main.dart';
import 'package:audit_finance_app/models/journal.dart';
import 'package:audit_finance_app/screens/diary_entry.dart';
import 'package:audit_finance_app/screens/edit_diary_entry.dart';
import 'package:audit_finance_app/widgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Widget appBarText({required String text}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      foreground: Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Colors.lightGreen,
            Colors.green,
            //add more color here.
          ],
        ).createShader(
          const Rect.fromLTWH(
            0.0,
            0.0,
            400.0,
            100.0,
          ),
        ),
    ),
  );
}

Widget diaryTextField(
    {required TextEditingController controller, required String label}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        filled: true,
        labelText: label,
        fillColor: Colors.black.withOpacity(0.1),
      ),
    ),
  );
}

Widget heightSpacer({required double height}) {
  return SizedBox(
    height: height,
  );
}

Widget widthSpacer({required double width}) {
  return SizedBox(
    width: width,
  );
}

Widget buildEntry(BuildContext context, Journal entry) {
  List<String> entryMenu = ['Edit', 'Delete'];

  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        entry.title,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(entry.date),
                    ),
                  ],
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_horiz_rounded),
                itemBuilder: (context) {
                  return entryMenu
                      .map((e) => PopupMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList();
                },
                onSelected: (value) {
                  if (value == 'Edit') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDiaryEntry(entry: entry),
                      ),
                    );
                  } else if (value == 'Delete') {
                    FirebaseCRUD().deleteEntry(id: entry.id.toString());
                  }
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
            child: Text(
              entry.content,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: entry.imgPath == '' ? null : Image.file(File(entry.imgPath)),
          ),
        ],
      ),
    ),
  );
}
