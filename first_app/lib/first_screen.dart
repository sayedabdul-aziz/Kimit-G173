import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        centerTitle: true,
        title: const Text(
          'My First App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                // size: 18,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              )),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Designed By',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Sayed Abdul-AZIZ',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 60,
              // backgroundColor: Colors.amber,
              backgroundImage: AssetImage('assets/112.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            // Image.asset(
            //   'assets/112.jpg',
            //   width: 250,
            //   height: 100,
            //   fit: BoxFit.cover,
            // ),
            // ClipRRect(
            // borderRadius: BorderRadius.circular(20),
            //   borderRadius:
            //       const BorderRadius.horizontal(left: Radius.circular(20)),
            // borderRadius: const BorderRadius.all(Radius.circular(20)),
            // borderRadius: const BorderRadius.only(
            //     topLeft: Radius.circular(20),
            //     bottomRight: Radius.circular(20)),
            //   child: Image.asset(
            //     'assets/112.jpg',
            //     width: 250,
            //   ),
            // ),
            const Text(
              'Ahmed Ali',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_rounded,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.redAccent,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.snapchat,
                      color: Colors.yellow,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.telegram_rounded,
                      color: Colors.blueAccent,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.email_rounded,
                      color: Colors.grey,
                    )),
              ],
            ),

            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                //
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                // margin: const EdgeInsets.only(),
                // margin: const EdgeInsets.symmetric(horizontal: 20),
                // margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white38,
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(5, 10)),
                    ],
                    // border: Border.all(color: Colors.white),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Nasr City, Cairo')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
