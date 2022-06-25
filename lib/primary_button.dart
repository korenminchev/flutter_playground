import 'package:flutter_playground/app_ui.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext)? popupActionsBuilder;
  final void Function(dynamic)? onPopupItemSelected;
  const PrimaryButton(
    {required this.text,
    required this.onTap,
    this.popupActionsBuilder,
    this.onPopupItemSelected,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppUI.setUntitsSize(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              onTap != null ? AppUI.primaryColor : AppUI.lightGrayColor),
            splashFactory: NoSplash.splashFactory,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: popupActionsBuilder == null ?
                    BorderRadius.circular(12.0) :
                    const BorderRadius.horizontal(left: Radius.circular(12.0))
              )
            )
          ),
          onPressed: onTap,
          child: SizedBox(
            width: AppUI.widthUnit * 36,
            height: AppUI.heightUnit * 7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (popupActionsBuilder != null)
                  SizedBox(
                    width: AppUI.widthUnit * 9,
                    height: AppUI.heightUnit * 7,
                  ),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (popupActionsBuilder != null)
          Container(
            width: AppUI.widthUnit * 9,
            height: AppUI.heightUnit * 7,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(12.0)),
              color: onTap != null ? AppUI.primaryColor : AppUI.lightGrayColor
            ),
            child: PopupMenuButton(
              itemBuilder: popupActionsBuilder!,
              onSelected: onPopupItemSelected,
            )
          )
      ],
    );
  }
}
