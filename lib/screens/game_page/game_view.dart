import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamenums/screens/game_page/game_cubit.dart';
import 'package:gamenums/screens/game_page/game_state.dart';

class GameHomeView extends StatelessWidget {
  const GameHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => DetermineCubit()),
      child: BlocBuilder<DetermineCubit, DetermineState>(
        builder: ((context, state) => myScaffold(context)),
      ),
    );
  }

  Scaffold myScaffold(BuildContext context) {
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
      backgroundColor: const Color.fromARGB(255, 125, 200, 164),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
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
              child: const Icon(Icons.restart_alt),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<DetermineCubit>().showRandoms();
            },
            child: const Icon(Icons.slideshow),
          ),
        ],
      ),
    );
  }
}
