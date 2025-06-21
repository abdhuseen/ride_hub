import 'package:flutter/cupertino.dart';
import '../l10n/app_localizations.dart';

class AppLang {
  static AppLocalizations getLang({required BuildContext context}){

    return AppLocalizations.of(context)!;
  }
}

