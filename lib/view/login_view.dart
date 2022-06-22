import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spotifyredesign/core/constants/constants.dart';
import 'package:spotifyredesign/core/constants/padding_theme.dart';
import 'package:spotifyredesign/core/images/image_constants.dart';
import 'package:spotifyredesign/services/login_services.dart';
import 'package:spotifyredesign/view/index_view.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);
  ImageConstants imageConstants = ImageConstants.instance;
  final paddingTheme = PaddingTheme();
  final constants = Constants();
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginServices loginServices = LoginServices();
  final storage = FlutterSecureStorage();

  final clientIdTextController = TextEditingController();
  final clientSecretTextController = TextEditingController();

  Future<void> onLoginButtonPress() async {
    if (clientIdTextController.text == '') {
      print('null');
    } else if (clientSecretTextController.text == '') {
      print('null');
    } else {
      late String clientId = clientIdTextController.text;
      late String clientSecret = clientSecretTextController.text;

      final token = await loginServices.fetchGetLogin(
          clientId: clientId, clientSecret: clientSecret);
      //print(token);
      await storage.write(key: 'token', value: 'Bearer $token');
      if (token != '') {
        // Navigator.pushReplacementNamed(context, '/');
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    clientIdTextController.dispose();
    clientSecretTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: bodyContainer(context),
    );
  }

  Container bodyContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.imageConstants.temaBackground),
          fit: BoxFit.cover,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: widget.paddingTheme.defaultPadding,
      child: formList(context),
    );
  }

  Column formList(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.constants.login,
          style: Theme.of(context).textTheme.headline4!,
        ),
        SizedBox(
          height: widget.paddingTheme.sizeBoxBottomContainer,
        ),
        TextField(
          style: TextStyle(fontSize: 22.0, color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black.withOpacity(0.1),
            hintText: 'Client ID',
            contentPadding: const EdgeInsets.only(
                left: 25.0, bottom: 16.0, top: 16.0, right: 25.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade800),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          controller: clientIdTextController,
        ),
        SizedBox(
          height: widget.paddingTheme.textfieldMarginBottom,
        ),
        TextField(
          obscureText: true,
          style: TextStyle(fontSize: 22.0, color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black.withOpacity(0.1),
            hintText: 'Client Secret Password',
            contentPadding: const EdgeInsets.only(
                left: 25.0, bottom: 16.0, top: 16.0, right: 25.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.shade800),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          controller: clientSecretTextController,
        ),
        SizedBox(
          height: widget.paddingTheme.sizeBoxBottomContainer,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 27, 130, 30), // background
              onPrimary: Colors.white, // foreground,
              padding: const EdgeInsets.only(
                  left: 25.0, bottom: 16.0, top: 16.0, right: 25.0),
              textStyle: TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(8.0),
              )),
          onPressed: onLoginButtonPress,
          child: Text(widget.constants.login),
        )
      ],
    );
  }
}
