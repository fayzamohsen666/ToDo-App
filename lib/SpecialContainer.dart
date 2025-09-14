// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'ThirdScreen.dart';

class SpecialContainer extends StatefulWidget {
  String title;
  String subtitle;
  bool isEdit;
  bool isComplete = false;

  SpecialContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.isEdit = true,
  });

  @override
  State<SpecialContainer> createState() => _SpecialContainerState();
}

class _SpecialContainerState extends State<SpecialContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 82,
      margin: const EdgeInsets.fromLTRB(7, 14, 7, 14),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff9395D3),
                ),
              ),
              Text(
                widget.subtitle,
                style: const TextStyle(fontSize: 9.2, color: Colors.black),
              ),
            ],
          ),
          if (widget.isEdit) ...[
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.edit_outlined, color: Color(0xff9395D3)),
              onPressed: () async {
                final result = await Navigator.of(
                  context,
                ).pushNamed(ThirdScreen.routeName);
                if (result != null && result is Map) {
                  setState(() {
                    if (result["title"].isNotEmpty)
                      widget.title = result["title"];
                    if (result["detail"].isNotEmpty)
                      widget.subtitle = result["detail"];
                  });
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Color(0xff9395D3)),
              onPressed: () {
                myContainersNotifier.value = myContainersNotifier.value
                    .where(
                      (item) =>
                          !(item.title == widget.title &&
                              item.subtitle == widget.subtitle),
                    )
                    .toList();
              },
            ),
            IconButton(
              icon: Icon(
                widget.isComplete
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
                color: const Color(0xff9395D3),
              ),
              onPressed: () {
                setState(() {
                  widget.isComplete = !widget.isComplete;
                });
              },
            ),
          ],
        ],
      ),
    );
  }
}
