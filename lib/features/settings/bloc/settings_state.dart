part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsAccountInformationState extends SettingsState {
  const SettingsAccountInformationState();
}
