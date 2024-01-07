part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsAccountInformationEvent extends SettingsEvent {
  const SettingsAccountInformationEvent();
}

class SettingsAddressInformationEvent extends SettingsEvent {
  const SettingsAddressInformationEvent();
}

class SettingsChangePasswordEvent extends SettingsEvent {
  const SettingsChangePasswordEvent();
}
