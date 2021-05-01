import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_test/blocs/character_bloc/character_bloc.dart';
import 'package:rick_and_morty_test/const.dart';
import 'package:rick_and_morty_test/widgets/appbar_widget.dart';
import 'package:rick_and_morty_test/widgets/character_properties.dart';

class CharacterDetailsPage extends StatelessWidget {
  final String name;

  CharacterDetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBarWidget(
        title: '$name',
        backButton: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                color: Color(0xFFE4E4E4).withOpacity(0.20), width: 1),
          ),
        ),
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CharacterLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 177,
                          height: 177,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            height: 175,
                            width: 175,
                            image: NetworkImage(state.character.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          color: greenCircleColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${state.character.status} - ${state.character.species}',
                        style: TextStyle(
                            fontSize: 15,
                            height: 1.20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(height: 33),
                    ],
                  ),
                  SizedBox(height: 33),
                  CharacterProperties(
                    title: 'Origin location',
                    text: state.character.origin.name,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 36,
                    ),
                    child: Divider(
                      height: 0.5,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  CharacterProperties(
                    title: 'Gender',
                    text: state.character.gender,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 36,
                    ),
                    child: Divider(
                      height: 0.5,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                  CharacterProperties(
                    title: 'Location',
                    text: state.character.location.name,
                  ),
                ],
              );
            } else if (state is CharacterLoadErrorState) {
              return Center(
                child: Text('Data could not be loaded'),
              );
            } else {
              return Offstage();
            }
          },
        ),
      ),
    );
  }
}
