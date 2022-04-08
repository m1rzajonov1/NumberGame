import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import 'package:gamenums/screens/game_page/game_state.dart';

class DetermineCubit extends Cubit<DetermineState> {
  DetermineCubit() : super(DetermineInitial());
  List<int> randNum =
      List.generate(6, (index) => Random().nextInt(15)).toList();
  bool isVisible = false;

  void showRandoms() {
    emit(ChangeState());
    isVisible = true;
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isVisible = false;
      emit(ChangeState());
    });
  }

  void restartRand() {
    randNum = List.generate(6, (index) => Random().nextInt(15)).toList();
    emit(ChangeState());
  }

  void tekshiribOchir(int index) {
    randNum.sort(((a, b) => a.bitLength.compareTo(b.bitLength)));
    randNum.sort();
    if (randNum[index] == randNum.first) {
      randNum.removeAt(index);
      emit(ChangeState());
      if (randNum.length == 0) {
        emit(DetermineEnd());
      }
    }
  }
}