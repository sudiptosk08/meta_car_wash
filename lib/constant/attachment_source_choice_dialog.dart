// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta_car_wash/utils/colors/app_colors.dart';
import 'package:meta_car_wash/utils/text_styles/text_styles.dart';

class AttachmentSourceChoiceDialog extends StatefulWidget {
  final bool isAllowFiles;

  const AttachmentSourceChoiceDialog({super.key, this.isAllowFiles = false});

  @override
  _AttachmentSourceChoiceDialogState createState() =>
      _AttachmentSourceChoiceDialogState();
}

class _AttachmentSourceChoiceDialogState
    extends State<AttachmentSourceChoiceDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      title: Text("Select attachment source:",
          style: TextStyles.bodyText3.copyWith(fontWeight: FontWeight.w500)),
      actions: <Widget>[
        MaterialButton(
          padding: EdgeInsets.zero,
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: KColor.primary.withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Icon(CupertinoIcons.camera_fill,
                      color: KColor.primary)),
              const SizedBox(height: 5),
              Text("Camera", style: TextStyles.bodyText2),
              const SizedBox(height: 5),
            ],
          ),
          onPressed: () {
            print("Pending Working");
          },
        ),
        MaterialButton(
          padding: EdgeInsets.zero,
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: KColor.primary.withOpacity(0.1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Icon(Icons.image, color: KColor.primary)),
              const SizedBox(height: 5),
              Text("Gallery", style: TextStyles.bodyText3),
              const SizedBox(height: 5),
            ],
          ),
          onPressed: () {
            print("Pending Working");
          },
        ),
        if (widget.isAllowFiles)
          MaterialButton(
            padding: EdgeInsets.zero,
            child: Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: KColor.primary.withOpacity(0.1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: const Icon(Icons.file_copy,
                        color: KColor.primary, size: 35)),
                const SizedBox(height: 5),
                Text("Files", style: TextStyles.bodyText3),
                const SizedBox(height: 5),
              ],
            ),
            onPressed: () => Navigator.pop(context, 'file'),
          )
      ],
    );
  }
}
