import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_collections/utils/utils.dart';

class BoxField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final Key key;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final IconData icon;
  final Color iconColor;
  final Color focusBorderColor;
  final String hintText;
  final String lableText;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Color defaultBorderColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  final FormFieldSetter<String> onSaved;

  const BoxField({
    this.key,
    this.controller,
    this.focusNode,
    TextInputType keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.icon,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.maxLines = 1,
    this.maxLength,
    this.onSaved,
    this.hintText,
    this.lableText,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.defaultBorderColor,
    this.onEditingComplete,
    this.onSubmitted,
    this.iconColor,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.focusBorderColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.validator,
    this.onFieldSubmitted,
  })  : assert(textAlign != null),
        assert(autofocus != null),
        assert(obscureText != null),
        assert(autocorrect != null),
        assert(maxLengthEnforced != null),
        assert(maxLines == null || maxLines > 0),
        assert(maxLength == null || maxLength > 0),
        keyboardType = keyboardType ??
            (maxLines == 1 ? TextInputType.text : TextInputType.multiline);

  @override
  _BoxFieldState createState() => _BoxFieldState();
}

class _BoxFieldState extends State<BoxField> {
  double width;
  double height;
  Color focusBorderColor =  Colors.grey.shade400;
  FocusNode _focusNode = FocusNode();
  ValueChanged<Colors> focusColorChange;

  Screen size;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    size = Screen(MediaQuery.of(context).size);
    return  Container(
      child:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: height / 400),
                padding: EdgeInsets.all(size.getWidthPx(0)),
                alignment: Alignment.center,
                height: size.getWidthPx(40),
                decoration:  BoxDecoration(
                    color: Colors.grey.shade100,
                    border:  Border.all(color: widget.focusBorderColor??Colors.grey.shade400, width: 1.0),
                    borderRadius:  BorderRadius.circular(8.0)),
                child:  TextFormField(
                  key: widget.key,
                  style: TextStyle(fontFamily: 'Exo2'),
                  obscureText: widget.obscureText,
                  controller: widget.controller,
                  onSaved: widget.onSaved,
                  validator: widget.validator,
                  onFieldSubmitted: widget.onFieldSubmitted,
                  decoration:  InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        widget.icon,
                        color: widget.iconColor,
                        size: size.getWidthPx(22),
                      ),
                      hintText: widget.hintText),
                ),
              )),
        ],
      ),
      padding: EdgeInsets.only(bottom :size.getWidthPx(8)),
      margin: EdgeInsets.only(top: size.getWidthPx(8), right: size.getWidthPx(8), left:size.getWidthPx(8)),
    );
  }
}