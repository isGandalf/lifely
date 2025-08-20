import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifely/core/theme/app_colors.dart';
import 'package:lifely/features/langauge/bloc/language_bloc.dart';
import 'package:lifely/features/langauge/model/language_model.dart';
import 'package:lifely/features/notifications/presentation/bloc/notification_bloc.dart';

class LanguageSelect extends StatelessWidget {
  const LanguageSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.read<LanguageBloc>().state.locale;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change language',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Trigger bloc event
            context.read<NotificationBloc>().add(NotificationLoadEvent());

            // navigate back
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.scaffoldBackground,
      ),
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: languageModel.length,
            itemBuilder: (context, index) {
              var item = languageModel[index];
              return RadioListTile(
                value: item.languageCode,
                groupValue: state.locale.languageCode,
                title: Text(item.language),
                subtitle: Text(item.subLanguage),
                onChanged: (value) {
                  if (value != null) {
                    context.read<LanguageBloc>().add(
                      LanguageChangeEvent(newLocale: Locale(value)),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
