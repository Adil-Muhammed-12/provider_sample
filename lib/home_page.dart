import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/counter_provider.dart';
import 'package:providerdemo/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context,counterProvider,child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
             counterProvider.add();
            },
            child: const Icon(
              Icons.add,
              size: 38,
              color: Colors.black,
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            toolbarHeight: 100,
            leading: const Icon(
              Icons.grid_view,
              color: Colors.black,
            ),
            title: const Text(
              'State Management Demo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
                      ));
                },
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
          body: Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Text('The total count is : ${counterProvider.numbers.last.toString()}'),
                Expanded(
                  child: ListView.builder(
                      itemCount: counterProvider.numbers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(counterProvider.numbers[index].toString()),
                        );
                      }),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
