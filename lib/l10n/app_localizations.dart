import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @buy_a_car.
  ///
  /// In en, this message translates to:
  /// **'Buy a car'**
  String get buy_a_car;

  /// No description provided for @rental_a_car.
  ///
  /// In en, this message translates to:
  /// **'Rental a car'**
  String get rental_a_car;

  /// No description provided for @economic_cars.
  ///
  /// In en, this message translates to:
  /// **'Economic Cars'**
  String get economic_cars;

  /// No description provided for @electric_cars.
  ///
  /// In en, this message translates to:
  /// **'Electric Cars'**
  String get electric_cars;

  /// No description provided for @luxury_cars.
  ///
  /// In en, this message translates to:
  /// **'Luxury cars'**
  String get luxury_cars;

  /// No description provided for @buses_and_public_transportation.
  ///
  /// In en, this message translates to:
  /// **'Buses and public transportation'**
  String get buses_and_public_transportation;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get see_all;

  /// No description provided for @reservations.
  ///
  /// In en, this message translates to:
  /// **'reservations'**
  String get reservations;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @number_of_reservations.
  ///
  /// In en, this message translates to:
  /// **'Number of reservations'**
  String get number_of_reservations;

  /// No description provided for @our_cars.
  ///
  /// In en, this message translates to:
  /// **'Our Cars'**
  String get our_cars;

  /// No description provided for @jd_day.
  ///
  /// In en, this message translates to:
  /// **'JD/day'**
  String get jd_day;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @capabilities.
  ///
  /// In en, this message translates to:
  /// **'Capabilities'**
  String get capabilities;

  /// No description provided for @images.
  ///
  /// In en, this message translates to:
  /// **'Images'**
  String get images;

  /// No description provided for @book_now.
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get book_now;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign-in'**
  String get sign_in;

  /// No description provided for @please_enter_your_login_credentials_below.
  ///
  /// In en, this message translates to:
  /// **'Please enter your login credentials below'**
  String get please_enter_your_login_credentials_below;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forget_password;

  /// No description provided for @sign_in_btn.
  ///
  /// In en, this message translates to:
  /// **'sign in'**
  String get sign_in_btn;

  /// No description provided for @not_registered.
  ///
  /// In en, this message translates to:
  /// **'Not registered?'**
  String get not_registered;

  /// No description provided for @create_an_account.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get create_an_account;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @car_license_image.
  ///
  /// In en, this message translates to:
  /// **'Car license image'**
  String get car_license_image;

  /// No description provided for @id_image.
  ///
  /// In en, this message translates to:
  /// **'ID image'**
  String get id_image;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @have_account.
  ///
  /// In en, this message translates to:
  /// **'Have account?'**
  String get have_account;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @reservation.
  ///
  /// In en, this message translates to:
  /// **'Reservation'**
  String get reservation;

  /// No description provided for @number_of_booking_days.
  ///
  /// In en, this message translates to:
  /// **'Number of booking days'**
  String get number_of_booking_days;

  /// No description provided for @purpose_of_reservation.
  ///
  /// In en, this message translates to:
  /// **'Purpose of reservation'**
  String get purpose_of_reservation;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @enter_card_details.
  ///
  /// In en, this message translates to:
  /// **'Enter card details'**
  String get enter_card_details;

  /// No description provided for @card_holder.
  ///
  /// In en, this message translates to:
  /// **'Card Holder'**
  String get card_holder;

  /// No description provided for @card_number.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get card_number;

  /// No description provided for @expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiry_date;

  /// No description provided for @cvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get cvv;

  /// No description provided for @send_request.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get send_request;

  /// No description provided for @successful_payment.
  ///
  /// In en, this message translates to:
  /// **'Successful Payment'**
  String get successful_payment;

  /// No description provided for @successful.
  ///
  /// In en, this message translates to:
  /// **'Successful!'**
  String get successful;

  /// No description provided for @wait_for_the_galleries_response.
  ///
  /// In en, this message translates to:
  /// **'Wait for the gallery\'s response'**
  String get wait_for_the_galleries_response;

  /// No description provided for @back_to_home.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get back_to_home;

  /// No description provided for @jd.
  ///
  /// In en, this message translates to:
  /// **'JD'**
  String get jd;

  /// No description provided for @clear_all.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clear_all;

  /// No description provided for @filter_by.
  ///
  /// In en, this message translates to:
  /// **'Filter by'**
  String get filter_by;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @added_day.
  ///
  /// In en, this message translates to:
  /// **'Added Day'**
  String get added_day;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @price_range.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get price_range;

  /// No description provided for @rate_range.
  ///
  /// In en, this message translates to:
  /// **'Rate Range'**
  String get rate_range;

  /// No description provided for @show_result.
  ///
  /// In en, this message translates to:
  /// **'Show Result'**
  String get show_result;

  /// No description provided for @rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rate;

  /// No description provided for @car_rating.
  ///
  /// In en, this message translates to:
  /// **'Car Rating'**
  String get car_rating;

  /// No description provided for @reason_for_evaluation.
  ///
  /// In en, this message translates to:
  /// **'Reason for evaluation'**
  String get reason_for_evaluation;

  /// No description provided for @general_experience.
  ///
  /// In en, this message translates to:
  /// **'General experience'**
  String get general_experience;

  /// No description provided for @former_owner.
  ///
  /// In en, this message translates to:
  /// **'Former owner'**
  String get former_owner;

  /// No description provided for @test_drive.
  ///
  /// In en, this message translates to:
  /// **'Test drive'**
  String get test_drive;

  /// No description provided for @summary_of_your_experience.
  ///
  /// In en, this message translates to:
  /// **'Summary of your experience'**
  String get summary_of_your_experience;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
