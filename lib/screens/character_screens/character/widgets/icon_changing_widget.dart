import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morty_test/resources/resources.dart';

import 'package:rick_and_morty_test/screens/character_screens/character/blocs/characters_change_view_bloc/character_change_view_bloc.dart';

class IconChangingWidget extends StatefulWidget {
  @override
  _IconChangingState createState() => _IconChangingState();
}

class _IconChangingState extends State<IconChangingWidget> {
  late bool changed;


  @override
  void initState() {
    changed = BlocProvider.of<CharacterChangeViewBloc>(context).viewChanged;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          changed = !changed;
          BlocProvider.of<CharacterChangeViewBloc>(context)
            ..add(CharacterChangeViewStartEvent(isChanged: changed));
        });
      },
      child: !changed
          ? SvgPicture.asset(IconsRes.listChangeIcon, color: Theme.of(context).iconTheme.color,)
          : SvgPicture.asset(IconsRes.gridChangeIcon, color: Theme.of(context).iconTheme.color,),
    );
  }
}
