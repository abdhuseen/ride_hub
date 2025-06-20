import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLang {
  static AppLocalizations getLang({required BuildContext context}){

    return AppLocalizations.of(context)!;
  }
}

