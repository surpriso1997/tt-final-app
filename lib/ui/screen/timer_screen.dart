import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  ValueNotifier<int> timer = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          // color: Colors.green,
          width: double.infinity,
          child: ValueListenableBuilder<int>(
            valueListenable: timer,
            child: Text(
              "The current value is :",
              style: TextStyle(color: Colors.black),
            ),
            builder: (context, time, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  child!,
                  Text(
                    time.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                  MaterialButton(
                    onPressed: () {
                      timer.value = 3;
                    },
                    child: Text("Press me"),
                  )
                ],
              );
            },
          ),
        ));
  }
}
