import 'package:flutter/material.dart';
import '/config/toast_notification_styles.dart';
import '/resources/widgets/loader_widget.dart';
import '/resources/widgets/logo_widget.dart';
import '/resources/widgets/toast_notification_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle appFont = GoogleFonts.montserrat();

Widget logo = const Logo();

Widget loader = const Loader();

Widget getToastNotificationWidget({
  required ToastNotificationStyleType style,
  Function(ToastNotificationStyleMetaHelper helper)? toastNotificationStyleMeta, Function? onDismiss}) {
  if (toastNotificationStyleMeta == null) return const SizedBox.shrink();

  ToastMeta toastMeta = toastNotificationStyleMeta(NyToastNotificationStyleMetaHelper(style));

  return ToastNotification(toastMeta, onDismiss: onDismiss);
}
// File: resources/widgets/toast_notification_styles.dart