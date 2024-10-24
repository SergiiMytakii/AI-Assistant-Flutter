import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ai_assiatant_flutter/core/constants/constants.dart';
import 'package:ai_assiatant_flutter/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedLanguage = 'en';
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() {
        _selectedLanguage =
            prefs.getString('language') ?? context.locale.languageCode;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SizedBox(
            width: kIsWeb ? 400 : double.infinity,
            child: ListView(
              children: [
                _buildLanguageSetting(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildLanguageSetting(BuildContext context) {
    final List<String> languages = languagesCodes.keys.toList();

    return Row(
      children: [
        const Icon(Icons.language),
        const SizedBox(width: 10),
        Text(context.tr('Language')),
        const Spacer(),
        DropdownButton<String>(
          elevation: 0,
          value: _selectedLanguage,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          // style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) async {
            if (newValue != null) {
              setState(() {
                _selectedLanguage = newValue;
              });
              await context.setLocale(Locale(newValue));
              await prefs.setString('language', _selectedLanguage);
            }
          },
          items: languages.map<DropdownMenuItem<String>>((String value) {
            // if (value != _selectedLanguage) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(context.tr(value)),
            );
            // }
          }).toList(),
        ),
      ],
    );
  }
}
