import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PanicTile extends StatelessWidget {
  final String userName;
  final String mobileNumber;
  final String latitude;
  final String longitude;
  Function(BuildContext)? deleteFunction;

  PanicTile(
      {super.key,
      required this.userName,
      required this.mobileNumber,
      required this.latitude,
      required this.longitude,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Card(
        elevation: 10,
        // color: Colors.blueAccent,
        shadowColor: Colors.redAccent,
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: deleteFunction,
                  icon: Icons.delete,
                  backgroundColor: Colors.red.shade300,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)))
            ],
          ),
          child: Container(
            constraints: BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 +
                      120.0,
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  userName,
                ),
                SizedBox(
                  height: 1,
                ),
                Text(
                  mobileNumber,
                ),
                SizedBox(
                  height: 1,
                ),
                Text(latitude),
                SizedBox(
                  height: 1,
                ),
                Text(longitude),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent[200],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
          ),
        ),
      ),
    );
  }
}
