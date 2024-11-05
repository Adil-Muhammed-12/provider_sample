import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerdemo/counter_provider.dart';
import 'package:providerdemo/home_page.dart';

class SecondPage extends StatefulWidget {

  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {



  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context,counterProvider,child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
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
            backgroundColor: Colors.green,
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
                        builder: (context) => const HomePage(),
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
