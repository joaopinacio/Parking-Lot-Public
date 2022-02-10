import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/* 
    AppAnimSearchBarComponent(
      color: AppThemes.colors.secondaryBlack,
      style: AppThemes.typography.zonaProSemiBold_16.copyWith(
        color: AppThemes.colors.white,
      ),
      autoFocus: true,
      width: 340.w,
      helpText: 'Pesquisar',
      closeSearchOnSuffixTap: true,
      textController: textController,
      rtl: true,
      onSuffixTap: () {
        textController.clear();
      },
      callbackStatus: (bool status) {},
    ),
*/

class AppAnimSearchBarComponent extends StatefulWidget {
  ///  width - double ,isRequired : Yes
  ///  textController - TextEditingController  ,isRequired : Yes
  ///  onSuffixTap - Function, isRequired : Yes
  ///  rtl - Boolean, isRequired : No
  ///  autoFocus - Boolean, isRequired : No
  ///  style - TextStyle, isRequired : No
  ///  closeSearchOnSuffixTap - bool , isRequired : No
  ///  suffixIcon - Icon ,isRequired :  No
  ///  prefixIcon - Icon  ,isRequired : No
  ///  animationDurationInMilli -  int ,isRequired : No
  ///  helpText - String ,isRequired :  No
  /// inputFormatters - TextInputFormatter, Required - No

  final double width;
  final TextEditingController textController;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String helpText;
  final int animationDurationInMilli;
  final Function() onSuffixTap;
  final bool rtl;
  final bool autoFocus;
  final TextStyle? style;
  final bool closeSearchOnSuffixTap;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;
  final Function(bool) callbackStatus;

  const AppAnimSearchBarComponent({
    Key? key,

    /// The width cannot be null
    required this.width,

    /// The textController cannot be null
    required this.textController,
    this.suffixIcon,
    this.prefixIcon,
    this.helpText = "Search...",

    /// choose your custom color
    this.color = Colors.white,

    /// The onSuffixTap cannot be null
    required this.onSuffixTap,
    this.animationDurationInMilli = 375,

    /// make the search bar to open from right to left
    this.rtl = false,

    /// make the keyboard to show automatically when the searchbar is expanded
    this.autoFocus = false,

    /// TextStyle of the contents inside the searchbar
    this.style,

    /// close the search on suffix tap
    this.closeSearchOnSuffixTap = false,

    /// can add list of inputformatters to control the input
    this.inputFormatters,
    required this.callbackStatus,
  }) : super(key: key);

  @override
  _AppAnimSearchBarComponentState createState() => _AppAnimSearchBarComponentState();
}

///toggle - 0 => false or closed
///toggle 1 => true or open
int toggle = 0;

class _AppAnimSearchBarComponentState extends State<AppAnimSearchBarComponent> with SingleTickerProviderStateMixin {
  ///initializing the AnimationController
  late AnimationController _con;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    ///Initializing the animationController which is responsible for the expanding and shrinking of the search bar
    _con = AnimationController(
      vsync: this,

      /// animationDurationInMilli is optional, the default value is 375
      duration: Duration(milliseconds: widget.animationDurationInMilli),
    );
  }

  unfocusKeyboard() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,

      ///if the rtl is true, search bar will be from right to left
      alignment: widget.rtl ? Alignment.centerRight : const Alignment(-1.0, 0.0),

      ///Using Animated container to expand and shrink the widget
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDurationInMilli),
        height: 42.w,
        width: (toggle == 0) ? 42.w : widget.width,
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          /// can add custom color or the color will be white
          color: widget.color,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: -10.0,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Stack(
          children: [
            ///Using Animated Positioned widget to expand and shrink the widget
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              right: 2.0,
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: EdgeInsets.all(6.sp),
                  decoration: BoxDecoration(
                    /// can add custom color or the color will be white
                    color: widget.color,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: AnimatedBuilder(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        try {
                          ///trying to execute the onSuffixTap function
                          widget.onSuffixTap();

                          ///closeSearchOnSuffixTap will execute if it's true
                          if (widget.closeSearchOnSuffixTap) {
                            unfocusKeyboard();
                            setState(() {
                              toggle = 0;
                            });
                            widget.callbackStatus(false);
                          }
                        } catch (e) {
                          ///print the error if the try block fails
                          if (kDebugMode) print(e);
                        }
                      },

                      ///suffixIcon is of type Icon
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 6.h,
                          bottom: 6.h,
                          right: 10.w,
                          left: 10.w,
                        ),
                        child: widget.suffixIcon ??
                            Icon(
                              Icons.close,
                              size: 17.sp,
                            ),
                      ),
                    ),
                    builder: (context, widget) {
                      ///Using Transform.rotate to rotate the suffix icon when it gets expanded
                      return Transform.rotate(
                        angle: _con.value * 2.0 * pi,
                        child: widget,
                      );
                    },
                    animation: _con,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              left: (toggle == 0) ? 20.w : 35.w,
              curve: Curves.easeOut,
              top: 9.h,

              ///Using Animated opacity to change the opacity of th textField while expanding
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: EdgeInsets.only(left: 8.w),
                  alignment: Alignment.topCenter,
                  width: widget.width / 1.38,
                  child: TextField(
                    ///Text Controller. you can manipulate the text inside this textField by calling this controller.
                    controller: widget.textController,
                    inputFormatters: widget.inputFormatters,
                    focusNode: focusNode,
                    cursorRadius: Radius.circular(10.r),
                    cursorWidth: 1.5.w,
                    onEditingComplete: () {
                      /// on editing complete the keyboard will be closed and the search bar will be closed
                      unfocusKeyboard();
                      setState(() {
                        toggle = 0;
                      });
                      widget.callbackStatus(false);
                    },

                    ///style is of type TextStyle, the default is just a color black
                    style: widget.style ?? const TextStyle(color: Colors.black),
                    cursorColor: widget.style!.color,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 4.h),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: widget.helpText,
                      labelStyle: widget.style,
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ///Using material widget here to get the ripple effect on the prefix icon
            Material(
              /// can add custom color or the color will be white
              color: widget.color,
              borderRadius: BorderRadius.circular(30.0.r),
              child: IconButton(
                splashRadius: 19.0.r,

                ///if toggle is 1, which means it's open. so show the back icon, which will close it.
                ///if the toggle is 0, which means it's closed, so tapping on it will expand the widget.
                ///prefixIcon is of type Icon
                icon: widget.prefixIcon != null
                    ? toggle == 1
                        ? Icon(
                            Icons.arrow_back_ios,
                            size: 15.sp,
                          )
                        : widget.prefixIcon!
                    : Icon(
                        toggle == 1 ? Icons.arrow_back_ios : Icons.search,
                        size: 17.sp,
                      ),
                onPressed: () {
                  setState(
                    () {
                      ///if the search bar is closed
                      if (toggle == 0) {
                        toggle = 1;
                        setState(() {
                          ///if the autoFocus is true, the keyboard will pop open, automatically
                          if (widget.autoFocus) FocusScope.of(context).requestFocus(focusNode);
                        });

                        ///forward == expand
                        _con.forward();
                        widget.callbackStatus(true);
                      } else {
                        ///if the search bar is expanded
                        toggle = 0;

                        ///if the autoFocus is true, the keyboard will close, automatically
                        setState(() {
                          if (widget.autoFocus) unfocusKeyboard();
                        });

                        ///reverse == close
                        _con.reverse();
                        widget.callbackStatus(false);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
