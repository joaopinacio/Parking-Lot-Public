import 'package:flutter/material.dart';
import 'package:parking_lot/core/classes/behaviour.dart';
import 'package:parking_lot/layout/components/medium/app_text_input_component.dart';

class AppTextInputStyles {
  AppTextInputStyles._();

  /// ### AppTextInputStyles standard
  ///
  /// __[behaviour]__ Comportamento do Componente
  ///  ///
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
  static AppTextInputComponent standard({
    required Behaviour behaviour,
    required Key fieldKey,
    required TextEditingController controller,
    FocusNode? focusNode,
    String? Function(String?)? validator,
    String? label,
    Color? labelColor,
    Color? errorColor,
    Widget? suffixIcon,
    Function(String)? onFieldSubmitted,
    bool? enabled,
    bool? isDropdown = false,
    bool? isErrorDropdown = false,
    int? maxLength,
    int? maxLines,
    TextInputType? keyboardType,
    bool? isUpperCase = false,
    Function()? onTap,
  }) =>
      AppTextInputComponent(
        behaviour: behaviour,
        fieldKey: fieldKey,
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        label: label,
        labelColor: labelColor,
        errorColor: errorColor,
        suffixIcon: suffixIcon,
        onFieldSubmitted: onFieldSubmitted,
        enabled: enabled,
        isDropdown: isDropdown,
        isErrorDropdown: isErrorDropdown,
        maxLength: maxLength,
        maxLines: maxLines,
        keyboardType: keyboardType,
        isUpperCase: isUpperCase,
        onTap: onTap,
      );
}
