main()  async {
  print('Task1');
  await doTask();
  print('Task3');
}

doTask() async {
  return Future.delayed(Duration(seconds: 4), () {
    print('Task 2');
  });
}
