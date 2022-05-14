import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
  GlobalKey<ScaffoldState>();
  late UnityWidgetController _unityWidgetController;

  @override
  void dispose() {
    _unityWidgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Flutter AppBar"),
        ),
        body:Container(
          margin:EdgeInsets.only(top:0),
          child:Stack(
            children: [
              Positioned(
                left:0,
                bottom:180,
                right:0,
                top:0,
                child: UnityWidget(
                  onUnityCreated: _onUnityCreated,
                  onUnityMessage: onUnityMessage,
                  onUnitySceneLoaded: onUnitySceneLoaded,
                  webUrl: 'http://localhost:6080/',
                ),
              ),
              Positioned(
                left:0,
                bottom:0,
                right:0,
                child: Container(
                  height:180,
                  color:Colors.blue,
                  child:Center(
                    child: Row(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap:(){
                            _unityWidgetController..postMessage("FootBall", "Left","" );
                          },
                          child: Container(
                            height:50,
                            width:100,
                            color:Colors.white,
                            child: Center(
                                child:Icon(Icons.arrow_back_outlined)
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            _unityWidgetController..postMessage("FootBall", "Forward","" );
                          },
                          child: Container(
                            height:100,
                            width:50,
                            color:Colors.white,
                            child: Center(
                                child:Icon(Icons.arrow_upward)
                            ),
                          ),
                        ),
                        InkWell(
                          onTap:(){
                            _unityWidgetController..postMessage("FootBall", "Right","" );
                          },
                          child: Container(
                            height:50,
                            width:100,
                            color:Colors.white,
                            child: Center(
                                child:Icon(Icons.arrow_forward)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
  void onUnityMessage(message) {
    print('Received message from unity: ${message.toString()}');
  }

  void onUnitySceneLoaded(SceneLoaded? scene) {
    print('Received scene loaded from unity: ${scene!.name}');
    print('Received scene loaded from unity buildIndex: ${scene.buildIndex}');
  }

  // Callback that connects the created controller to the unity controller
  void _onUnityCreated(controller) {
    controller.resume();
    this._unityWidgetController = controller;
  }
}
