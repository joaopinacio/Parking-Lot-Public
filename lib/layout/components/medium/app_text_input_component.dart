import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/core/classes/component.dart';
import 'package:parking_lot/layout/app_layout_imports.dart';

class AppTextInputComponent extends StatelessWidget with Component {
  /// ### AppTextInputComponent
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///
  /// __[fieldKey]__ Chave do campo para o Form
  ///
  /// __[controller]__ Controlador do campo
  ///
  /// __[focusNode]__ Objeto de controlo de foco do campo
  ///
  /// __[validator]__ Funcao de validacao do campo
  ///
  /// __[label]__ Titulo do campo
  ///
  /// __[labelColor]__ Cor do Titulo
  ///
  /// __[errorColor]__ Cor de erro
  ///
  /// __[suffixIcon]__ Icone a direita do campo
  ///
  /// __[onFieldSubmitted]__ Funcao de retorno quando o campo for finalizado
  ///
  /// __[enabled]__ Se o campo está habilitado para escrever
  ///
  /// __[isDropdown]__ Se o campo é um dropdown (vai para uma pagina de listagem)
  ///
  /// __[isErrorDropdown]__ Se o Campo de dropdown estiver com erro
  ///
  /// __[maxLength]__ Tamanho maximo de caracteres
  ///
  /// __[maxLines]__ Tamanho maximo de linhas que o campo pode ter
  ///
  /// __[keyboardType]__ Tipo do Teclado
  ///
  /// __[isUpperCase]__ Se é para deixar os caracteres escrito em Upper
  ///
  /// __[onTap]__ Funcao clique do campo
  ///
  final Behaviour behaviour;
  final Key fieldKey;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? label;
  final Color? labelColor;
  final Color? errorColor;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmitted;
  final bool? enabled;
  final bool? isDropdown;
  final bool? isErrorDropdown;
  final int? maxLength;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool? isUpperCase;
  final Function()? onTap;

  const AppTextInputComponent({
    Key? key,
    required this.behaviour,
    required this.fieldKey,
    required this.controller,
    this.focusNode,
    this.validator,
    this.label,
    this.labelColor,
    this.errorColor,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.enabled,
    this.isDropdown = false,
    this.isErrorDropdown = false,
    this.maxLength,
    this.maxLines,
    this.keyboardType,
    this.isUpperCase = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return render(context, behaviour);
  }

  @override
  Widget whenRegular(BuildContext context, Behaviour childBehaviour) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Form(
        key: fieldKey,
        child: TextFormField(
          enabled: enabled ?? true,
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          maxLines: maxLines ?? 1,
          minLines: 1,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: (maxLines != null) ? 10.h : 0),
            labelText: label,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: suffixIcon,
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 30,
            ),
            labelStyle: AppThemes.typography.zonaProSemiBold_12.copyWith(
              color: (isDropdown!
                  ? isErrorDropdown!
                      ? Colors.red
                      : labelColor ?? AppThemes.colors.secondaryBlack
                  : labelColor ?? AppThemes.colors.secondaryBlack),
            ),
            errorStyle: AppThemes.typography.zonaProSemiBold_8.copyWith(
              color: errorColor ?? AppThemes.colors.secondaryRed,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                  color: isDropdown!
                      ? isErrorDropdown!
                          ? AppThemes.colors.secondaryRed
                          : Colors.black45
                      : AppThemes.colors.secondaryRed),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: isDropdown! ? Colors.black45 : Colors.black26),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          inputFormatters: [
            //if (formatPhoneField == true) MaskedInputFormatter('(##)#####-####'),
            LengthLimitingTextInputFormatter(maxLength),
            if (keyboardType == TextInputType.number) FilteringTextInputFormatter.digitsOnly,
            if (isUpperCase!) UpperCaseTextFormatter(),
          ],
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
