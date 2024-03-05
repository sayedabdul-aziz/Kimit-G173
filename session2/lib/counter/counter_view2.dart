import 'package:flutter/material.dart';

class CounterStatefulView extends StatefulWidget {
  const CounterStatefulView({super.key});

  @override
  State<CounterStatefulView> createState() => _CounterStatefulViewState();
}

class _CounterStatefulViewState extends State<CounterStatefulView> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Counter App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        // elevation: 0,
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      // set state
                      setState(() {
                        counter--;
                      });
                    },
                    icon: const Icon(Icons.remove)),
                // Spacer(),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  // elevation: 0,
                  child: const Icon(Icons.refresh),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      // set state
                      setState(() {
                        counter++;
                      });
                    },
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
