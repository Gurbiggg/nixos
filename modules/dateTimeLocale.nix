{ config, systemSettings, ... }:

let
  timezone = systemSettings.timezone;
  locale = systemSettings.locale;
in
{
  # Set time/locale
  time.timeZone = timezone;
  i18n.defaultLocale = locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = locale;
    LC_IDENTIFICATION = locale;
    LC_MEASUREMENT = locale;
    LC_MONETARY = locale;
    LC_NAME = locale;
    LC_PAPER = locale;
    LC_TELEPHONE = locale;
    #LC_NUMERIC = locale;
    #LC_TIME = locale;
  };
}
