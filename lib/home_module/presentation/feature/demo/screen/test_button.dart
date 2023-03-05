import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_downloder/base_module/domain/entity/app_theme_singleton.dart';

import '../../../../../base_module/presentation/fature/theming/bloc/theme_bloc.dart';


class ThemeSwitcherButtons extends StatefulWidget {
  @override
  _ThemeSwitcherButtonsState createState() => _ThemeSwitcherButtonsState();
}

class _ThemeSwitcherButtonsState extends State<ThemeSwitcherButtons> {
  late ThemeBloc _themeBloc;
  bool isLight = true;

  @override
  void initState() {
    super.initState();

    _themeBloc = BlocProvider.of<ThemeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select  Theme"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                IconButton(onPressed: (){
                  _themeBloc.add(const ChangeTheme(
                    themeType: ThemeType.light,
                  ));
                }, icon: Icon(Icons.sunny)),
                SizedBox(width: 10,),
                IconButton(onPressed: (){
                  _themeBloc.add(const ChangeTheme(
                    themeType: ThemeType.dark,
                  ));
                }, icon: Icon(Icons.dark_mode_outlined))
              ],
            ),
          ],
        );
      },
    );
  }
}
