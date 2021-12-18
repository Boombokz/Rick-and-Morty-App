import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateAppInit extends StatefulWidget {
  const RateAppInit({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(RateMyApp) builder;

  @override
  _RateAppInitState createState() => _RateAppInitState();
}

class _RateAppInitState extends State<RateAppInit> {
  RateMyApp? rateMyApp;

  static const playStoreId = 'com.madi.rick_and_morty_test';

  @override
  Widget build(BuildContext context) => RateMyAppBuilder(
        rateMyApp: RateMyApp(
          googlePlayIdentifier: playStoreId,
          minDays: 0,
          minLaunches: 2,
          remindDays: 7,
          
        ),
        onInitialized: (context, rateMyApp) {
          setState(() {
            this.rateMyApp = rateMyApp;
          });

          if (rateMyApp.shouldOpenDialog) {
            rateMyApp.showRateDialog(context);
          }
        },
        builder: (context) {
          return rateMyApp == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : widget.builder(rateMyApp!);
        },
      );
}
