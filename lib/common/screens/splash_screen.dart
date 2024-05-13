import 'package:ride_options_2/common/const/export.dart';
import 'package:ride_options_2/common/localization/classes/language.dart';
import 'package:ride_options_2/common/localization/cubit/localization_cubit.dart';
import 'package:ride_options_2/common/theme/cubits/theme_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocalizationCubit localizationCubit =
        BlocProvider.of<LocalizationCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.rideOptions),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.black,
              ),
              onChanged: (Language? language) async {
                if (language != null && language.languageCode == 'en') {
                  localizationCubit.setEnglishLocale(); // Switch to English
                } else {
                  localizationCubit.setUrduLocale(); // Switch to Urdu
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 361.w,
          height: 80.h,
          child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<ThemeCubit>(context).toggleTheme();
              },
              child: Text(
                AppLocalizations.of(context)!.pakistan,
                style: TextStyle(fontSize: 28),
              )),
        ),
      ),
    );
  }
}
