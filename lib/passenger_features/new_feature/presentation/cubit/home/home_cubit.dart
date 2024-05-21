import 'package:bloc/bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<String> locationHistory = ["Ghazi Road", "Model Town", "Punjab Socitey"];
  List<String> offersList = [
    "assets/imgs/temp/a.png",
    "assets/imgs/temp/b.png",
    "assets/imgs/temp/c.jpg",
    "assets/imgs/temp/d.jpg",
    "assets/imgs/temp/e.jpg",
    "assets/imgs/temp/f.jpg"
  ];

  HomeCubit() : super(HomeState().init());
}
