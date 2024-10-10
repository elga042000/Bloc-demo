import 'package:flutter/material.dart';
import 'package:bloc_demo/counterBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main(){
runApp(const CounterApp());
}
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create:(context)=>CounterBloc(),
          child:const MyHomePage(),
        ),

    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc=BlocProvider.of<CounterBloc>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Bloc Demo'),),
        body: BlocBuilder<CounterBloc,int>(builder: (context,count){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: [
                  Center(child: Text('$count',style: TextStyle(fontSize: 48.0),),),
                ],
              ),
            ),
          );
        },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: (){

                context.read<CounterBloc>().add(CounterIncrement());
              }
          ),
          SizedBox(height: 30,),
                FloatingActionButton(
                child: const Icon(Icons.delete),
                onPressed: (){

                context.read<CounterBloc>().add(CounterDecrement());
                },
                )],
          ),
        ),
      
      
      ),
    );

  }
}
