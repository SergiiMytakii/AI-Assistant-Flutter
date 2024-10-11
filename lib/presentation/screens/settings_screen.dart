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
    Future.microtask(() => setState(() {
          _selectedLanguage =
              prefs.getString('language') ?? context.locale.languageCode;
        }));
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
                Row(
                  children: [
                    const Icon(Icons.language),
                    const SizedBox(width: 10),
                    Text('Language'.tr(context: context)),
                    const Spacer(),
                    DropdownButton<String>(
                      value: _selectedLanguage.tr(context: context),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() async {
                            _selectedLanguage = newValue;
                            context.setLocale(Locale(newValue));
                            await prefs.setString(
                                'language', _selectedLanguage);
                          });
                        }
                      },
                      items: languagesCodes.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.tr(context: context)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                // Add more settings here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
