import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(DestiniApp());

class DestiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destini',
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

final StoryBrain _storyBrain = new StoryBrain();

class StoryPage extends StatefulWidget {
  StoryPage({Key key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    _storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              buildChoiceButton(
                choice: _storyBrain.getChoice1(),
                color: Colors.red,
                onPressed: () => setState(() => _storyBrain.nextStory(1)),
              ),
              SizedBox(
                height: 20.0,
              ),
              buildChoiceButton(
                choice: _storyBrain.getChoice2(),
                color: Colors.blue,
                onPressed: () => setState(() => _storyBrain.nextStory(2)),
                visible: _storyBrain.buttonShouldBeVisible(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChoiceButton({
    String choice,
    Color color,
    VoidCallback onPressed,
    bool visible = true,
  }) {
    return Visibility(
      child: Expanded(
        flex: 2,
        child: FlatButton(
          onPressed: onPressed,
          color: color,
          child: Text(
            choice,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      visible: visible,
    );
  }
}
