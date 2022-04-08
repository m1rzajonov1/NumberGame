import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamenums/screens/game_page/game_cubit.dart';

class GameHomeView extends StatelessWidget {
  const GameHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Determine Game",
          style: TextStyle(fontSize: 30, color: Colors.green),
        ),
      ),
      backgroundColor: Colors.greenAccent,
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: InkWell(
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.green,
                child: context.watch<DetermineCubit>().isVisible
                    ? Text(
                        context
                            .watch<DetermineCubit>()
                            .randNum[index]
                            .toString(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    : const Text(""),
              ),
              onTap: () {
                
                context.read<DetermineCubit>().tekshiribOchir(index);
              },
            ),
          );
        },
        itemCount: context.watch<DetermineCubit>().randNum.length,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: FloatingActionButton(
              
              onPressed: () {
                context.read<DetermineCubit>().restartRand();
              },
              child: Icon(Icons.reviews),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<DetermineCubit>().showRandoms();
            },
            child: Icon(Icons.open_in_browser),
          ),
        ],
      ),
    );
  }
}